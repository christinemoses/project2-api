class Recipient < ActiveRecord::Base
  belongs_to :holiday

  has_many :gift_ideas
end
