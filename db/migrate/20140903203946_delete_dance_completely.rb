class DeleteDanceCompletely < ActiveRecord::Migration
  def up
    drop_table :dances
  end

  def down
    create_table :dances do |t|
      t.string :name

      t.timestamps
    end
  end
end
