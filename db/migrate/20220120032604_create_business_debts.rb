class CreateBusinessDebts < ActiveRecord::Migration[7.0]
  def change
    create_table :business_debts do |t|

      t.timestamps
    end
  end
end
