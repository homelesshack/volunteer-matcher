class Volunteer
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name,
                :hours_per_week,
                :days_available,
                :skills,
                :postcode,
                :miles_from,
                :dbs_checked

  class << self
    def all
      return []
    end
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end