class Member < ActiveRecord::Base
  self.primary_key = "member_id"
  has_many :addresses
end
