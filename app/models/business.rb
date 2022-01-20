class Business < ApplicationRecord
  belongs_to :client
  has_many :business_debts
end
