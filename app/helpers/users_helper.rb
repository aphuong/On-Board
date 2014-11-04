module UsersHelper
  def current_user?(user)
    user == current_user
  end

  def current_admin?(admin)
    admin == current_admin
  end
end
