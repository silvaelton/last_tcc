class Player < ActiveRecord::Base
  has_many :points, foreign_key: 'user_id'

  def point_grupo_one
    index_point = 0
    object = 0
    animal = 0
    human  = 0
    animal_2 = 0

    points.order('id ASC').each_with_index do |point, index|

      index += 1

      case index 
      when 1..10
        index_point += 1 if point.choice == "Objeto"
      when 10..50
        object += 1 if point.choice == "Objeto"
        animal += 1 if point.choice == "Animal"
        index_point += 1 if point.choice == "Humano"

        if object == 4
          index_point += 1 
          object = 0
        end

        if animal == 2
          index_point += 1 
          animal = 0
        end
      when 50..90
        index_point += 1 if point.choice == "Humano"

        animal_2 += 1 if point.choice == "Animal"

        if animal_2 == 2
          index_point += 1 
          animal_2 = 0
        end
      end
      
    end
    
    index_point

  end


  def point_grupo_two_person
    index_point = 0
    object = 0
    animal = 0
    human  = 0
    animal_2 = 0

    points.where(player: 'pessoa').order('id ASC').each_with_index do |point, index|

      index += 1

      case index 
      when 1..10
        index_point += 1 if point.choice == "Objeto"
      when 10..50
        object += 1 if point.choice == "Objeto"
        animal += 1 if point.choice == "Animal"
        index_point += 1 if point.choice == "Humano"

        if object == 4
          index_point += 1 
          object = 0
        end

        if animal == 2
          index_point += 1 
          animal = 0
        end
      when 50..90
        index_point += 1 if point.choice == "Humano"

        animal_2 += 1 if point.choice == "Animal"

        if animal_2 == 2
          index_point += 1 
          animal_2 = 0
        end
      end
      
    end
    
    index_point

  end

  def point_grupo_two_cpu
    index_point = 0
    object = 0
    animal = 0
    human  = 0
    animal_2 = 0

    points.where(player: 'computador').order('id ASC').each_with_index do |point, index|

      index += 1

      case index 
      when 1..10
        index_point += 1 if point.choice == "Objeto"
      when 10..50
        object += 1 if point.choice == "Objeto"
        animal += 1 if point.choice == "Animal"
        index_point += 1 if point.choice == "Humano"

        if object == 4
          index_point += 1 
          object = 0
        end

        if animal == 2
          index_point += 1 
          animal = 0
        end
      when 50..90
        index_point += 1 if point.choice == "Humano"

        animal_2 += 1 if point.choice == "Animal"

        if animal_2 == 2
          index_point += 1 
          animal_2 = 0
        end
      end
      
    end
    
    index_point

  end
end
