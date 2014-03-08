class NotesController < ApplicationController
  respond_to :json
  # GET /notes
  # GET /notes.json
  def index
      @user = User.find_by_remember_token(params[:token])
      if @user.nil?
        render :nothing => true, :status => 401
      else
        render json: @user.notes.to_json
      end
  end


end