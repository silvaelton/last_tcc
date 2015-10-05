class Player < ActiveRecord::Base
  has_many :points, foreign_key: 'user_id'

  def point
    0  
  end
end
