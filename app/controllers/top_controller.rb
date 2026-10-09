class TopController < ApplicationController

    def main
        if session[:login_uid]
            render top_login_path
        else
            render top_main_path
        end
    end

    def login
        user = User.find_by(uid: params[:uid])
        if user&&user.pass==params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to top_main_path
        else
            render "error", status: :unprocessable_entity
        end
    end

    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
