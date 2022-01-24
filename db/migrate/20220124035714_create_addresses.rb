class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :client
      t.string :address_type
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :time_at_address

      t.timestamps
    end
  end
end
