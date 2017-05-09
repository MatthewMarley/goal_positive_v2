class ChainsController < ApplicationController
   before_action :require_user, except: [:index]
   
    def index
        @chains = Chain.paginate(page: params[:page], per_page: 12)
        @chains_search = Chain.search(params[:search])
        # @users = User.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @chain = Chain.new
    end
    
    def create
        @user = current_user
        @chain = Chain.new(chain_params)
        # Assign user id to Chain table
        @chain.user_id = current_user.id
        if @chain.save
            flash[:success] = "Your chain has been created successfully!"
            redirect_to user_path(@user)
        else
            flash[:danger] = "Error occurred"
            redirect_to new_chain_path
        end
    end
    
    def edit
        @chain = Chain.find(params[:id])
    end
    
    def update
        @chain = Chain.find(params[:id])
        if @chain.update(chain_params)
            flash[:success] = "Chain successfully updated!"
            redirect_to user_path(current_user)
        else
            render 'edit'
        end
    end
    
    def show
       
    end
    
    def destroy
        @user = current_user
        @chain = Chain.find(params[:id])
        if @chain.destroy
            flash[:success] = "Chain was successfully deleted"
            redirect_to user_path(@user)
        else
            flash[:danger] = "Chain unable to be destroyed"
            redirect_to user_path(@user)
        end
    end
   
    private
    def chain_params
        params.require(:chain).permit(:name, :pledge)
    end
    
end