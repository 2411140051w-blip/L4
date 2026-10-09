class TopController < ApplicationController

    def main
        if session[:login_uid]
            render top_login_path
        else
            render top_main_path
        end
    end

    def login
        if params[:uid]=="kindai"&&params[:pass]=="sanriko"
            session[:login_uid] = params[:uid]
            redirect_to top_main_path
        else
            render "error"
        end
    end
end
