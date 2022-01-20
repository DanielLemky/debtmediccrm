class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.belongs_to :client
      t.string :name
      t.string :business_type
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :province
      t.string :structure
      t.string :loans_guaranteed
      t.text :details
      t.string :location_of_records
      t.date :last_financial_statement
      t.string :year_end
      t.integer :share_percentage

      t.timestamps
    end
  end
end
