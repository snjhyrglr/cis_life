class CreateProposalOfficers < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_officers do |t|
      t.references :proposal#, null: false, foreign_key: true
      t.references :officer#, null: false, foreign_key: true

      t.timestamps
    end
  end
end
