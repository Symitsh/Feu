# ***** Evaluer une expression *****
# sans utilisé eval()
class ArithmeticExpression
  def split_expression(expression)                     # 2: Méthode qui permet de séparer l'expression puis la met dans un tableau
    expression
    .gsub('(', ' ( ')                                  # .gsub remplace chaque référence du premier paramètre par le deuxième paramètre
    .gsub(')', ' ) ')
    .gsub('+', ' + ')
    .gsub('-', ' - ')
    .gsub('*', ' * ')
    .gsub('/', ' / ')
    .gsub('%', ' % ')
    .split(' ')
  end

  def operator_eval (nb1, signe, nb2)               # Méthode permettant selon le signe de faire un calcul
    $result = case signe
      when "+" then nb1 += nb2
      when "-" then nb1 -= nb2
      when "*" then nb1 *= nb2
      when "/" then nb1 /= nb2
      when "%" then nb1 %= nb2
      else "Operator error: #{nb1} #{signe} #{nb2} ?" ; exit
    end
  end

  def include(tokens)                               # Méthode permettant de faire le/les calculs si une parenthèse est inclue dans l'expression
    array1 = []
    if tokens.include?("(")
      opening_parenthesis = tokens.index("(")
      closing_parenthesis = tokens.index(")")
      $index_parenthese = opening_parenthesis
      array1 << tokens[opening_parenthesis..closing_parenthesis]
      array1.flatten!
      tokens -= array1
      array1.shift ; array1.pop
      tokens.insert($index_parenthese, evaluate(array1))
      tokens.flatten!
      evaluate(tokens)
    else
      evaluate(tokens)
    end
  end

  def method_name(expression)                          # Méthode permettant de faire un lien entre les méthodes
    tokens = split_expression(expression)
    include(tokens)
  end

  def evaluate(expression)                              # Evalue les priorités des signes
    tab3 = []
    expression.each do |element|
      if element == "/" || element == "*" || element == "%"
        index_signe = expression.index(element)
        index_nb1 = index_signe - 1
        index_nb2 = index_signe + 1
        tab3.clear
        tab3 << expression[index_nb1..index_nb2]
        tab3.flatten!
        expression -= tab3
        nb1 = tab3[0].to_i ; signe = tab3[1] ; nb2 = tab3[2].to_i
        operator_eval(nb1, signe, nb2)
        expression.insert(index_nb1, $result.to_s)
      end
      (expression.insert(index_signe, signe)) if expression.length == 2
    end

    expression.each do |element|
      if element == "+" || element == "-"
        index_signe = expression.index(element)
        index_nb1 = index_signe - 1
        index_nb2 = index_signe + 1
        tab3.clear
        tab3 << expression[index_nb1..index_nb2]
        tab3.flatten!
        expression -= tab3
        nb1 = tab3[0].to_i ; signe = tab3[1] ; nb2 = tab3[2].to_i
        operator_eval(nb1, signe, nb2)
        expression.insert(index_nb1, $result.to_s)
      end
      (expression.insert(index_signe, signe)) if expression.length == 2
    end
    return expression
  end
end

# Partie 1: Gestion d'erreur
(puts "error arguments : #{$PROGRAM_NAME} \"Arithmetic Expression\""; exit) if ARGV.length != 1

# Partie 2: Parsing
def main
  expression = ARGV[0]
  obj = ArithmeticExpression.new
  obj.split_expression(expression)
  obj.method_name(expression)
end

# Partie 3: Affichage
puts main
