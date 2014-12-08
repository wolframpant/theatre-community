require 'rails_helper'

RSpec.describe Play, :type => :model do

  context 'associations' do
    it 'should have many productions', focus: true do
      expect(Play.new).to have_many(:productions)
    end
    it 'should have many impressions through productions' do
      expect(Play.new).to have_many(:impressions).through(:productions)
    end
  end
end
  
  