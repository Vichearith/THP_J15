require_relative 'view'
require_relative 'gossip'

class Controller

  def initialize
    @view = View.new
  end
  
  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params[:author], params[:content])
    gossip.save

  end

  def index_gossips
    @view.index_gossips(Gossip.all)
  end

  def destroy_gossip
    @view.index_gossips(Gossip.all)
    puts 'Quel potin souhaitez-vous détruire ?'
    choice = gets.chomp.to_i
    while choice.is_a?(Integer) == false || choice <= 0 || choice > Gossip.all.count-1
      puts "Je n'ai pas compris | Je ne peux pas faire cette action"
      choice = gets.chomp.to_i
    end
    @view.display_gossip(Gossip.gossip_choosen(choice))
    puts 'Êtes-vous sûr ?'
    decision = gets.chomp
    while decision != 'y' && decision != 'Y' && decision != 'n' && decision != 'N'
      puts "Je n'ai pas compris"
      decision = gets.chomp
    end
    if decision == 'y' || decision == 'Y' 
      Gossip.destroy_gossip(choice)
    else
      puts "Aucune suppression n'a été effectuée"
    end
    @view.index_gossips(Gossip.all)
  end

end