class CreateWeeklyRecurrences < ActiveRecord::Migration
  def change
    create_table :weekly_recurrences do |t|
      t.references :event, index: true
      t.integer :day_of_week
      t.integer :frequency
      t.date :end_date

      t.timestamps
    end
  end
end
