class CreateFamilyMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :family_members do |t|
      t.belongs_to :client
      t.string :first_name
      t.string :last_name
      t.string :relationship
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :province
      t.string :postal_code
      t.date :date_of_birth
      t.string :income

      t.timestamps
    end
  end
end
