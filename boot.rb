require './app/people_controller.rb'

DIR_TO_REQUIRE = %w[
  ./app/lib/people_parser_formats/concerns/*.rb
  ./app/lib/**/*.rb
  ./app/models/*.rb
].freeze

DIR_TO_REQUIRE.each do |dir|
  Dir[dir].each { |file| require file }
end