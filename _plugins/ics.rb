module Jekyll
  module IcsFilter
    def split_string(input, length = 75, prepend = " ")
      output = ""
      splitLines = input.lines
      splitLines.each do | line | 
        if line.bytesize <= length
          output += line
        else
          firstline = utf8_valid(line.byteslice(0,length))
          output += firstline
          i = firstline.bytesize       
          while i < line.bytesize do
            nextline = utf8_valid(line.byteslice(i, length - prepend.bytesize))
            output += "\n" + prepend + nextline
            i = i + nextline.bytesize
          end
        end
      end
      return output
    end

    def utf8_valid(input)
      if input.valid_encoding?
        return input
      end
      while !input.valid_encoding?
        input = input.byteslice(0,input.bytesize - 1)
      end
      return input
    end

    def convert_to_crlf(input)
      input.gsub /\n/, "\r\n"
    end

    def generate_sequence(time)
      sequence = time.to_i
      return sequence
    end
  end
end

Liquid::Template.register_filter(Jekyll::IcsFilter)
