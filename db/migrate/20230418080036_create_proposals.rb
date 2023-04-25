class CreateProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :proposals do |t|
      t.references :plan#, null: false, foreign_key: true
      t.references :cooperative#, null: false, foreign_key: true
      t.string :proposal_no
      t.integer :new_min_age
      t.integer :new_max_age
      t.integer :old_min_age
      t.integer :old_max_age
      t.integer :ave_age
      t.integer :member_count
      t.decimal :total_premium
      t.decimal :coop_sf
      t.decimal :agent_sf
      t.boolean :actuarial_approval
      t.boolean :agent_approval
      t.decimal :nel_amount
      t.decimal :nml_amount

      t.timestamps
    end
  end
end
