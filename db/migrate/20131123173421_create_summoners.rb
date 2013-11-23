class CreateSummoners < ActiveRecord::Migration
  def change
    create_table :summoners do |t|
      t.references :user
      t.string :summoner_name
      t.string :in_game_id
      t.string :summoner_level
      t.string :summoner_icon
      t.string :server
      t.integer :honor_friendly
      t.integer :honor_helpful
      t.integer :honor_teamwork
      t.integer :honor_opponent
      t.integer :lifetime_ip
      t.string :season_one
      t.string :season_two

      t.timestamps
    end
    add_index :summoners, :user_id
  end
end
