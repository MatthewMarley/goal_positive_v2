class PagesController < ApplicationController
    
  def home
      
  end
  
  def about
      
  end
  
  def admin
    @users = User.all
  end
  
end