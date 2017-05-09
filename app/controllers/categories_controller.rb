class CategoriesController < ApplicationController
   
   
   
    def index
        @categories = Category.all
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "You have successfully added a new category"
            redirect_to categories_path
        else
            flash[:danger] = "Unable to create new category"
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def show
        @category = Category.find(params[:id])
    end


    private
    def category_params
        params.require(:category).permit(:name)
    end
    
    def require_admin
        if !logged_in? || (logged_in? and !current_user.admin?)
            flash[:danger] = "This action is restricted to admins"
            redirect_to categories_path
        end
    end
    
 
end