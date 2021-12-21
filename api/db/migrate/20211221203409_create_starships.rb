class CreateStarships < ActiveRecord::Migration[7.0]
  def change
    create_table :starships do |t|
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end
  end
end
