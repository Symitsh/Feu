# Labyrinthe
class Labyrinth
  attr_reader :labyrinth

  def initialize(labyrinth)
    @labyrinth = labyrinth
    @visited = []      # Tableau des positions visités
    @waiting_line = [] # Crée une file d'attente pour le BFS
    @previous = {}
  end

  def find_gate_one
    @labyrinth.each_with_index do |line, i|
      line.each_with_index do |char, j|
        next unless char == '1'

        return [i, j]
      end
    end
    nil
  end

  def find_gate_two
    @labyrinth.each_with_index do |line, i|
      line.each_with_index do |char, j|
        next unless char == '2'

        return [i, j]
      end
    end
    nil
  end

  def solve_labyrinth
    @waiting_line << find_gate_one           # 1: Ajoute le noeud de départ à la file d'attente
    find_gate_two
    begin                                    # 2: Boucle sur la file d'attente
      next_position = @waiting_line.shift    # 2.1: Supprime le noeud de départ de la file d'attente(actuel)
      @visited << next_position              # 3.1: "Marque" comme visité
      adjacent_to_gates_two(next_position)   # 3.2: Vérifie s'il s'agit du noeud d'objectif (2)
    end while get_element(next_position) == '1' || get_element(next_position) == ' '
    return 'Path not found' if get_element(next_position) == '*'

    solved = solution(trace_path)
    solved.each { |element| puts element.join('') }
  end

  def adjacent_to_gates_two(coordinates)    # Vérifie les cases voisine
    adjacents = get_adjacent_coordinates(coordinates)
    adjacents.each do |adjacent|
      if (get_element(adjacent) == ' ' || get_element(adjacent) == '2') && !(@visited.include?(adjacent) || @waiting_line.include?(adjacent))
        @waiting_line << adjacent
        @previous[adjacent] = coordinates
      end
    end
    if @waiting_line == []
      puts 'Path not found'
      exit
    end
    @waiting_line
  end

  def get_adjacent_coordinates(coordinates)
    vertical = [[coordinates[0] - 1, coordinates[1]], [coordinates[0] + 1, coordinates[1]]]
    horizontal = [[coordinates[0], coordinates[1] - 1], [coordinates[0], coordinates[1] + 1]]
    adjacents = vertical + horizontal
    adjacents.select do |coords|
      coords[0].between?(0, @labyrinth.length - 1) && coords[1].between?(0, @labyrinth[0].length - 1)
    end
  end

  def get_element(coordinates)
    @labyrinth[coordinates[0]][coordinates[1]]
  end

  def solution(path)
    result = @labyrinth
    $result_final = 0
    path.each do |coords|
      if result[coords[0]][coords[1]] != '1'
        result[coords[0]][coords[1]] = 'o'
        $result_final += 1
      end
    end
    result
  end

  def trace_path
    path = [@previous[find_gate_two]]
    begin
      next_pos = @previous[path[-1]]
      path << next_pos
    end while get_element(next_pos) != '1'
    path.reverse!
  end
end

# Partie 1: Gestion d'erreur
unless ARGV.size == 1
  puts "*** error ***\n _#{__FILE__}_
  Only one data file: labyrinth.txt"
  exit
end

# Partie 2: Parsing
def main
  labyrinth_file = ARGV[0]
  lines = []
  File.foreach(labyrinth_file) { |line| lines << line.chomp.split('') }
  puts lines[0].join
  my_labyrinth = Labyrinth.new(lines[1..-1])
  my_labyrinth.labyrinth
  my_labyrinth.solve_labyrinth
  puts "=> SORTIE ATTEINTE EN #{$result_final} COUPS !"
end

# Partie 3: Affichage
puts main
