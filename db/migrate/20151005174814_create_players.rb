class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
