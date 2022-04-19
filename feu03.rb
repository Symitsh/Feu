# ***** Sudoku *****
=begin
1. Sur chaque ligne, dès qu'on trouve un '.' on doit mettre un nombre compris entre 1..9
2. Ce nombre X à 3 contrainte à respecté
_ Il doit apparrait 1 fois par ligne
_ Il dois apparait 1 fois par colonne
_ Il doit apparait 1 fois par carré
SI c'est BON, je fait une boucle de 1. et 2.
Dès que je trouve un point je met un nombre et je vérifie que toute les contraintes soit bonne

3. Arrivé à la Fin du tableau et ayant remplie tout les points.
=end

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

  def check_sudoku(sudoku)

  end
end

# Partie 1: Gestion d'erreur
unless ARGV.size == 1
  puts "*** error ***\n _#{__FILE__}_
  Only one data file."
  exit
end

# Partie 2: Parsing
s = ARGV[0]
sudoku = []
position = 0

def main
  obj = Sudoku.new
  obj.check_sudoku(sudoku)
end

# Partie 3: Affichage
puts main
