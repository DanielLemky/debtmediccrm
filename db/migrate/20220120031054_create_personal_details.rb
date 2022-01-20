class CreatePersonalDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_details do |t|
      t.belongs_to :client
      t.date :date_of_birth
      t.integer :marital_status
      t.integer :gender
      t.integer :family_size

      t.timestamps
    end
  end
end
