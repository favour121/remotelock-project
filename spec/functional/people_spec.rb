require 'spec_helper'

RSpec.describe 'People Controller Test' do
  describe 'people controller with only one format' do
    let(:params) do
      {
        percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        order: :first_name
      }
    end
    let(:people_controller) { PeopleController.new(params) }

    it 'should work on given data' do
      normalized_people = people_controller.normalize

      expect(normalized_people).to eq [
                                        'Elliot, New York City, 5/4/1947',
                                        'Mckayla, Atlanta, 5/29/1986'
                                      ]
    end
  end
end