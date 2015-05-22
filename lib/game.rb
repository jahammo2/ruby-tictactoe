class Game
  def self.start
    puts "start"
    human_letter = Ask_Questions.ask_letter
    puts human_letter
  end
end

class AskQuestions < Game
  def self.ask_letter
    puts "which letter will you be?"
    gets.chomp
  end
end
