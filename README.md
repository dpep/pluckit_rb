PluckIt
======
![Gem](https://img.shields.io/gem/dt/pluckit?style=plastic)
[![codecov](https://codecov.io/gh/dpep/pluckit_rb/branch/main/graph/badge.svg?token=Z6W48XUEQD)](https://codecov.io/gh/dpep/pluckit_rb)

Extract values from Enumerables

#### Install
```gem install pluckit```


#### Usage
```ruby
require 'pluckit'


# extract a field from a list of records
[
  { id: 1, name: 'alice', age: 30},
  { id: 2, name: 'bob', age: 24},
  { id: 3, name: 'charlie', age: 88},
].pluck :name
=> [ 'alice', 'bob', 'charlie' ]


# find max temp for each month
{
  june: [ 78, 82, 80 ],
  july: [ 80, 83, 86 ],
  august: [ 80, 76, 79 ],
}.pluck :max
=> {
  june: 82,
  july: 86,
  august: 80,
}


# or pass anything callable
[ 'alice', 'bob' ].pluck ->(name) { name.capitalize }
=> [ 'Alice', 'Bob' ]
```


#### Without the monkey patch
`require 'pluckit'` adds `#pluck` to Array, Hash, and Set. To skip the global patch, load the module alone and use the refinement, or call it directly:

```ruby
require 'pluckit/pluck'

using PluckIt
[ { id: 1 } ].pluck :id

# or
PluckIt.pluck [ { id: 1 } ], :id
```
