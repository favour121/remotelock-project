class Person
  ATTRIBUTES = %w[first_name city birthdate last_name].freeze

  def initialize(person_json = {})
    ATTRIBUTES.each { |attribute| instance_variable_set("@#{attribute}", person_json[attribute]) }
  end

  def format
    "#{first_name}, #{city}, #{birthdate}"
  end

  attr_accessor(*ATTRIBUTES)
end