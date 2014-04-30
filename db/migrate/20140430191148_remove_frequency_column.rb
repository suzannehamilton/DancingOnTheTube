class RemoveFrequencyColumn < ActiveRecord::Migration
  def change
    remove_column :weekly_recurrences, :frequency
  end
end
