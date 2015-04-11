class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :survey_id
      t.boolean :response
      t.text :comment

      t.timestamps
    end
  end
end
