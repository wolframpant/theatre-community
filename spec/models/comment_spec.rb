require 'rails_helper'

RSpec.describe Comment, :type => :model do

  context 'associations' do
    it 'should belong to impression', focus: true do
      expect(Comment.new).to belong_to(:impression)
    end
    it 'should belong to user', focus: true do
      expect(Comment.new).to belong_to(:user)
    end
  end
end
