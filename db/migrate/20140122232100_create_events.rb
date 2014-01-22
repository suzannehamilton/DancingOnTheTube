class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :organisation, index: true

      t.timestamps
    end
  end
end
