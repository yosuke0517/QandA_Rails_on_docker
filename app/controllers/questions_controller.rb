class QuestionsController < ApplicationController
  #指定したactionの前に行う処理を指定する
  before_action :set_question ,only: [:edit, :update, :show, :destroy]
  before_action :login_requered ,only: [:edit, :update, :destroy, :new]

  def index
    # 更新が新しい順に並べる
    # application_controllerにてset_searchメソッドで@questionsを拾って来ている
    # 「||=」 ... 変数@questionsの値がnilなら代入するが、nilでなければ代入しない (@current_userの値を変えない)
    # @questions ||= Question.page(params[:page]).per(Settings.service.PER).order('updated_at DESC')

    # if params[:q].present?
    #   render json:  @questions.select("title").map { |e| e.title  }.to_json
    # end
    # ajaxで送られた場合にはjsonを変えす
    unless params[:q].blank?
      render json: @questions.select("title").map { |e| e.title  }.to_json
    end
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if params[:back].present?
     render :new
      return
    end
    if @question.save
      #ログ出力
      logger.debug "question: #{@question.attributes.inspect}"
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

  def confirm_new
    @question = current_user.questions.new(question_params)
    #質問の検証で問題がある場合はエラーメッセージと共に新規登録画面へ戻す
    render :new unless @question.valid?
  end

  private

    def set_question
    @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:name, :title, :content, :user_id, :author)
    end

    def login_requered
      unless current_user
        flash[:warning] = 'ログインまたはサインアップをしてください。'
        redirect_to login_path
      end
    end

end
