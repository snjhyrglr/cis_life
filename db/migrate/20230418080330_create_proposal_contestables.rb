class CreateProposalContestables < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_contestables do |t|
      t.references :proposal#, null: false, foreign_key: true
      t.references :contestability#, null: false, foreign_key: true

      t.timestamps
    end
  end
end
