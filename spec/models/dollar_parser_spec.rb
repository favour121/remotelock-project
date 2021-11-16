require 'spec_helper'

RSpec.describe 'Dollar Parser Test' do
  describe 'Dollar Parser Service' do
    let(:people_data) do
      File.read('spec/fixtures/people_by_dollar.txt')
    end
    let(:dollar_parser) { PeopleParserLib::DollarFormat.new(people_data) }

    it 'parses input files and outputs person object' do
      people = dollar_parser.call

      people.each { |person| expect(person.class.name).to eq 'Person' }
    end

    it 'parses input files and outputs person object' do
      people = dollar_parser.call

      people.each { |person| expect(person.class.name).to eq 'Person' }
    end
  end
end
