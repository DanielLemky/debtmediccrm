class Identification < ApplicationRecord
  belongs_to :client

  enum id_type:{ drivers_license: "drivers_license", sin: "sin" }
end
