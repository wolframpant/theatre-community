require 'rails_helper'

RSpec.describe Impression, :type => :model do

  context 'associations' do
    it 'should have many comments', focus: true do
      expect(Impression.new).to have_many(:comments)
    end
    it 'should belong to play', focus: true do
      expect(Impression.new).to belong_to(:play)
    end
    it 'should belong to user', focus: true do
      expect(Impression.new).to belong_to(:user)
    end
  end

end
