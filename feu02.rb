# ***** Trouver une forme *****
class FindShape

  # Méthodes utilisées
  def set_data(file)
    i = 0
    res = []
    File.foreach(file) do |line|
      res [i] = []
      res[i] += line.chomp.split('')
      i += 1
    end
    res
  end

  def gives_position(x1, x2)
    0..(x2.size - 1).each do |i|
      0..(x2[i].size - 1).each do |y|
        next unless x2[i][j] == x1[0][0]
        p x2[i][j]
      end
    end
  end

end

# Partie 1: Gestion d'erreur
unless ARGV.size == 2
  puts "** error _#{(__FILE__)}_ **\nPass two data files.\nThe first is the shape to search for."
  exit
end

# Partie 2: Parsing
def main
  obj = FindShape.new
  x1 = []
  x2 = []
  x1 = obj.set_data(ARGV[0])
  x2 = obj.set_data(ARGV[1])
end

# Partie 3: Affichage
puts main
