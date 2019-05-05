class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
      if @answer.update(answer_params)
        flash[:success] = '回答を投稿しました。'
        redirect_to question_path(@question)
      else
        flash[:danger] = '回答の投稿に失敗しました。'
        redirect_to question_path(@question)
      end
  end
  
  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      flash[:success] = '回答の編集をしました。'
      redirect_to question_path(@question)
    else
      flash[:danger] = '回答の編集に失敗しました。'
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    flash[:info] = '回答を削除しました。'
    redirect_to question_path(@question)
  end

  private
    def answer_params
    params.require(:answer).permit(:content, :name, :question_id)
    end
end
