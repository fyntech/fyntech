module Jekyll
  module IcsFilter
    def string_split(input)
      splitArray = input.chars.each_slice(75).map(&:join)
      output = ""
      splitArray.each_with_index do |string, index|
      	output += string
      	if index != splitArray.size - 1
		  output += "\n "
		end
      end
      return output
    end
  end
end

Liquid::Template.register_filter(Jekyll::IcsFilter)
