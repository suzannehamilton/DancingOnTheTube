class CreateJoinTableDanceOrganisation < ActiveRecord::Migration
  def change
    create_join_table :dances, :organisations do |t|
    end
  end
end
