class CreateEmploymentInsuranceClaims < ActiveRecord::Migration[7.0]
  def change
    create_table :employment_insurance_claims do |t|
      t.belongs_to :client
      t.date :start_date
      t.date :end_date
      t.string :location

      t.timestamps
    end
  end
end
