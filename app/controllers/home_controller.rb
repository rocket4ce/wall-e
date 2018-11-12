class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
    @new_comment = current_user.comments.new
  end
end
