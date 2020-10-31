class ScoreCard

  def initialize
    @score = 0
  end

  def controller
    user_roll = gets.chomp
    case user_roll
    when '10'
      @score += 10
    end
  end

  attr_reader :score
end
