class CreateProposalInsureds < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_insureds do |t|
      t.references :proposal#, null: false, foreign_key: true
      t.references :insured_type#, null: false, foreign_key: true
      t.decimal :total_prem, precision: 15, scale: 2

      t.timestamps
    end
  end
end
