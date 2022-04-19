# ***** Trouver une forme *****
class FindShape
  # Méthodes utilisées
  def reading_data(file)
    i = 0
    res = []
    File.foreach(file) do |element|
      res[i] = []
      res[i] += element.chomp.split('')
      i += 1
    end
    res
  end

  def gives_position(file1, file2)
    (0..(file1.size - 1)).each do |line|
      (0..(file1[line].size - 1)).each do |column|
        if file2[0][0] == file1[line][column] &&
           file2[0][1] == file1[line][column + 1] &&
           file2[1][1] == file1[line + 1][column + 1]
          return "#{column}, #{line}"
        end
      end
    end
    puts 'Introuvable'
    exit
  end
end

# Partie 1: Gestion d'erreur
unless ARGV.size == 2
  puts "*** error ***\n _#{__FILE__}_\nPass two data files.\n
  The first is the shape to search for."
  exit
end

# Partie 2: Parsing
def main
  obj = FindShape.new
  file1 = obj.reading_data(ARGV[0]) # board
  file2 = obj.reading_data(ARGV[1]) # to_find
  obj.gives_position(file1, file2)
end

# Partie 3: Affichage
puts main
