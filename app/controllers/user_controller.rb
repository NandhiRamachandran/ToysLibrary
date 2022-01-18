class UserController < ApplicationController

    def login
      @user=User.new
    end

    def signup
      @user=User.new
    end
    
    def new
      @user= User.new
    end

    def create 
      @user= User.new(user_params)
      if @user.save
        session[:user_id]= @user.id
        redirect_to :action => "login", notice: "Successfully crated account"
      else
        render :action => "singup" 
      end
    end
    private

    def user_params
        
      params.requrire(:user).permite(:email, :password, :conformpassword)
    end
end      
