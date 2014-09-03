class DeleteDances < ActiveRecord::Migration
  def up
    drop_table :dances_organisations
  end

  def down
    create_join_table :dances, :organisations do |t|
    end
  end
end
