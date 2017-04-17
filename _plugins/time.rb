require 'active_support/all'

module Jekyll
  module TimeFilter
    def toUTC(input)
      time = ActiveSupport::TimeZone.new(@@timezone).parse(input)
      return time.in_time_zone('UTC')
    end

  	@@timezone = Jekyll.configuration({})['timezone']
  end
end

Liquid::Template.register_filter(Jekyll::TimeFilter)