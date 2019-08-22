class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

PER = 9

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

  def index
    @q = User.ransack(params[:q])
    @words = Word.page(params[:page]).per(PER)
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
      redirect_to words_path, notice: "登録されていた言葉を削除しました"
    else
      render 'edit'
    end
  end

  private
  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:title, :word, :source, :comment, :picture, :picture_cache)
  end

end
