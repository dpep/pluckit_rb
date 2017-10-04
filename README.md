PluckIt
======

Extract values from Enumerables

#### Install
```gem install pluckit```


#### Usage
```
require 'pluckit'


[
  { k: 'a', v: 1 },
  { k: 'b', v: 2 },
  { k: 'c', v: 3 },
].pluck :k
=> [ 'a', 'b', 'c' ]
```
