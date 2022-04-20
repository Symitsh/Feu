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

  def maximum_square(plateau) #  Trouve la taille manimal avec des o
    row = plateau.length
    col = plateau[0].length
    #  Stock un plateau de '.' dans une variable
    auxiliary = Array.new(row) { Array.new(col) { '.' } }

  end

  def get_top_left_location() # localise le haut gauche du carré

  end

  def display_result() # Affiche le résultat

    print("\n")
  end
end

def main # Teste avec un plateau fixe prédéfinie
  obj = MaximalSquare.new
  plateau = [
    [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  ]
  obj.maximum_square(plateau)
end

main

#
# Générateur de plateau
# def main()
#   if ARGV.count != 3
#     puts "params needed: x y density"
#     exit
#   end
#
#   x = ARGV[0].to_i
#   y = ARGV[1].to_i
#   density = ARGV[2].to_i
#
#   puts "#{y}.xo"
#   for i in 0..y do
#     for j in 0..x do
#         print ((rand(y) * 2 < density) ? 'x' : '.')
#     end
#     print "\n"
#   end
# end
#
