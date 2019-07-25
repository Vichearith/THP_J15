require_relative 'controller'

class Router

#On veut qu'un "Router.new" lancé par app.rb, crée automatique une instance "@controller"
  def initialize
    @controller =  Controller.new
  end 

#rappelle-toi que l'on fait "Router.new.perform" dans app.rb => après initialize, on définit donc perform.
  def perform 
    puts "BIENVENUE DANS THE GOSSIP PROJECT"

    while true

      #on affiche le menu
      puts "Tu veux faire quoi jeune mouss' ?"
      puts "1. Je veux créer un gossip"
      puts "2. Afficher tous les potins"
      puts "3. Détruire un potin"
      puts "4. Je veux quitter l'app"
      params = gets.chomp.to_i #on attend le choix de l'utilisateur
      puts "\n"

      case params #en fonction du choix
      when 1
        puts "Tu as choisi de créer un gossip" 
        @controller.create_gossip

      when 2
        @controller.index_gossips

      when 3
        @controller.destroy_gossip
      
      when 4
        puts "À bientôt !"
        break #Ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.

      else
        puts "Ce choix n'existe pas, merci de ressayer" #Si l'utilisateur saisit une entrée non prévue, il retourne au début du "while true". 
        #C'est pour ça que la boucle est infinie: potentiellement, il peut se gourer jusqu'à la fin des temps :)

      end
    puts "\n ------------------------------------ \n"
    end
  end
end