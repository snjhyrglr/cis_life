class CreateHealthDecQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :health_dec_questions do |t|
      t.text :question_1
      t.text :question_2
      t.text :question_3
      t.text :question_3_desc
      t.text :question_4
      t.text :question_4_desc
      t.text :question_5_a
      t.text :question_5_a_desc
      t.text :question_5_b
      t.text :question_5_b_desc

      t.timestamps
    end
  end
end
