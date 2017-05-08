module Jekyll
  module IcsFilter
    def split_string(input, length = 75, prepend = " ")
      output = ""
      splitLines = input.lines
      splitLines.each do | line | 
        splitArray = line.chars.each_slice(length - prepend.length).map(&:join)
        if splitArray.length == 1
          output += splitArray[0]
        else
          splitArray.each_with_index do |string, index|
            output += string
            if index != splitArray.size - 1
              output += "\n" + prepend
            end
          end
        end
      end
      return output
    end
  end
end

Liquid::Template.register_filter(Jekyll::IcsFilter)
