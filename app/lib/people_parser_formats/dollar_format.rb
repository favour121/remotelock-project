module PeopleParserLib
  class DollarFormat
    include PeopleParserConcern

    def initialize(people)
      @people = people
      @separator = ' $ '
    end

    def call
      parse
    end

    def format_birthdate(date)
      day, month, year = date.split('-')
      "#{month.to_i}/#{day.to_i}/#{year}"
    end

  end
end