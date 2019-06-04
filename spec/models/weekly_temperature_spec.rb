require 'rails_helper'

describe WeeklyTemperature do
  describe 'relationships' do
    it { should belong_to :location }
  end
end
