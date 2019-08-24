class ApplicationController < ActionController::Base

  before_action :set_search

  PER = 9

  def set_search
    @search = Word.ransack(params[:q])
    # @tags = ActsAsTaggableOn::Tag.all
    if params[:tag_name]
      words = Word.tagged_with(params[:tag_name].to_s)
      @search_words = words.includes(:user,:taggings).page(params[:page]).per(PER)
    else
      @search_words = @search.result(distinct: true).includes(:user,:taggings).page(params[:page]).per(PER)
    end
  end

  # for CSRF measure
  protect_from_forgery with: :exception

  # permit only loginned users
  before_action :authenticate_user!

  # add strong parameters to devise controllers
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # add strong parameter of 'name' in sign_up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon, :icon_cache, :remove_icon])
    # add strong parameters of 'name' and 'icon' in account edit
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon, :icon_cache, :remove_icon])
  end

  # move words/index after login
  def after_sign_in_path_for(resource)
    words_path
  end

end
