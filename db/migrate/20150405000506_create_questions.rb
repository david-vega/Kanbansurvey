class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.string :category
      t.string :type
      t.integer :level
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :user_id

      t.timestamps
    end
  end
end
