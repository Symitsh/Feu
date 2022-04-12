# ***** Evaluer une expression *****
# sans utilisé eval()
class ArithmeticExpression

  LAMBDAS_FUNCTION = {                          # 2: Utilisation d'un lambda constant pour enregistrer les différents paramètres
    "+" => lambda {|a, b| a + b},
    "-" => lambda {|a, b| a - b},
    "*" => lambda {|a, b| a * b},
    "/" => lambda {|a, b| a / b},
    "%" => lambda {|a, b| a % b}
  }

  def split_expression(expression)              # 1: Méthode qui me permet de séparé l'expression et de la mettre dans un tableau
    expression
    .gsub('(', ' ( ')
    .gsub(')', ' ) ')
    .gsub('+', ' + ')
    .gsub('-', ' - ')
    .gsub('*', ' * ')
    .gsub('/', ' / ')
    .gsub('%', ' % ')
    .split(' ')
  end

  def operator?(expression)                     # x: Méthode vérifiant un des opérateurs est présent dans la boucle au moment t
    $priority.include?(expression)
  end

  def pop_connect_push(array1, array2)
    temp = array1.pop
  end


  def infix_exp_to_tree(expression)
    array1, array2 = [], []                     # 3: Je crée 2 tableaux
    token = split_expression(expression)        # 4: Je stocke ma méthode split_expression dans une variable pour la parcourir avec une boucle each

    token.each do |element|
      if operator?(element)
        # Ordonne les priorités
        until (array1.empty? or
              array1.last == "(" or
              $priority[array1.last] < $priority[expression])
          p pop_connect_push(array1, array2)
        end
      end
    end
  end
end

# Partie 1: Gestion d'erreur
(puts "error arguments : #{$PROGRAM_NAME} \"Arithmetic Expression\""; exit) if ARGV.length != 1

# Partie 2: Parsing
def main
  expression = ARGV[0]
  obj = ArithmeticExpression.new
  p obj.split_expression(expression)
  obj.infix_exp_to_tree(expression)
end
$priority = {"+" => 0, "-" => 0, "*" => 1, "/" => 1, "%" => 1}

# Partie 3: Affichage
main

# [\+\-\/\*\%]
