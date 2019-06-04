require 'rails_helper'

describe Favorite do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :location }
  end
end
