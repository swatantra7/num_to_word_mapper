# NumToWordMapper

This Gem will convert 10 digit number to words and fetch all the possible word combination from dictionary.


## Usage

Setup:

```
bundle install
bin/setup
```

Execution Benchmark:

```
$ bin/console
2.4.0 :001 > require 'benchmark'
 => true
2.4.0 :002 > puts Benchmark.measure { 2282668687.to_words }
  0.320000   0.010000   0.330000 (  0.330164)
```

Examples:

```
$ bin/console
2.4.1 :001 > 2282668687.to_words
 => [["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], "catamounts", ["cat", "contour"], ["acta", "mounts"]] 
2.4.1 :002 > 6686787825.to_words
 => [["noun", "struck"], ["onto", "struck"], "motortruck", ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"]]
2.4.1 :003 > 7686787825.to_words
 => [["roto", "struck"], ["rotor", "truck"], ["rotor", "usual"], ["rotos", "truck"], ["rotos", "usual"]]
```

Rspec Report:

```

$ rspec spec -fd

NumToWordMapper
  has a version number
  Validations
    #number
      Should not accept 123456
      Should not accept 1 and 0
  Instance Methods
    #words
      Except Result For 6686787825
      should take time less than 1000 ms

Finished in 1.31 seconds (files took 0.1306 seconds to load)
5 examples, 0 failures
```

