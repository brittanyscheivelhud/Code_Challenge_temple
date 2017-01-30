class Room
  attr_accessor :name, :description, :puzzle, :directions, :item, :actions

  def initialize name, description, puzzle, directions, item, actions
    @name = name
    @description = description
    @puzzle = puzzle
    @directions = directions
    @item = item
    self.actions = actions
  end

  def look
    puts 'you see some gold, son'
    self
  end

  def actions
    @actions + @directions.keys
  end

  def method_missing m, *args, &block
    direction = m.to_s
    directions[direction] if directions.keys.include? direction
  end
end