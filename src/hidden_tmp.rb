require_relative "room"
class Game
  #This will initialize parameters such as taking input from the player, changing game state, display information.
  def initialize
    @health_points = Player.MAX_DAMAGE_POINTS
  end

  def damage(amount)
    @damage_points -= amount
    kill if @damage_points < 1
  end

  def kill
    #...
  end

  class Player
    # The player will start with 100 hit points(HP) abd 1 attack power (AP). The game will end when the players HP reaches 0
    attr_accessor :damage_points, :attack_bonus, :x_coord, :y_coord
    # def initialize(name, health)? Inventory??

    MAX_DAMAGE_POINTS = 100
  end

  def alive?
    @damage_points > 0
  end

  def damage(amount)
    @damage_points -= amount
  end

  def heal(amount)
    @damage_points += amount
    @damage_points = [@damage_points, MAX_DAMAGE_POINTS].min
  end

  def print status
    puts "*" * 80
    puts "HP:{@damage_points}/#{MAX_DAMAGE_POINTS}"
    puts "AP: #{@attack_power}"
    puts "*" * 80
  end
end

class Computer # Dr.Randy Bones
  # I need to add a game timer
  # add item_hint_provider
end

class Computer2 #The Porter
  # add aggravation_meter
  #super_hint_provider
end

class Items

end


puts "Welcome to the Legend of the Hidden Temple"

def continue
  puts "Press enter to continue\r"
  gets
end

continue
#Intro
puts "what is your name?"
name=gets.chomp
puts "Congratulations, #{name}! You have been chosen as a finalist to be the assistant of the infamous Dr. Randy Bones, an Archeology Legend of world renown. The Doctor requires someone with attention to detail, a strong back, and experience with Tea service to accompany him on his exploration of the lost pyramid of Natuii. Should you be chosen you will work long hours serving his needs for little pay and absolutely NO recognition.\r"
#describe the next steps

puts "\n
Enter the pyramid"
north_room = Room.new 'north room', 'north room desc', 'north room puzzle', {}, '', ['look']
starting_room = Room.new "the starting room", "dark, damp", "what's 1+1?", {'north' => north_room}, 'large piece of GOLD', ['look']
north_room.directions = {'south' => starting_room}

puts "You have discovered the entrance to enter the pyramid. As you proceed into the #{starting_room.description} room you notice a torch. Dr.Bones asks that you light the torch and lead the way. There is a door ahead. As you move the torch towards the door, you notice an item"
#To proceed, you must answer my riddle. What is 1+1?]

puts "You have discovered a #{starting_room.item}!"
puts "#{starting_room.puzzle}"
answer=gets.chomp
if answer == "2"
  puts "YOU ARE A GENIUS/ YOU WINNN"
else
  puts 'YOU ARE AN IDIOT, YOU LOSE, YOU GET NOTHING, GOOD DAY SIR'
end

current_room = starting_room
command = ''
while command.downcase != 'exit'
  puts "Available commands: #{current_room.actions}"
  print '> '
  command = gets.chomp
  current_room = current_room.public_send command
  break if current_room.nil?
end