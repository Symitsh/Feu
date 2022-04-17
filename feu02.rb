# ***** Trouver une forme *****
class FindShape
  # Méthodes utilisées
  def reading_data(file)
    i = 0
    res = []
    File.foreach(file) do |line|
      res [i] = []
      res[i] += line.chomp.split('')
      i += 1
    end
    res
  end

  def gives_position(file1, file2)
    (0..(file2.size - 1)).each do |i|
      (0..(file2[i].size - 1)).each do |j|
        next unless file2[i][j] == file1[0][0]

      end
    end
  end
end

# Partie 1: Gestion d'erreur
unless ARGV.size == 2
  puts "** error _#{__FILE__}_ **\nPass two data files.\nThe first is the shape to search for."
  exit
end

# Partie 2: Parsing
def main
  obj = FindShape.new
  file1 = obj.reading_data(ARGV[0])
  file2 = obj.reading_data(ARGV[1])
  obj.gives_position(file1, file2)
end

# Partie 3: Affichage
puts main
