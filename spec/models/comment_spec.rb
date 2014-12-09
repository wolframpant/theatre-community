require 'rails_helper'

RSpec.describe Comment, :type => :model do

  context 'associations' do
    it 'should belong to impression' do
      should belong_to(:impression)
    end
    it 'should belong to user' do
      should belong_to(:user)
    end
  end
end
