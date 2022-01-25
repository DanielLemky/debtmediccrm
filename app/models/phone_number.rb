class PhoneNumber < ApplicationRecord
  belongs_to :client

  enum number_type:{ mobile: "mobile", home: "home", work: "work" }
end
