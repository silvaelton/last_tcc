module GroupThree
  class TurnsController < ApplicationController
    
    def welcome
    end

    def start
      session[:turn] = nil
      session[:player_turn] = nil
      session[:user_id] = nil
    end
    
    def name
      if params[:player].present? && params[:player][:name].present?
        @user = Player.new(name: params[:player][:name], group_id: 3)
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
      @bingo_player = false
      @bingo_cpu = false
      
      session[:turn]        = 1 if session[:turn].nil?
      session[:player_turn] = 0 if session[:player_turn].nil?

      if session[:turn].to_i == 90 && session[:player_turn].to_i == 2
         session[:turn] += 1
      end

      if session[:turn].to_i <= 90
        session[:player_turn] += 1
        
        if session[:player_turn] == 3
          session[:player_turn] = 1
          session[:turn] += 1 
        end
      else
        redirect_to action: 'success'
      end

      if session[:turn].to_i <= 20
        @computer = "Objeto"
      end

      if session[:turn].to_i > 20 && session[:turn].to_i <= 32 
        @computer = 'Animal' if %w(21 23 26 30 31).include? session[:turn].to_s
        @computer = 'Objeto' if %w(22 24 25 29 32).include? session[:turn].to_s
        @computer = 'Humano' if %w(27 28).include? session[:turn].to_s
      end

      if session[:turn].to_i > 32 && session[:turn].to_i <= 90
        @computer = "Humano"
      end

      @turn   = session[:turn]
      @round  = @turn
      @player_turn = session[:player_turn]
      
      if session[:player_turn] == 1
        @image_types = ['Animal', 'Humano', 'Objeto'].shuffle
        @image_codes = [rand(1..21), rand(1..21), rand(1..21)]
        session[:image_codes] = @image_codes
        session[:image_types] = @image_types
      else
        @image_codes = session[:image_codes]
        @image_types = session[:image_types]
      end
      

      @player = Player.find(session[:user_id])


      
      if session[:current_point_player].nil?
        session[:current_point_player] = @player.point_grupo_two_person 
      else
        if session[:current_point_player] != @player.point_grupo_two_person
          @bingo_player =  true
          session[:current_point_player] = @player.point_grupo_two_person 
        end
      end

      if session[:current_point_cpu].nil?
        session[:current_point_cpu] = @player.point_grupo_two_cpu 
      else
        if session[:current_point_cpu] != @player.point_grupo_two_cpu
          @bingo_cpu =  true
          session[:current_point_cpu] = @player.point_grupo_two_cpu 
        end
      end

      @images = [@image_types, @image_codes]
    end

    def point
      if params[:choice].present?
        @player = (session[:player_turn] == 1) ? 'pessoa' : 'computador'

        @point = Point.new(group_id: 3, choice: params[:choice], player: @player, user_id: session[:user_id])
        
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