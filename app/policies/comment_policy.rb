class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def edit?
    update?
  end

  def update?
    authorize_role
  end

  def destroy?
    authorize_role
  end

  private

    def authorize_role
      puts "&&&&&&&&&&&&&&&"
      puts user == comment.user
      puts "&&&&&&&&&&&&&&&"
        user.admin? || user == comment.user
    end
end
