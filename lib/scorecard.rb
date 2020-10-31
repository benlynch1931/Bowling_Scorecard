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
    user_roll_one = gets.chomp
    if user_roll_one == '10'
      @frames[0][:roll_one][:pins] = 10
      @frames[0][:roll_one][:score] = 10
      @frames[0][:roll_one][:bonus] = 'strike'
    else
      @frames[0][:roll_one][:pins] = user_roll_one.to_i
      @frames[0][:roll_one][:score] = user_roll_one.to_i
    end
    user_roll_two = gets.chomp
    if user_roll_two + user_roll_one == 10
      @frames[0][:roll_two][:pins] = user_roll_two.to_i
      @frames[0][:roll_two][:score] = user_roll_two.to_i
      @frames[0][:roll_two][:bonus] = 'spare'
    else
      @frames[0][:roll_two][:pins] = user_roll_two.to_i
      @frames[0][:roll_two][:score] = user_roll_two.to_i
    end
  end

  attr_reader :score, :frames
end
