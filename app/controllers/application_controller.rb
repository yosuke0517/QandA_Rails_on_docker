class ApplicationController < ActionController::Base
    helper_method :current_user

    private

    def current_user
        #セッションidからログインしているユーザを求める。
        #変数@current_userの値がnilなら代入するが、nilでなければ代入しない (@current_userの値を変えない)
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

end
