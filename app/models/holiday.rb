#
class Holiday < ActiveRecord::Base
  belongs_to :user #inverse of?
end
