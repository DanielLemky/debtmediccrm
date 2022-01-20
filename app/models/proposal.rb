class Proposal < ApplicationRecord
  has_many :client_proposals
  belongs_to :user
end
