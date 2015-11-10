#
class User < ActiveRecord::Base
  include Authentication

  has_many :holidays #through?
  has_many :recipients
end
