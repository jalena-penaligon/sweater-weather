class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :city_state, :country

  attribute :search_time do |object|
    search_time = Time.now.strftime("%l:%M %p")
  end

  attribute :search_date do |object|
    search_date = "#{Time.now.strftime("%m")}/#{Time.now.strftime("%d")}"
  end

end
