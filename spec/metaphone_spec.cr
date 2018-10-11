require "./spec_helper"
require "csv"
require "yaml"

describe "Double Metaphone" do
  it "should test_cases" do
    f = File.open("spec/data/double_metaphone.csv", "r")
    CSV.each_row(f) do |row|
      primary, secondary = Text::Metaphone.double_metaphone(row[0])
      primary.should eq row[1]
      if secondary.nil?
        primary.should eq row[2]
      else
        secondary.should eq row[2]
      end
    end
  end
end

describe "Single Metaphone" do
  it "should metaphone" do
    YAML.parse(File.read("spec/data/metaphone.yml")).as_h.each do |input, expected_output|
      Text::Metaphone.metaphone(input.to_s).should eq expected_output.to_s
    end
  end

  it "should test_junk" do
    Text::Metaphone.metaphone("foobar").should eq Text::Metaphone.metaphone("%^@#$^f%^&o%^o@b#a@#r%^^&")
    Text::Metaphone.metaphone("foobar", {"buggy"=>"true"}).should eq Text::Metaphone.metaphone("%^@#$^f%^&o%^o@b#a@#r%^^&", {"buggy"=>"true"})
  end

  it "should test_caps" do
    Text::Metaphone.metaphone("foobar").should eq Text::Metaphone.metaphone("FOOBAR")
    Text::Metaphone.metaphone("foobar", {"buggy"=>"true"}).should eq Text::Metaphone.metaphone("FOOBAR", {"buggy"=>"true"})
  end

  it "should test_string" do
    Text::Metaphone.metaphone("foo bar baz").should eq "F BR BS"
    Text::Metaphone.metaphone("gnu what").should eq "N WT"
    Text::Metaphone.metaphone("foo bar baz", {"buggy"=>"true"}).should eq "F BR BS"
    Text::Metaphone.metaphone("gnu what", {"buggy"=>"true"}).should eq "N WT"
  end

end
