class CreateProposalInsuredBenefits < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_insured_benefits do |t|
      t.references :proposal_insured#, null: false, foreign_key: true
      t.references :benefit#, null: false, foreign_key: true
      t.decimal :cov_amount, precision: 15, scale: 2
      t.decimal :premium, precision: 15, scale: 2

      t.timestamps
    end
  end
end
