class UpdateDataTypeTotalScore < ActiveRecord::Migration
  def change
  	change_column :surveys, :total_score, :string
  end
end
