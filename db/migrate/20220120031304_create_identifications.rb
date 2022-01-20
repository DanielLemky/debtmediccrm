class CreateIdentifications < ActiveRecord::Migration[7.0]
  def change
    create_table :identifications do |t|
      t.belongs_to :client
      t.string :drivers_license
      t.string :social_insurance_number

      t.timestamps
    end
  end
end
