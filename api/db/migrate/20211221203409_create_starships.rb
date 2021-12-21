class CreateStarships < ActiveRecord::Migration[7.0]
  def change
    create_table :starships do |t|

      t.timestamps
    end
  end
end
