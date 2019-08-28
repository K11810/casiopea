class ApplicationController < ActionController::Base
  # for CSRF measure
  protect_from_forgery with: :exception
  # permit only loginned users
  before_action :authenticate_user!
  # add strong parameters to devise controllers
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  PER = 9

  def set_search
    @search = Word.ransack(params[:q])
    # @tags = ActsAsTaggableOn::Tag.all
    if params[:tag_name]
      words = Word.tagged_with(params[:tag_name].to_s)
      @search_words = words.includes(:user,:taggings).order(created_at: :desc).page(params[:page]).per(PER)
    else
      @search_words = @search.result(distinct: true).includes(:user,:taggings).order(created_at: :desc).page(params[:page]).per(PER)
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon, :icon_cache, :remove_icon])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon, :icon_cache, :remove_icon])
  end

  # move words/index after login
  def after_sign_in_path_for(resource)
    words_path
  end

  # forbid login-user's access
  def forbid_login_user
    if current_user
      redirect_to words_path, notice: "すでにログイン中です"
    end
  end

end
