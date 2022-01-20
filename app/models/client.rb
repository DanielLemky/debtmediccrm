class Client < ApplicationRecord
  has_many :client_proposals
  enum role:{ primary: "primary", secondary: "secondary" }
end
