MAP = [[1, 0, 0, 0], [0, 2, 0, 1], [1, 0, 1, 0], [0, 0, 2, 1]]
N = 4
class ForestTile
  attr_accessor :texts, :rng
  def initialize
    @rng = Random.new
    @texts = [
      "Overgrown trees surround you. They are towering over the forest.",
      "There are several trees here. One of them is casting a shade on you.",
      "A comforting breeze blows between the leaves."
    ]
  end
  def to_s
    @texts[@rng.rand(3)]
  end
end
forest = ForestTile.new
class EnemyTile
  attr_accessor :texts, :rng
  def initialize
    @rng = Random.new
    @texts = [
      "There is a foul beast here. Luckily it seems to not notice you.",
      "A monster can be heard rustling between the leaves. Be careful.",
      "Wild bird cries come from the skies. Cover your head."
    ]
  end
  def to_s
    @texts[@rng.rand(3)]
  end
end
enemy = EnemyTile.new
class WellTile
  attr_accessor :texts, :rng
  def initialize
    @rng = Random.new
    @texts = [
      "There is a stone well here. You wonder if anything happens if you throw something inside.",
      "You see a well in front of you. Leave a penny, and maybe your wish will come true.",
      "There is a bucket hanging from a well in front of you, do you want to take some water?"
    ]
  end
  def to_s
    @texts[@rng.rand(3)]
  end
end
well = WellTile.new
TILES = [forest, enemy, well]

class Tile
  attr_accessor :x, :y, :adj
  def initialize(x, y)
    @x, @y = x, y
  end
  def adj # Here comes a sick one liner that no one can understand
    [[@x-1, @y], [@x+1, @y], [@x, @y-1], [@x, @y+1]].inject([]) {|adj, n| (n.any? {|i| i < 0 or i == N}) ? adj : adj << Tile.new(*n)}
  end
  def to_s
    TILES[MAP[@x][@y]].to_s
  end
  def eql?(other)
    @x == @x && @y == @y
  end
end

start = Tile.new(0, 0)
current = start
key = ""
until key == "q"
  puts current
  key = gets.chomp()
  target = [-3, -3]
  target = [current.x, current.y-1] if key.eql? "n"
  target = [current.x, current.y+1] if key.eql? "s"
  target = [current.x-1, current.y] if key.eql? "w"
  target = [current.x+1, current.y] if key.eql? "e"
  target = Tile.new(*target)
  if current.adj.any? {|n| n.eql?(target)}
    current = target
  else
    puts "Can't go there"
  end
end
