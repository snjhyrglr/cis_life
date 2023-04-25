class AddSuffixToOfficer < ActiveRecord::Migration[7.0]
  def change
    add_column :officers, :suffix, :string
  end
end
