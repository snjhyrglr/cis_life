class CreateProposalInsuredLoadings < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_insured_loadings do |t|
      t.references :proposal_insured#, null: false, foreign_key: true
      t.references :gyrt_loading#, null: false, foreign_key: true
      t.string :name
      t.decimal :rate, precision: 15, scale: 4

      t.timestamps
    end
  end
end
