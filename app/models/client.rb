class Client < ApplicationRecord
  belongs_to :office
  belongs_to :user
  has_many :client_proposals
  has_one :alias
  has_many :phone_numbers
  has_many :addresses
  has_many :identifications
  has_many :employments
  has_many :family_members
  has_many :businesses
  has_many :business_debts, through: :businesses
  has_many :employment_insurance_claims
  has_many :notes

  enum gender:{ male: "male", female: "female" }
  enum marital_status:{ single: "single", married: "married", common_law: "comman-law", separated: "separated", divorced: "divoreced" }
end
