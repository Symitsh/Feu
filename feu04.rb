# Trouver le plus grand carré
class MaximalSquare
  def get_plateau(plateau, column_number)
    nb = ''
    string = File.read(plateau)

    string.each_char do |c|
      string.slice!(0)
      break if c == "\n"

      nb += c
    end

    nb = nb.to_i
    column_number[0] = 0
    i = 0
    string.each_char do |element|
      column_number[0] = i if element == "\n" && (column_number[0] == 0)
      i += 1
    end
  end

  def get_pos_square(plateau, column_number)

  end

  def good_square(plateau, x, y, tmp, column_number)

  end

  def one_line_is_good(plateau, x, y, n, column_number)

  end

  def	displays_square_in_map(plateau, pos, column_number)

  end

end

# Partie 1: Gestion d'erreur
unless ARGV.size == 1
  puts "*** error ***\n _#{__FILE__}_
  Only one data file."
  exit
end

# Partie 2: Parsing
def main
  obj = MaximalSquare.new
  column_number = []
  plateau = obj.get_plateau(ARGV[0], column_number)
end

# Partie 3: Affichage
puts main
