require "./spec_helper"

describe Text::WhiteSimilarity do

  it "should test_similarity" do
    word = "Healed"
    Text::WhiteSimilarity.similarity(word, "Sealed").should be_close 0.8, 0.01
    Text::WhiteSimilarity.similarity(word, "Healthy").should be_close 0.55, 0.01
    Text::WhiteSimilarity.similarity(word, "Heard").should be_close 0.44, 0.01
    Text::WhiteSimilarity.similarity(word, "Herded").should be_close 0.40, 0.01
    Text::WhiteSimilarity.similarity(word, "Help").should be_close 0.25, 0.01
    Text::WhiteSimilarity.similarity(word, "Sold").should be_close 0.0, 0.01
  end

  it "should test_similarity_with_caching" do
    word = "Healed"

    white = Text::WhiteSimilarity.new
    white.similarity(word, "Sealed").should be_close 0.8, 0.01
    white.similarity(word, "Healthy").should be_close 0.55, 0.01
    white.similarity(word, "Heard").should be_close 0.44, 0.01
    white.similarity(word, "Herded").should be_close 0.40, 0.01
    white.similarity(word, "Help").should be_close 0.25, 0.01
    white.similarity(word, "Sold").should be_close 0.0, 0.01
  end

  it "should test_should_not_clobber_cached_values" do
    white = Text::WhiteSimilarity.new
    word = "Healed"
    white.similarity(word, word).should eq white.similarity(word, word)
  end

  it "should test_similarity_with_examples_from_article" do
    Text::WhiteSimilarity.similarity("GGGGG", "GG").should be_close 0.4, 0.01
    Text::WhiteSimilarity.similarity("REPUBLIC OF FRANCE", "FRANCE").should be_close 0.56, 0.01
    Text::WhiteSimilarity.similarity("FRANCE", "QUEBEC").should be_close 0.0, 0.01
    Text::WhiteSimilarity.similarity("FRENCH REPUBLIC", "REPUBLIC OF FRANCE").should be_close 0.72, 0.01
    Text::WhiteSimilarity.similarity("FRENCH REPUBLIC", "REPUBLIC OF CUBA").should be_close 0.61, 0.01
  end

  it "should test_similarity_with_equal_strings" do
    Text::WhiteSimilarity.similarity("aaaaa", "aaaaa").should eq 1.0
    Text::WhiteSimilarity.similarity("REPUBLIC OF CUBA", "REPUBLIC OF CUBA").should eq 1.0
  end
end
