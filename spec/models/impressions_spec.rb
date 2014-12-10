require 'rails_helper'

RSpec.describe Impression, :type => :model do

  context 'associations' do
    it 'should have many comments' do
      expect(Impression.new).to have_many(:comments)
    end
    it 'should belong to play through productions' do
      expect(Impression.new).to belong_to(:play)
    end
    it 'should belong to user' do
      expect(Impression.new).to belong_to(:user)
    end
    it 'should belong to a production' do
      expect(Impression.new).to belong_to(:production)
    end
  end

end
