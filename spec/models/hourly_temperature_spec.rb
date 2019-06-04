require 'rails_helper'

describe HourlyTemperature do
  describe 'relationships' do
    it { should belong_to :location }
  end
end
