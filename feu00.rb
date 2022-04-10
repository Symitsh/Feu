# ***** Echauffement *****
# Méthodes utilisées
class MyRectangle
  # Dessine un rectangle d'une largeur et d'une hauteur données
  def draw_rectangle(width, height)
    # Boucle qui contrôle la hauteur du rectangle
    i = 0
    while (i < height)
      # Boucle qui contrôle la largeur du rectangle
      j = 0
      while (j < width)
        # Affiche la couche externe du rectangle
        #print i, j
        if (i == 0 || i == height - 1 || j == 0 || j == width - 1)
          print "* "
        else
          print "  "
        end
        j += 1
      end
      print("\n")
      i += 1
    end
    i += 1
  end
end

def main()
  obj = MyRectangle.new()

  obj.draw_rectangle(50, 3)
end
main()

# Partie 1: Gestion d'erreur
# (puts "#{$PROGRAM_NAME} WIDTH LENGTH"; exit) if ARGV.length != 2

# Partie 2 : Parsing
#length = ARGV[1].to_i
#width = ARGV[0].to_i

# Partie 3: Résolution


# Partie 4: Affichage
