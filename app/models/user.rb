#
class User < ActiveRecord::Base
  include Authentication

  has_many :holidays, :recipients
end
