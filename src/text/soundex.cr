#
# Crystal implementation of the Soundex algorithm,
# as described by Knuth in volume 3 of The Art of Computer Programming.
#

module Text
  module Soundex

    def soundex(str_or_arr)
      case str_or_arr
      when ::String
        soundex_str(str_or_arr)
      when Array(::String)
        str_or_arr.collect{|ele| soundex_str(ele)}
      else
        nil
      end
    end

    #
    # returns nil if the value couldn't be calculated (empty-string, wrong-character)
    # do not change the parameter "str"
    #
    private def soundex_str(str)
      str = str.upcase.gsub(/[^A-Z]/, "")
      return nil if str.empty?

      last_code = get_code(str[0,1])
      soundex_code = str[0,1]

      (1..(str.size)).each do |index|
        return soundex_code if soundex_code.size == 4

        code = get_code(str[index,1])

        if code == "0" 
          last_code = nil
        elsif code != last_code 
          soundex_code += code
          last_code = code
        end
      end # for

      return soundex_code.ljust(4, '0')
    end

    private def get_code(char)
      char.tr "AEIOUYWHBPFVCSKGJQXZDTLMNR", "00000000111122222222334556"
    end

    extend self
  end
end