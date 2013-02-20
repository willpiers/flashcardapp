class SessionsController < ApplicationController
  def new
  	@person = Person.new
  end

  def create
  	@person = Person.find_by_twitter(params[:twitter])
  	if @person
  		session[:user_id] = @person.id
  		flash[:success] = "Signed In!"
  		redirect_to root_url
  	else
  		flash.now.alert = "Invalid Twitter"
  		render 'new'
  	end
  end

  def destroy
  	reset_session
  	flash[:success] = "Signed Out"
  	redirect_to root_url
  end
end
