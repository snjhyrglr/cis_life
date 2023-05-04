class AddColumnsToBatchHealthDec < ActiveRecord::Migration[7.0]
  def change
    add_column :batch_health_decs, :ans_q1, :string
    add_column :batch_health_decs, :ans_q2, :string
    add_column :batch_health_decs, :ans_q3, :string
    add_column :batch_health_decs, :ans_q3_desc, :string
    add_column :batch_health_decs, :ans_q4, :string
    add_column :batch_health_decs, :ans_q4_desc, :string
    add_column :batch_health_decs, :ans_q5_a, :string
    add_column :batch_health_decs, :ans_q5_a_desc, :string
    add_column :batch_health_decs, :ans_q5_b, :string
    add_column :batch_health_decs, :ans_q5_b_desc, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
