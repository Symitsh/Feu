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

end

# Partie 1: Gestion d'erreur
(puts "#{File.basename(__FILE__)}: pass rectangle data files as arguments" ; exit) unless ARGV.count == 2

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
