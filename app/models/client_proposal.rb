class ClientProposal < ApplicationRecord
  belongs_to :client
  belongs_to :proposal
  enum role:{ primary: "primary", secondary: "secondary" }
end
