class CreatePhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.integer :number_type
      t.belongs_to :client

      t.timestamps
    end
  end
end
