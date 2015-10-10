class SessionsController < ApplicationController
    
    def new
        
    end
    
    def create
        @user = User.new({:user_id => params['user']['user_id'], :email => params['user']['email']}) 
        if !(User.exists?(user_id: @user.user_id))
            flash[:notice] = "Invalid user id/email combination"
            redirect_to login_path
        elsif User.where(user_id: @user.user_id).take.email != params['user']['email']
            flash[:notice] = "Invalid user id/email combination"
            redirect_to login_path
        else
            session[:session_token] = User.where(user_id: @user.user_id).take.session_token
            flash[:notice] = "You are logged in as #{@user.user_id}"
            redirect_to movies_path
        end
    end
    
    def destroy
        reset_session
        redirect_to movies_path
    end
end