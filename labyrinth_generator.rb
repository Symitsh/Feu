# Programme permettant de généré un labyrinth avec en paramètre :
# la largeur, hauteur, un char(chemin), les portes(entrée, sortie)
# Exemple: ruby labyrinth_generator.rb 10 10 "* o12"

def labyrinth_generator
  File.delete('labyrinth.txt')
  height = ARGV[0].to_i
  width = ARGV[1].to_i
  chars = ARGV[2]
  gates = ARGV[3].to_i
  entry = rand(width - 4) + 2
  entry2 = rand(width - 4) + 2

  open('labyrinth.txt', 'a') { |f| f << "#{height}x#{width}#{ARGV[2]}" }
  open('labyrinth.txt', 'a') { |f| f << "\n" }
  height.times do |y|
    width.times do |x|
      if y == 0 && x == entry
        open('labyrinth.txt', 'a') { |f| f << chars[4].chr }
      elsif y == height - 1 && x == entry2
        open('labyrinth.txt', 'a') { |f| f << chars[3].chr }
      elsif y.between?(1, height - 2) && x.between?(1, width - 2) && rand(100) > 20
        open('labyrinth.txt', 'a') { |f| f << chars[1].chr }
      else
        open('labyrinth.txt', 'a') { |f| f << chars[0].chr }
      end
    end
    open('labyrinth.txt', 'a') { |f| f << "\n" }
  end
end

labyrinth_generator
