require "./spec_helper"

def read_as_array(filename)
  lines = [] of String
  File.each_line(filename) { |line|
    lines << line.chomp
  }
  return lines
end

describe Text::Stemmer do
  it "should stem input to output" do
    input_words  = read_as_array("spec/data/input.txt")
    output_words = read_as_array("spec/data/output.txt")

    input_words.size().times do |i|
      input_words[i].stem.should eq output_words[i]
    end  
  end
end
