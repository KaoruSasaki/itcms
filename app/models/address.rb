class Address < ActiveRecord::Base
  self.primary_key = "address_id"
  belongs_to :member
end
