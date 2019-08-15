class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to words_path, notice: "新しい言葉を登録しました"
    else
      render 'new'
    end
  end

  def index
    @words = Word.all
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
    params.require(:word).permit(:title, :word, :source, :comment, :picture)
  end

end