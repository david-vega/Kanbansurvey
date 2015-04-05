class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.string :category
      t.integer :level
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
