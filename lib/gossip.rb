class Gossip
attr_reader :content, :author

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("db/gossip.csv", "a") do |csv|
      csv << {'author'=>@author,'content'=>@content}.values
    end
  end

  def self.all
    all_gossips = []
    CSV.open("db/gossip.csv", "r").each do |ligne|
      gossip_provisoire = Gossip.new(ligne[0],ligne[1])
      all_gossips << gossip_provisoire
    end
    return all_gossips
  end

  def self.gossip_choosen(number)
    CSV.open("db/gossip.csv", "r").each_with_index do |line,index|
      if index == number
      return line
      end
    end
  end

  def self.destroy_gossip(number)
    csv_rows = CSV.read("db/gossip.csv")
    row_deleted = 0
    csv_rows.each.with_index do |row, index|
      if index == number
        csv_rows.delete(row)
      end
      CSV.open("db/gossip.csv", 'w') { |csv| csv_rows.each{|row| csv << row}}
    end
  end
end