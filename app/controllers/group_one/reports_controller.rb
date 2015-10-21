module GroupOne
  class ReportsController < ApplicationController
    
    def index
      @players = Player.where(group_id: 1).limit(90)
    end

    def show
      @player = Player.find(params[:id])
    end
  end
end