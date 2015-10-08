class UsersController < ApplicationController
   
   def user_params
     params.require(:user).permit(:user_id, :email)
   end
   
   def new
   
   end
   
   def create
   
   end
end