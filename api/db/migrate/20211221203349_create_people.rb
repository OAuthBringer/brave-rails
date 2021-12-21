class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.jsonb :data, null: false, default: {}
      t.timestamps
    end
  end
end
