namespace :cities do
  desc "Generates top 50 cities in the US"
  task generate: :environment do

    cities = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
      "Philadelphia, PA", "Phoenix, AZ", "San Antonio, TX", "San Diego, CA",
      "Dallas, TX", "San Jose, CA", "Austin, TX", "Jacksonville, FL", "San Francisco, CA",
      "Indianapolis, IN", "Columbus, OH", "Fort Worth, TX", "Charlotte, NC",
      "Seattle, WA", "Denver, CO", "El Paso, TX", "Detroit, MI", "Washington, DC",
      "Boston, MA", "Memphis, TN", "Nashville, TN", "Portland, OR", "Oklahoma City, OK",
      "Las Vegas, NV", "Baltimore, MD", "Louisville, KY", "Milwaukee, WI",
      "Albuquerque, NM", "Tucson, AZ", "Fresno, CA", "Sacramento, CA",
      "Kansas City, KS", "Long Beach, CA", "Mesa, AZ", "Atlanta, GA",
      "Colorado Springs, CA", "Virginia Beach, CA", "Raleigh, NC", "Omaha, NE",
      "Miami, FL", "Oakland, CA", "Minneapolis, MN", "Tulsa, OK", "Wichita, KS",
      "New Orleans, LA", "Arlington, TX"]

      cities.each do |city|
        service = GoogleService.new(city)
        location = service.get_coords
        Location.create(city_state: city, country: "United States", lat: location[:lat], long: location[:lng])
      end
  end
end
