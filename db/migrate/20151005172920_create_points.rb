class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :group_id
      t.references :user, index: true#, foreign_key: true
      t.string :player, default: 'pessoa'
      t.string :choice

      t.timestamps null: false
    end
  end
end
