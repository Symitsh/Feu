# ***** Evaluer une expression *****
# sans utiliser: eval("4 + 21 * (1 - 2 / 2) + 38")
class ArithmeticExpression
  def split_expression(expression) # Espace l'expression puis la met dans un tableau
    if_parenthesis_present(expression
      .gsub('(', ' ( ') # Remplace chaque référence du premier paramètre par le deuxième paramètres
      .gsub(')', ' ) ')
      .gsub('+', ' + ')
      .gsub('-', ' - ')
      .gsub('*', ' * ')
      .gsub('/', ' / ')
      .gsub('%', ' % ')
      .split(' '))
  end

  def operator_eval(nb1, signe, nb2) # Selon le signe fait un calcul
    $result = case signe
              when '+' then nb1 += nb2
              when '-' then nb1 -= nb2
              when '*' then nb1 *= nb2
              when '/' then nb1 /= nb2
              when '%' then nb1 %= nb2
              else "Operator error: #{nb1} #{signe} #{nb2} ?"
                   exit
              end
  end

  def if_parenthesis_present(expression) # Vérifie si une parenthèse est présente / Sinon envoie dans evaluate(expression)
    tokens = expression
    array1 = []
    if tokens.include?('(')
      parenthesis(tokens, array1)
    else
      evaluate(tokens)
    end
  end

  def parenthesis(tokens, array1) # Isole l'expression entre parenthèse et envoie dans evaluate(expression)
    opening_parenthesis = tokens.index('(')
    closing_parenthesis = tokens.index(')')
    index_parenthesis = opening_parenthesis
    array1 << tokens[opening_parenthesis..closing_parenthesis]
    array1.flatten!
    tokens -= array1
    array1.shift
    array1.pop
    tokens.insert(index_parenthesis, evaluate(array1))
    tokens.flatten!
    evaluate(tokens)
  end

  def evaluate(expression) # Evalue les priorités des signes et fait le calcul
    tab3 = []
    expression.each do |element|
      if ['/', '*', '%'].include?(element)
        index_signe = expression.index(element)
        index_nb1 = index_signe - 1
        index_nb2 = index_signe + 1
        tab3.clear
        tab3 << expression[index_nb1..index_nb2]
        tab3.flatten!
        expression -= tab3
        nb1 = tab3[0].to_i
        signe = tab3[1]
        nb2 = tab3[2].to_i
        operator_eval(nb1, signe, nb2)
        expression.insert(index_nb1, $result.to_s)
      end
      expression.insert(index_signe, signe) if expression.length == 2
    end

    expression.each do |element|
      if ['+', '-'].include?(element)
        index_signe = expression.index(element)
        index_nb1 = index_signe - 1
        index_nb2 = index_signe + 1
        tab3.clear
        tab3 << expression[index_nb1..index_nb2]
        tab3.flatten!
        expression -= tab3
        nb1 = tab3[0].to_i
        signe = tab3[1]
        nb2 = tab3[2].to_i
        operator_eval(nb1, signe, nb2)
        expression.insert(index_nb1, $result.to_s)
      end
      expression.insert(index_signe, signe) if expression.length == 2
    end
    expression
  end
end

# Partie 1: Gestion d'erreur
unless ARGV.length == 1
  (puts "error arguments : #{$PROGRAM_NAME} \"Arithmetic Expression\""
   exit)
end

# Partie 2: Parsing
def main
  expression = ARGV[0]
  obj = ArithmeticExpression.new
  obj.split_expression(expression)
end

# Partie 3: Résolution / Affichage
puts main
