class CreateProposalAnnivs < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_annivs do |t|
      t.references :proposal#, null: false, foreign_key: true
      t.references :anniv_type#, null: false, foreign_key: true
      t.string :mon
      t.integer :day

      t.timestamps
    end
  end
end
