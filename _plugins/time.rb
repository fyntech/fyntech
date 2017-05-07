require 'active_support/all'

module Jekyll
  module TimeFilter
    def date_to_utc(input)
      tz = ActiveSupport::TimeZone.new(@@timezone)
      if input.is_a?(Time) 
      	time = tz.at(input)
      elsif input.is_a?(String) 
      	time = tz.parse(input)
      end
      return time.in_time_zone('UTC')
    end

  	@@timezone = Jekyll.configuration({})['timezone']
  end
end

Liquid::Template.register_filter(Jekyll::TimeFilter)