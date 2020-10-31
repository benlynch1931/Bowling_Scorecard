require 'scorecard'

describe ScoreCard do

  context ' #initialize' do

    it 'instantiates with a score variable' do
      expect(subject.score).to eq 0
    end
  end

  context ' #controller' do

    it 'responds when called' do
      expect(subject).to respond_to(:controller)
    end
  end

  pending ' #spare'



  pending ' #spare_bonus'



  pending ' #strike'



  pending ' #strike_bonus'




end
