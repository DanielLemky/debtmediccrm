class Address < ApplicationRecord
  belongs_to :client
  enum address_type:{ current: "current", past: "past" }
end
