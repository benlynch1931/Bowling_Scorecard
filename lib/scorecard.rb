class ScoreCard

  def initialize
    @score = 0
    @frames = []
    10.times { |each|
      @frames.push(
        {
          frame: each,
          roll_one: {pins: nil, score: nil, bonus: '', bonus_score: nil, notes: ''},
          roll_two: {pins: nil, score: nil, bonus: '', bonus_score: nil, notes: ''}
          }
        )
    }

  end

  def controller
    10.times do |round|
      user_roll_one = gets.chomp
      @frames[round][:roll_one][:pins] = user_roll_one.to_i
      @frames[round][:roll_one][:score] = user_roll_one.to_i
      if user_roll_one == '10'
        @frames[round][:roll_one][:bonus] = 'strike'
        next
      else
        @frames[round][:roll_one][:pins] = user_roll_one.to_i
        @frames[round][:roll_one][:score] = user_roll_one.to_i
      end

      user_roll_two = gets.chomp
      if user_roll_two + user_roll_one == 10
        @frames[round][:roll_two][:bonus] = 'spare'
      end
        @frames[round][:roll_two][:pins] = user_roll_two.to_i
        @frames[round][:roll_two][:score] = user_roll_two.to_i
    end
  end

  attr_reader :score, :frames
end
