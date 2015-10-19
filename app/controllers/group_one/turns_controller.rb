module GroupOne
  class TurnsController < ApplicationController
    
    def welcome
    end

    def start
      session[:turn] = nil
      session[:user_id] = nil
    end
    
    def name
      if params[:player].present? && params[:player][:name].present?
        @user = Player.new(name: params[:player][:name], group_id: 1)
        if @user.save 
          session[:user_id] = @user.id
          redirect_to action: 'loop'
        else
          redirect_to action: 'start'
        end
      else
        redirect_to action: 'start'
      end
    end

    def loop
      @bingo = false
      session[:turn]    = 0 if session[:turn].nil?
     
      if session[:turn].to_i < 90
        session[:turn] += 1 
      else
        redirect_to action: 'success'
      end

      @turn   = session[:turn]
      @round  = @turn
      
      @image_types = ['Animal', 'Humano', 'Objeto'].shuffle
      @image_codes = [rand(1..21), rand(1..21), rand(1..21)]

      @player = Player.find(session[:user_id])

      if session[:current_point].nil?
        session[:current_point] = @player.point_grupo_one 
      else
        if session[:current_point] != @player.point_grupo_one
          @bingo =  true
          session[:current_point] = @player.point_grupo_one 
        end
      end
      
      @images = [@image_types, @image_codes]
    end

    def point
      if params[:choice].present?
        @point = Point.new(group_id: 1, choice: params[:choice], user_id: session[:user_id])
        
        if @point.save
          redirect_to action: 'loop'
        end
      end
    end

    def success
      @name = Player.find(session[:user_id]).name
    end

  end
end