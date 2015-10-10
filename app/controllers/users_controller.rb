class UsersController < ApplicationController
   
   before_filter :set_current_user

   
   def user_params
     params.require(:user).permit(:user_id, :email, :session_token)
   end
   
   def new

   end
   
   def create
      @user = User.new(user_params)
      if User.exists?(user_id: @user.user_id)
         flash[:notice] = "User ID is taken"     
         redirect_to "/users/new"
      else
         @user.create_user!({"user_id" => @user.user_id, "email" => @user.email})
         flash[:notice] = "Welcome #{@user.user_id}. Your account has been created"
         redirect_to login_path
      end
   end
end