require "./spec_helper"
require "yaml"

describe Text::Soundex do
  it "should test_cases" do
    data = YAML.parse(File.read("spec/data/soundex.yml"))
    data.as_h.keys.each do |input|
      input = input.to_s
      expected_output = data[input].to_s
      Text::Soundex.soundex(input).should eq expected_output
    end
  end

  it "should test_should_return_nil_for_empty_string" do
    Text::Soundex.soundex("").should be nil
  end

  it "should test_should_return_nil_for_string_with_no_letters" do
    Text::Soundex.soundex("!@#123").should be nil
  end
end
