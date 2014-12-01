require 'rails_helper'

RSpec.describe User, :type => :model do

  context 'associations' do
    it 'should have many impressions', focus: true do
      expect(User.new).to have_many(:productions)
    end

    it 'should have many comments', focus: true do
      expect(User.new).to have_many(:comments)
    end

  end

  context "#admin?" do
    it 'returns true when admin is true' do
      user = User.new(admin: true)
      expect(user.admin?).to eq(true)
    end
    it 'returns false when admin is not true' do
      user = User.new(admin: false)
      expect(user.admin?).to eq(false)
    end
  end

end


