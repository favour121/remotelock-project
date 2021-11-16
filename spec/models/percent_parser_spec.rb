require 'spec_helper'

RSpec.describe 'Percent Parser Test' do
  describe 'Percent Parser Service' do
    let(:people_data) do
      File.read('spec/fixtures/people_by_percent.txt')
    end
    let(:percent_parser) { PeopleParserLib::PercentFormat.new(people_data) }

    it 'parses input files and outputs person object' do
      people = percent_parser.call

      people.each { |person| expect(person.class.name).to eq 'Person' }
    end
  end
end