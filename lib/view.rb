class View
  
  def create_gossip
    puts 'Quel râgot souhaites-tu rapporter ?'
    content_sent = gets.chomp
    puts "Qui est l'auteur ?"
    author_sent = gets.chomp
    return params = { content: content_sent, author: author_sent }
  end

  def index_gossips(gossips)
    gossips.each_with_index do |i,index|
      puts "#{index} - #{i.author} : #{i.content}"
    end
  end

  def display_gossip(gossip)
    puts gossip
  end

end