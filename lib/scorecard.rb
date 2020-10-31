class ScoreCard

  def initialize
    @score = 0
    @frames = []
    10.times { |each|
      @frames.push(
        {
          frame: each,
          roll_one: {pins: nil, score: nil, bonus: nil, notes: ''},
          roll_two: {pins: nil, score: nil, bonus: nil, notes: ''}
          }
        )
    }

  end

  def controller
    user_roll = gets.chomp
    case user_roll
    when '10'
      @score += 10
    end
  end

  attr_reader :score, :frames
end
