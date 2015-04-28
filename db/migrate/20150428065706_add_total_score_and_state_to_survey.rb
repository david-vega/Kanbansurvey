class AddTotalScoreAndStateToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :total_score, :float
    add_column :surveys, :state, :string
  end
end
