class UsersController < ApplicationController
  before_action :authenticate_user!

  def get_users
    @users = User.all
    respond_to do |format|
      format.json
    end
  end

end
