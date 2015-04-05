class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :survey_id
      t.string :response

      t.timestamps
    end
  end
end
