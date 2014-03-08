class SessionsController < ApplicationController
  respond_to :json

  def new
  end

  def create
      @user = User.find_by(name: params[:name])
      if @user.password == params[:password]
        # Sign the user in and redirect to the user's show page.
        sign_in @user
        render :json => {token:@user.remember_token}.to_json
        return
      end
      else
        # Create an error message and re-render the signin form.
        render :nothing => true, :status => 401
      end
  end



  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end


  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

