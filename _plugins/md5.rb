require 'digest/md5'

module Jekyll
  module GenerateHash
    def md5(input)
      hash(input)
    end

    private :hash

    def hash(string)
      Digest::MD5.hexdigest(string)
    end
  end
end

Liquid::Template.register_filter(Jekyll::GenerateHash)