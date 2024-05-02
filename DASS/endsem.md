# Endsem prep

## Design Patterns

It is a codified method of describing problems and their solution which enables
reusability among software engineers.

It is a problem solution pair.

## Gang of Four

A design pattern is of 3 types:

- Creative: focus on "creation, composition, and representation of objects".
  - singleton patterns: patterns which ensure only one instance of class exist
    at any given point.
  - Abstract factory patterns: another layer of abstraction on factory patterns,
    which create a family of objects which are linked to each other based on
    some criteria
  - Factory method pattern: centralize creating of an object of a specific type,
    based on a given implementation. (pass implementation as argument)
- Structural: focus on how different objects and patterns organized and
  integrated to build a bigger structure.
  - Adapter: adapts a current interface to the one that client expects.
  - Aggregate Patterns: aggregates children
- Behavorial: address problems when assigning responsibilities between objects
  and the manner in which communication is effected between objects
