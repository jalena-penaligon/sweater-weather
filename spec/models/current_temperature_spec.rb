require 'rails_helper'

describe CurrentTemperature do
  describe 'relationships' do
    it { should belong_to :location }
  end
end
