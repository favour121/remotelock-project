class PeopleController
  SUPPORTED_FORMATS = %i[dollar_format percent_format].freeze

  def initialize(params)
    @params = params
  end

  def normalize
    people_collection = []
    SUPPORTED_FORMATS.each do |format|
      format_class_name = format.to_s.split('_').collect(&:capitalize).join
      people_collection += Module.const_get("PeopleParserLib::#{format_class_name}").new(params[format]).call
    end

    people_collection.sort_by{|person| person.send(params[:order])}.map(&:format)
  end

  private

  attr_reader :params
end
