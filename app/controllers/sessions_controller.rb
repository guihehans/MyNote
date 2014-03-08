class SessionsController < ApplicationController
  respond_to :html,:json
  def new
  end

  def create
      @user = User.find_by(name: params[:session][:name])
      if @user == User.find_by(password: params[:session][:password])
        # Sign the user in and redirect to the user's show page.
        sign_in @user
        render :json => @user.to_json
        return
      end
      else
        # Create an error message and re-render the signin form.
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end
  end

  def destroy
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

