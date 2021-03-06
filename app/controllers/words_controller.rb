class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit,:update,:destroy]

  def new
    @word = Word.new
  end

  def create
    @word = current_user.words.build(word_params)
    if @word.save
      ContactMailer.contact_mail(@word).deliver
      redirect_to words_path, notice: "新しい言葉を登録しました"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @word.destroy
    redirect_to words_path, notice:"登録されていた言葉を削除しました"
  end

  def update
    if @word.update(word_params)
      redirect_to words_path, notice: "登録されていた言葉を更新しました"
    else
      render 'edit'
    end
  end


  private
  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(
      :title,
      :word,
      :source,
      :comment,
      :picture,
      :picture_cache,
      :remove_picture,
      :tag_list,
    )
  end

  # ログインユーザのみ投稿の編集・削除許可
  def ensure_correct_user
    if current_user.id != @word.user_id
      redirect_to words_path, notice: "権限がありません"
    end
  end


end
