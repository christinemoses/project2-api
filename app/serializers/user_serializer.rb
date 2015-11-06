# this lets the front end determine if the current user can edit something like a comment they made - this is the defauls serializer
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :current_user # we set here what other users will be able to see about users on the site (email only or nothing or name or id or a combo of these things)

  def current_user
    scope == object
  end
end
