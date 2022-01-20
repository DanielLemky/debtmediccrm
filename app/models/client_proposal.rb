class ClientProposal < ApplicationRecord
  belongs_to :client
  belongs_to :proposal
end
