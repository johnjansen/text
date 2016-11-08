# Text

[![GitHub version](https://badge.fury.io/gh/johnjansen%2Ftext.svg)](http://badge.fury.io/gh/johnjansen%2Ftext)
[![CI](https://travis-ci.org/johnjansen/text.svg?branch=master)](https://travis-ci.org/johnjansen/text)

A collection of text algorithms. Including; Porter-Stemmer, Soundex, Metaphone, Double Metaphone & White Similarity

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  text:
    github: johnjansen/text
```


## Usage


```crystal
require "text"
```

### Levenshtein distance
```
  Text::Levenshtein.distance('test', 'test')
  # => 0
  Text::Levenshtein.distance('test', 'tent')
  # => 1
  Text::Levenshtein.distance('test', 'testing')
  # => 3
  Text::Levenshtein.distance('test', 'testing', 2)
  # => 2
```
### Metaphone
```
  Text::Metaphone.metaphone('BRIAN')
  # => 'BRN'

  Text::Metaphone.double_metaphone('Coburn')
  # => ['KPRN', nil]
  Text::Metaphone.double_metaphone('Angier')
  # => ['ANJ', 'ANJR']
```
### Soundex
```
  Text::Soundex.soundex('Knuth')
  # => 'K530'
```
### Porter stemming
```
  Text::PorterStemming.stem('abatements')  # => 'abat'
```
### White similarity
```
  white = Text::WhiteSimilarity.new
  white.similarity('Healed', 'Sealed')   # 0.8
  white.similarity('Healed', 'Help')     # 0.25

```

## Contributing

1. Fork it ( https://github.com/johnjansen/text/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [johnjansen](https://github.com/johnjansen) John Jansen - creator, maintainer

## Thanks

- Paul Battley (threedaymonk)
- Michael Neumann
- Tim Fletcher
- Hampton Catlin (hcatlin)
- Wilker Lúcio
- everyone who contributed to https://github.com/threedaymonk/text
