class CreateProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :proposals do |t|
      t.boolean :joint
      t.belongs_to :user

      t.timestamps
    end
  end
end
