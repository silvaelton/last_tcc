module GroupTwo
  class ReportsController < ApplicationController
    
    def index
      @players = Player.where(group_id: 2)
    end

  end
end