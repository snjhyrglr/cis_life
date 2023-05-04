class CreateProcessRemarks < ActiveRecord::Migration[7.0]
  def change
    create_table :process_remarks do |t|
      t.references :reference, polymorphic: true#, null: false
      t.text :remark
      t.references :user, polymorphic: true#, null: false

      t.timestamps
    end
  end
end
