class CreateAliases < ActiveRecord::Migration[7.0]
  def change
    create_table :aliases do |t|
      t.string :name
      t.belongs_to :client

      t.timestamps
    end
  end
end
