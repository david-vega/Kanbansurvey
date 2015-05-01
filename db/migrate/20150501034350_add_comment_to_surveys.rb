class AddCommentToSurveys < ActiveRecord::Migration
  def change
  	add_column :surveys, :comment, :string
  end
end
