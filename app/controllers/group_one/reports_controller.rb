module GroupOne
  class ReportsController < ApplicationController
    
    def index
      @players = Player.where(group_id: 1)
    end

  end
end