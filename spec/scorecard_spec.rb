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

    context 'when strike rolled' do

      it 'adds 10 points to the score' do
        allow(subject).to receive(:gets).and_return('10')
        expect(subject.controller).to eq 10
      end
    end
  end

  pending ' #spare'



  pending ' #spare_bonus'



  pending ' #strike'



  pending ' #strike_bonus'




end
