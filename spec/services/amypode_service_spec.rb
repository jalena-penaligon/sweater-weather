require 'rails_helper'

describe AmypodeService do
  it '.get_antipode returns an Antipode object' do
    service = AmypodeService.new("hong kong,cn")

    expect(service.get_antipode).to be_a(Antipode) 
  end

end
