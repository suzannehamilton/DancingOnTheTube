class CreateJoinTableLocationOrganisation < ActiveRecord::Migration
  def change
    create_join_table :locations, :organisations do |t|
    end
  end
end
