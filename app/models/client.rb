class Client < ApplicationRecord
  enum role:{ primary: "primary", secondary: "secondary" }
end
