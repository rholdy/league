class Summoner < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :summoner_name, :in_game_id, :summoner_level, :summoner_icon, :server, :honor_friendly, :honor_helpful, :honor_teamwork, :honor_opponent, :lifetime_ip, :season_one, :season_two
  validates :summoner_level, presence: true
  validates :in_game_id, uniqueness: { scope: :user_id,
    message: "Can only add each summoner once" }
end



