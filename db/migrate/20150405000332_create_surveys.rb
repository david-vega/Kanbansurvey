class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.string :external_id, index: true

      t.timestamps
    end
  end
end
