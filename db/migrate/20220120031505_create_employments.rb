class CreateEmployments < ActiveRecord::Migration[7.0]
  def change
    create_table :employments do |t|
      t.belongs_to :client
      t.string :employment_type
      t.string :employer
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :province
      t.string :position
      t.date :start_date
      t.date :end_date
      t.boolean :current

      t.timestamps
    end
  end
end
