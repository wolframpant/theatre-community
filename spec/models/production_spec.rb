require 'rails_helper'

RSpec.describe Production, :type => :model do

  context 'associations' do
    it 'should have many impressions', focus: true do
      expect(Production.new).to have_many(:productions)
    end
    it 'should belong to play', focus: true do
      expect (Production.new).to belong_to(:play)
    end
  end

end
