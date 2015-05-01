class RemoveCommentFromAnswers < ActiveRecord::Migration
  def change
  	remove_column :answers, :comment
  end
end
