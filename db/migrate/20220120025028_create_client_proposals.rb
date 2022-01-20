class CreateClientProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :client_proposals do |t|
      t.belongs_to :client
      t.belongs_to :proposal
      t.string :client_role
    end
  end
end
