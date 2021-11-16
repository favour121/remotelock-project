module PeopleParserLib
  class PercentFormat
    include PeopleParserConcern
    def initialize(people)
      @people = people
      @separator = ' % '
    end

    def call
      parse
    end

    def format_birthdate(date)
      year, month, day = date.split('-')
      "#{month.to_i}/#{day.to_i}/#{year}"
    end

  end
end