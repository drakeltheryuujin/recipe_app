class SessionsController < ApplicationController
  
  def new
    
  end

  def create
  	if @user = User.find_by(name: params[:name])
  		if @user.authenticate(params[:password])
  		    session[:user_id] = @user.id
  		    redirect_to "/profile" 
  		else 
  			flash[:message] = "Sorry, we don't recognize that password. Please try again."
  	    redirect_to '/sign_in' 
  	  end
    else 
      flash[:message] = "Sorry, we don't recognize that user. Please try again."
        redirect_to '/sign_in' 
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
