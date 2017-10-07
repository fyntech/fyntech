require 'meetup_client'

module MeetupFetcher
 class Generator < Jekyll::Generator
  	def convertDate(date, offset)
  		dateWithOffset = date + offset
  		convertedDate = "#{DateTime.strptime(dateWithOffset.to_s,'%Q')} #{@@timezone}"
  		return convertedDate
  	end

  	def generate(site)
  		@site = site
  		collection = @site.collections["events"]

		MeetupClient.configure do |config|
		  config.api_key = ENV['MEETUP_API_KEY']
		end

		meetup_api = MeetupApi.new

		@@meetup_groups.each do |organizer|
			events = meetup_api.events({ group_urlname: organizer })

			events['results'].each do |event|
				doc = Jekyll::Document.new('', :site => site, :collection => collection)
				doc.data['title'] = event['name']
				doc.data['dateStart'] = convertDate(event['time'],event['utc_offset'])
				if event['duration']
					doc.data['dateEnd'] = convertDate(event['time']+event['duration'],event['utc_offset'])
				end
				if event['venue']
					doc.data['location'] = "#{event['venue']['name']}<br>#{event['venue']['address_1']}"
				end
				doc.data['link'] = event['event_url']
				doc.data['organizer'] = event['group']['name']
				doc.data['category'] = event['group']['name'].downcase.gsub(/\s+|[():]/, "")
				doc.data['excerpt'] = event['description']
				collection.docs << doc
			end
		end
  	end
  	@@timezone = Jekyll.configuration({})['timezone']
  	@@meetup_groups = Jekyll.configuration({})['meetup_groups']
  end
end