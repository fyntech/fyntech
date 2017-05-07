module Jekyll
  module IcsFilter
    def split_string(input)
      output = ""
      prepend = " "
      length = 75
      splitArray = input.chars.each_slice(length - prepend.length).map(&:join)
      splitArray.each_with_index do |string, index|
      	output += string
      	if index != splitArray.size - 1
		  output += "\n" + prepend
		end
      end
      return output
    end
  end
end

Liquid::Template.register_filter(Jekyll::IcsFilter)
