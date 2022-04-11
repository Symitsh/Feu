# ***** Echauffement *****
class MyRectangle
  # Dessine un rectangle d'une largeur et d'une hauteur données
  def draw_rectangle(width, height)
    i = 0
    while (i < height)
      j = 0
      while (j < width)
        # Affiche les extrémités du rectangle
        if (i == (height - 1) && j == (width - 1) || i == (height - 1) && j == 0 ||
          i == 0 && j == (width - 1) || i == 0 && j == 0)
          print "o"
        end
        # Affiche le côté gauche et droit du rectangle
        if j == 0 && (i!=0) && (i!=height-1)
          print "|"
        elsif j == (width-1) && (i!=0) && (i!=height-1)
          print "|"
        end
        # Affiche le haut et le bas du rectangle
        if i == 0 && (j!=0) && (j!=width-1)
          print "-"
        elsif i == (height-1) && (j!=0) && (j!=width-1)
          print "-"
        end
        # Affiche les espaces à l'intérieur du rectangle
        if (i!=0) && (i!=height-1) && (j!=0) && (j!=width-1)
          print " "
        end
        j += 1
      end
      print("\n")
      i += 1
    end
  end
end

# Partie 1: Gestion d'erreur
(puts "error arguments : #{$PROGRAM_NAME} HEIGHT WIDTH"; exit) if ARGV.length != 2

# Partie 2: Parsing
def main()
  width = ARGV[0].to_i
  height = ARGV[1].to_i
  obj_rec = MyRectangle.new
  obj_rec.draw_rectangle(width, height)
end

# Partie 3: Affichage
main()
