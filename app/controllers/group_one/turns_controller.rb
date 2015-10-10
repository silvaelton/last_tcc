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
      session[:turn]    = 0 if session[:turn].nil?
      session[:animal]  = 0  if session[:animal].nil?
      session[:humano]  = 0  if session[:humano].nil?
      session[:objeto]  = 0  if session[:objeto].nil?

      if session[:turn].to_i < 90
        if session[:turn].to_i <= 10
          @ponto  = Hash.new
          @ponto['Animal'] = "1 Ponto"
          @ponto['Objeto'] = "Não pontua!"
          @ponto['Humano'] = "Não pontua!"
        end

        if session[:turn].to_i > 10 && session[:turn].to_i <= 50
          @ponto  = Hash.new
          @ponto['Animal'] = ((session[:animal].to_i % 2) == 0) ? "1 Ponto" : "Não pontua"
          @ponto['Objeto'] = ((session[:objeto].to_i % 4) == 0) ? "1 Ponto" : "Não pontua"
          @ponto['Humano'] = "1 Ponto"
        end

        if session[:turn].to_i > 50
          @ponto  = Hash.new
          @ponto['Animal'] = ((session[:animal].to_i % 2) == 0) ? "1 Ponto" : "Não pontua"
          @ponto['Objeto'] = "Não pontua"
          @ponto['Humano'] = "1 Ponto"
        end
        session[:turn] += 1
      else
        redirect_to action: 'success'
      end

      @turn   = session[:turn]
      @round  = @turn
      
      @image_types = ['Animal', 'Humano', 'Objeto'].shuffle
      @image_codes = [rand(1..21), rand(1..21), rand(1..21)]

      @player = Player.find(session[:user_id])
      @images = [@image_types, @image_codes]
    end

    def point
      if params[:choice].present?
        @point = Point.new(group_id: 1, choice: params[:choice], user_id: session[:user_id])

        if session[:turn].to_i > 10 && session[:turn].to_i <= 50
          if params[:choice] == "Animal"
            session[:animal] = 1  if session[:animal].nil?
            session[:animal] += 1 if session[:animal].present?
          end

          if params[:choice] == "Objeto"
            session[:objeto]  = 1  if session[:objeto].nil?
            session[:objeto] += 1  if session[:objeto].present?
          end
        end

        if session[:turn].to_i > 50
          if params[:choice] == "Animal"
            session[:animal] = 1  if session[:animal].nil?
            session[:animal] += 1 if session[:animal].present?
          end
        end

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