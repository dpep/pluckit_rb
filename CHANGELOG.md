## Unreleased
- Requires Ruby 3.3 or newer.

###  1.3.1  (2026-11-03)
  - fix: `PluckIt.pluck` on other Enumerables (Range, Enumerator, lazy) returns an Array (or a lazy enumerator) instead of raising NoMethodError
  - fix: `PluckIt.pluck` on a frozen Array, Hash, or Set returns a new result instead of raising FrozenError

###  1.3.0  (2026-11-03)
  - drop Ruby 3.0 and 3.1 (end of life); requires Ruby >= 3.2
  - feature: a callable handle (lambda, proc, Method) is called with each value: `users.pluck(->(u) { u.name.upcase })`

###  1.2.0  (2026-04-11)
  - ruby and gem updates

