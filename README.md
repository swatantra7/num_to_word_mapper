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
2.4.1 :004 > puts Benchmark.measure { 2282668687.to_words }
  0.730000   0.000000   0.730000 (  0.732458)

```

Examples:

```
$ bin/console
2.4.1 :005 > 2282668687.to_words
 => [["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "amounts"], ["cat", "contour"], ["act", "boo", "tots"], ["act", "boo", "tour"], ["act", "con", "tots"], ["act", "con", "tour"], ["act", "coo", "tots"], ["act", "coo", "tour"], ["bat", "boo", "tots"], ["bat", "boo", "tour"], ["bat", "con", "tots"], ["bat", "con", "tour"], ["bat", "coo", "tots"], ["bat", "coo", "tour"], ["cat", "boo", "tots"], ["cat", "boo", "tour"], ["cat", "con", "tots"], ["cat", "con", "tour"], ["cat", "coo", "tots"], ["cat", "coo", "tour"], ["act", "boot", "mus"], ["act", "boot", "nus"], ["act", "boot", "our"], ["act", "coot", "mus"], ["act", "coot", "nus"], ["act", "coot", "our"], ["bat", "boot", "mus"], ["bat", "boot", "nus"], ["bat", "boot", "our"], ["bat", "coot", "mus"], ["bat", "coot", "nus"], ["bat", "coot", "our"], ["cat", "boot", "mus"], ["cat", "boot", "nus"], ["cat", "boot", "our"], ["cat", "coot", "mus"], ["cat", "coot", "nus"], ["cat", "coot", "our"], ["acta", "mounts"], ["acta", "mot", "mus"], ["acta", "mot", "nus"], ["acta", "mot", "our"], ["acta", "not", "mus"], ["acta", "not", "nus"], ["acta", "not", "our"], ["acta", "oot", "mus"], ["acta", "oot", "nus"], ["acta", "oot", "our"], "catamounts"] 
2.4.1 :006 > 6686787825.to_words
 => [["mot", "opt", "puck"], ["mot", "opt", "ruck"], ["mot", "opt", "suck"], ["mot", "ort", "puck"], ["mot", "ort", "ruck"], ["mot", "ort", "suck"], ["not", "opt", "puck"], ["not", "opt", "ruck"], ["not", "opt", "suck"], ["not", "ort", "puck"], ["not", "ort", "ruck"], ["not", "ort", "suck"], ["oot", "opt", "puck"], ["oot", "opt", "ruck"], ["oot", "opt", "suck"], ["oot", "ort", "puck"], ["oot", "ort", "ruck"], ["oot", "ort", "suck"], ["mot", "opts", "taj"], ["mot", "opus", "taj"], ["mot", "orts", "taj"], ["not", "opts", "taj"], ["not", "opus", "taj"], ["not", "orts", "taj"], ["oot", "opts", "taj"], ["oot", "opus", "taj"], ["oot", "orts", "taj"], ["noun", "struck"], ["onto", "struck"], ["noun", "pup", "taj"], ["noun", "pur", "taj"], ["noun", "pus", "taj"], ["noun", "sup", "taj"], ["noun", "suq", "taj"], ["onto", "pup", "taj"], ["onto", "pur", "taj"], ["onto", "pus", "taj"], ["onto", "sup", "taj"], ["onto", "suq", "taj"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"]
2.4.1 :007 > 7686787825.to_words
 => [["pot", "opt", "puck"], ["pot", "opt", "ruck"], ["pot", "opt", "suck"], ["pot", "ort", "puck"], ["pot", "ort", "ruck"], ["pot", "ort", "suck"], ["rot", "opt", "puck"], ["rot", "opt", "ruck"], ["rot", "opt", "suck"], ["rot", "ort", "puck"], ["rot", "ort", "ruck"], ["rot", "ort", "suck"], ["sot", "opt", "puck"], ["sot", "opt", "ruck"], ["sot", "opt", "suck"], ["sot", "ort", "puck"], ["sot", "ort", "ruck"], ["sot", "ort", "suck"], ["sou", "opt", "puck"], ["sou", "opt", "ruck"], ["sou", "opt", "suck"], ["sou", "ort", "puck"], ["sou", "ort", "ruck"], ["sou", "ort", "suck"], ["pot", "opts", "taj"], ["pot", "opus", "taj"], ["pot", "orts", "taj"], ["rot", "opts", "taj"], ["rot", "opus", "taj"], ["rot", "orts", "taj"], ["sot", "opts", "taj"], ["sot", "opus", "taj"], ["sot", "orts", "taj"], ["sou", "opts", "taj"], ["sou", "opus", "taj"], ["sou", "orts", "taj"], ["roto", "struck"], ["roto", "pup", "taj"], ["roto", "pur", "taj"], ["roto", "pus", "taj"], ["roto", "sup", "taj"], ["roto", "suq", "taj"], ["rotor", "truck"], ["rotor", "usual"], ["rotos", "truck"], ["rotos", "usual"]] 
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
    #to_words
      Except Result For 6686787825
      should take time less than 1000 ms

Finished in 2.13 seconds (files took 0.13574 seconds to load)
5 examples, 0 failures


```

