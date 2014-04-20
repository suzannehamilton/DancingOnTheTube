class RemoveEventStartDate < ActiveRecord::Migration
  def change
    remove_column :events, :start_date
  end
end
