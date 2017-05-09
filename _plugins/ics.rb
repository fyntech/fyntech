module Jekyll
  module IcsFilter
    def split_string(input, length = 75, prepend = " ")
      output = ""
      splitLines = input.lines
      splitLines.each do | line | 
        if line.bytesize <= length
          output += line
        else
          output += line.byteslice(0,length)
          i = length
          while i < line.bytesize do
            output += "\n" + prepend + line.byteslice(i, length - prepend.bytesize)
            i = i + length - prepend.bytesize
          end
        end
      end
      return output
    end

    def convert_to_crlf(input)
      input.gsub /\n/, "\r\n"
    end
  end
end

Liquid::Template.register_filter(Jekyll::IcsFilter)
