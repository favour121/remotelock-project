module PeopleParserConcern
  # expects people, separator

  def parse
    return [] unless people && separator

    lines = people.split("\n")
    header = lines.shift.split(separator)
    lines.map do |line|
      Person.new(build_person_attributes(line, header))
    end
  end

  def build_person_attributes(line, header)
    person_data = {}
    line.split(separator).each_with_index do |value, index|
      person_data[header[index]] = value
    end
    reformat_person_data(person_data)
    person_data
  end

  def reformat_person_data(person_data)
    person_data['city'] = conditional_convert_ISO_code_to_cityname(person_data['city'])
    person_data['birthdate'] = format_birthdate(person_data['birthdate'])
  end

  def conditional_convert_ISO_code_to_cityname(city_name)
    { 'NYC' => 'New York City', 'LA' => 'Los Angeles' }[city_name] || city_name
  end

  private

  attr_reader :people, :separator
end