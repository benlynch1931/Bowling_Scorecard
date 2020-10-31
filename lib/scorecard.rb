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
    if user_roll == '10'
      @frames[0][:roll_one][:pins] = 10
      @frames[0][:roll_one][:score] = 10
    else
      @frames[0][:roll_one][:pins] = user_roll.to_i
      @frames[0][:roll_one][:score] = user_roll.to_i
    end
  end

  attr_reader :score, :frames
end
