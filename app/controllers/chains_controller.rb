class ChainsController < ApplicationController
   before_action :require_user, except: [:index]
   
    def index
        @chains = Chain.all
    end
    
    def new
        @chain = Chain.new
    end
    
    def create
        @chain = Chain.new(chain_params)
        # Assign user id to Chain table
        @chain.user_id = current_user.id
        if @chain.save
            flash[:success] = "Your chain has been created successfully!"
            redirect_to root_path
        else
            flash[:danger] = "Error occurred"
            redirect_to root_path
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
    def chain_params
        params.require(:chain).permit(:name, :pledge)
    end
    
end