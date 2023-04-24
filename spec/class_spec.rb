require_relative 'class' 

RSpec.describe BowlingScore do
  let(:score) { BowlingScore.new } # Create a new instance of BowlingScore for each test

  describe '#add_roll' do
    it 'adds rolls to the current frame' do
      score.add_roll(5)
      score.add_roll(3)

      expect(score.current_frame.rolls).to eq([5, 3])
    end
  end

  describe '#calculate_score' do
    it 'calculates the correct score for a game without strikes or spares' do
      rolls = [5, 3, 3, 4, 2, 6, 4, 5, 3, 1, 4, 5, 2, 1, 2, 4, 6, 2, 1]
      rolls.each { |pins| score.add_roll(pins) }

      expect(score.calculate_score).to eq(59)
    end

    it 'calculates the correct score for a game with strikes' do
      rolls = [10, 8, 1, 9, 1, 10, 10, 10, 9, 0, 8, 2, 10, 10, 10, 9, 1]
      rolls.each { |pins| score.add_roll(pins) }

      expect(score.calculate_score).to eq(236)
    end

    it 'calculates the correct score for a game with spares' do
      rolls = [8, 2, 5, 5, 7, 3, 6, 4, 3, 7, 4, 6, 9, 1, 8, 2, 10, 10, 10]
      rolls.each { |pins| score.add_roll(pins) }

      expect(score.calculate_score).to eq(162)
    end
  end

  # Add more test cases as needed
end

RSpec.describe Frame do
  let(:frame) { Frame.new } # Create a new instance of Frame for each test

  describe '#add_roll' do
    it 'adds pins to the rolls' do
      frame.add_roll(5)

      expect(frame.rolls).to eq([5])
    end
  end

  describe '#is_complete?' do
    it 'returns true for a strike' do
      frame.add_roll(10)

      expect(frame.is_complete?).to be true
    end

    it 'returns true after two rolls' do
      frame.add_roll(5)
      frame.add_roll(3)

      expect(frame.is_complete?).to be true
    end

    it 'returns false after one roll' do
      frame.add_roll(5)

      expect(frame.is_complete?).to be false
    end
  end

  # Add more test cases as needed
end
