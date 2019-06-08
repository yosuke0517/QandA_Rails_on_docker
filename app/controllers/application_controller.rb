class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :set_search

    private

    def current_user
        #セッションidからログインしているユーザを求める。
        #変数@current_userの値がnilなら代入するが、nilでなければ代入しない (@current_userの値を変えない)
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def set_search
        @search = Question.ransack(params[:q])
        @questions = @search.result.page(params[:page]).per(Settings.service.PER).order('updated_at DESC')

        # ajaxで送られた場合にはjsonを変えす
        unless params[:q].blank?
            render json: @questions.select("title").map { |e| e.title  }.to_json
        end
    end

end
