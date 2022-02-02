class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.string :email
      t.date :date_of_birth
      t.string :gender
      t.string :marital_status
      t.integer :family_size
      t.belongs_to :user
      t.belongs_to :office

      t.timestamps
    end
  end
end
