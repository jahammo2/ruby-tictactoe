class Game
  attr_reader :first_person

  def self.start
    choose_first
  end

  def first_move(player)
    @first_person = player
  end

  def choose_first
    first = get_first || 'human'
    first_move(first)
  end

  def get_first
    puts "Who goes first? Computer or human?"
    this_first = case (gets.chomp).downcase
    when "human"
      "human"
    when "computer"
      "computer"
    else
      nil
    end
  end
end

