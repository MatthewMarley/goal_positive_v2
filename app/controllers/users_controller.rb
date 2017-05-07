class UsersController < ApplicationController
    
    def index
        
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to Goal Positive #{@user.username}"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def show
        
    end
    
    def destroy
    
    end
    
    
    private
    def user_params
       params.require(:user).permit(:username, :email, :password, :admin) 
    end
    
    def require_same_user
        if current_user != @user and !current_user.admin?
            flash[:danger] = "You can only edit your own account"
            redirect_to root_path
        end
    end
    
    def require_admin
        if logged_in? and !current_user.admin?
            flash[:danger] = "Only admin users can perform that action"
            redirect_to root_path
        end
    end
    
end