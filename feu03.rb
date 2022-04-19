# ***** Sudoku *****
class Sudoku
  # méthodes utilisées
  def display_sudoku()

  end

  def absent_line()

  end

  def absent_column()

  end

  def absent_block()

  end

  def print_sudoku(sudoku)
    i = 0
    while (i < sudoku.count)
      j = 0
      while (j < sudoku[i].count)
        print sudoku[i][j]
        j += 1
      end
      print "\n"
      i += 1
    end
  end


  def check_sudoku
    file = ARGV[0]
    sudoku = []
    position = 0
    File.foreach(file) do |line|
      sudoku[position] = line.chomp.split('')
      position += 1
    end
    sudoku = print_sudoku(sudoku)

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
  obj = Sudoku.new
  obj.check_sudoku
end

# Partie 3: Affichage
puts main

=begin

1. Sur chaque ligne, dès qu'il y a trouve un '.' affiche un nombre compris entre 1..9

2. Ce nombre X à 3 contraintes à respecté
_ Il doit apparaître 1 fois par ligne
_ Il doit apparaître 1 fois par colonne
_ Il doit apparaître 1 fois par carré

4. SI BON, fait une boucle de la partie 1. et 2.
Dès qu'il y a un point met un nombre et vérifie que toutes les contraintes soient bonnes

5. Arrivé à la Fin du tableau en ayant rempli tous les points.

=end
