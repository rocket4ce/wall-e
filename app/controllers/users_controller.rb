class UsersController < ApplicationController

  def get_users
    @users = User.all
    respond_to do |format|
      format.json
    end
  end

end
