class SessionsController < ApplicationController
  def new
  end

  def create
    def create
      user = User.find_by(name: params[:session][:name].downcase)
      if user && user.authenticate(params[:session][:password])
        # Sign the user in and redirect to the user's show page.
      else
        # Create an error message and re-render the signin form.
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end
    end

  end

  def destroy
  end
end
