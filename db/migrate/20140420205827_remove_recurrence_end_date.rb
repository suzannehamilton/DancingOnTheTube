class RemoveRecurrenceEndDate < ActiveRecord::Migration
  def change
    remove_column :weekly_recurrences, :end_date
  end
end
