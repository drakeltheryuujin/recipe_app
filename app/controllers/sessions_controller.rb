class SessionsController < ApplicationController
  
  def new
    
  end

  def create
  	if @user = User.find_by(name: params[:name])
  		if @user.authenticate(params[:password])
  		    session[:user_id] = @user.id
  		    redirect_to "/profile" 
  		else 
  			flash[:message] = "try again"
  	    redirect_to '/sign_in' 
  	  end
    else 
      flash[:message] = "who are you?"
        redirect_to '/sign_in' 
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
