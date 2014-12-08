require 'rails_helper'

RSpec.describe Impression, :type => :model do

  context 'associations' do
    it 'should have many comments' do
      expect(Impression.new).to have_many(:comments)
    end
    it 'should belong to production' do
      expect(Impression.new).to belong_to(:production)
    end
    it 'should belong to user' do
      expect(Impression.new).to belong_to(:user)
    end
    it 'should have an associated play through production' do
      play = create(:play)
      impression = create(:impression)
      production = create(:production, play: play, impressions: [impression])
      expect(impression.play).to eq(play)
    end
  end

end
