module GroupThree
  class ReportsController < ApplicationController
    
    def index
      @players = Player.where(group_id: 3).limit(180)
    end

    def show
      @player = Player.find(params[:id])
    end

  end
end