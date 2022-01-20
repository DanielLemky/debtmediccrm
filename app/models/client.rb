class Client < ApplicationRecord
  has_many :client_proposals
  has_one :alias
  has_one :personal_detail
  has_many :phone_numbers
  has_one :current_address
  has_one :identification
  has_many :employments
  enum role:{ primary: "primary", secondary: "secondary" }
end
