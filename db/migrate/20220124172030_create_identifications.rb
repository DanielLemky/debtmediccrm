class CreateIdentifications < ActiveRecord::Migration[7.0]
  def change
    create_table :identifications do |t|
      t.belongs_to :client
      t.string :id_type
      t.string :number
      t.date :expiry_date

      t.timestamps
    end
  end
end
