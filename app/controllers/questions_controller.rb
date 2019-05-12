class QuestionsController < ApplicationController
  #指定したactionの前に行う処理を指定する
  before_action :set_question ,only: [:edit, :update, :show, :destroy]
  before_action :login_requered ,only: [:edit, :update, :destroy, :new]

  def index
    # 更新が新しい順に並べる
    @questions = Question.page(params[:page]).per(Settings.service.PER).order('updated_at DESC')
  end

  def show
    @answer = Answer.new

  end

  def new
    @question = Question.new
  end

  def create
    #@question = Question.new(question_params.merge(user_id: current_user.id,author: current_user.name))
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = '質問を投稿しました。'
      redirect_to root_path
    else
      flash[:danger] = '質問の投稿に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:success] = '質問を更新しました。'
      redirect_to root_path
    else
      flash[:danger] = '質問の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:info] = '質問の削除に成功しました。'
    redirect_to root_path
  end

  private

    def set_question
    @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:name, :title, :content, :user_id, :author)
    end

    def login_requered
      # flash[:info] = 'ログインまたはサインアップをしてください。'
      redirect_to login_path unless current_user
    end
end
