# ***** Trouver le plus grand carré *****
class MaximalSquare
  #  Renvoie la valeur minimal de deux nombres données
  def minimum(a, b)
    if a > b
      b
    else
      a
    end
  end

  def print_matrix(matrix)
    i = 0
    while i < matrix.count
      j = 0
      while j < matrix[i].count
        print matrix[i][j]
        j += 1
      end
      print "\n"
      i += 1
    end
  end

  def init_array
    new_array = []
    value = 1
    while value < 10
      new_array[value] = 0
      value += 1
    end
    new_array
  end

  def solve_biggest_square(matrix)
    i = 0
    while i < matrix.count
      j = 0
      while j < matrix[i].count
        if matrix[i][j] == '.'

        end
        j += 1
      end
      i += 1
    end
    matrix
  end

  def check_plateau
    file = ARGV[0]
    matrix = []
    position = 0

    File.foreach(file) do |line|
      matrix[position] = line.chomp.split('')
      position += 1
      # puts "\n"
    end
    matrix = solve_biggest_square(matrix)
    if matrix == false
      puts 'error'
    else
      matrix = print_matrix(matrix)
    end
  end
end

# Partie 1: Gestion d'erreur
unless ARGV.size == 1
  puts "*** error ***\n _#{__FILE__}_
  Only one data file."
  exit
end

# Partie 2: Parsing
def main # Teste avec un plateau fixe prédéfinie
  obj = MaximalSquare.new
  obj.check_plateau
end

# Partie 3: Affichage
puts main

#  TODO Lance automatiquement avec commande
#
# Générateur de plateau qui envoie dans un fichier texte
#
# def plateau_generator
#   File.delete("plateau.txt")
#   if ARGV.count != 3
#     puts "params needed: x y density"
#     exit
#   end
#
#   x = ARGV[0].to_i
#   y = ARGV[1].to_i
#   density = ARGV[2].to_i
#
#   # open('plateau.txt', 'a') {|f| f << "#{y}"}
#   # open('plateau.txt', 'a') {|f| f << "\n"}
#   for i in 0..y do
#     for j in 0..x do
#       open('plateau.txt', 'a') {|f| f << ((rand(y) * 2 < density) ? 'o' : '.')}
#     end
#     open('plateau.txt', 'a') {|f| f << "\n"}
#   end
# end
#
