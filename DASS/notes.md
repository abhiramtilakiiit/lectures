# Use cases

They tell stories of actors using the system. Use Case senario is a set of actions
taken to get some output to actor. It describes the whole process of when a user 
starts interacting with a process and obtains a result.

Use cases are good way to express requirements in SRS and use case diagrams help 
simplify that. 

## UML

- Use case is represented by a circle and has a name.
- actors are represented by stick figures, are role player by an entity with subject
- System/subject boundaries, are used to seperate actors with subjects
- Communication representeb by lines. ( no arrows )

## Types of use Cases

- Essential - basic uses cases that are independent
- Concrete - uses cases which build up on other use cases.

## Use case layout

- Number
- Name
- Overview
- Type
- Actors
- Pre-conditions
- Main Flow
- Alternate Flow
- Post-conditions
- Cross-references

## Organizing Use Cases

To avoid writing the flow everytime, we can organize existing use cases into categories

- Specializing / Generalizing use cases - Subusecases which is a special case for a generalized use case.
- Including use cases - Subusecases which have the flow as a subflow of a parent use case
- Extending use cases - A base use case can be extended by incorporting additoinal optional behaviour

## Class diagrams

Class is like ER diagram an entity, which has names and attributes.

### Syntax

name [multiplicity (like N-M in ER)] [: type (like String, Digits)] [{property-string (like Read-Only)}]

- Slash at the start means derived attributes.
- Private is (-), public is (+)

### Static Relations

- Associations - structural relationships ( just lines no arrows )
- Generalizations - generalization/specialization class ( lines with triangles at ends )

Association like in ER has N-M written on each edge.
There are no foreign keys here, make a new class if needed.
Just like ER there are role-names for each participating class.

### Aggregations 

Instead of classes there are parts and wholes, parts < wholes ( lines with diamonds at end )
There are different types of aggregations.

- Composition ( strong aggregation ) - parts are strongly connected to whole, they can't exist without.

# Testing

We need to do testing at multiple stages since each stage has its own defects.

## Methods

- Checklists
- Standardize code ( use .editorconfig, or fixed libraries )
- Automating unit tests

## Code - Inspection

If Inspection, followed by defect correction has substantial changes. 

People:
- Author - Guy who wrote the code.
- Reader - Read code for the first time
- Inspector - Do homework and come and say shit
- Moderator - keeps disuccsion on track
- Scribe - notes down everything

## V - Model of software testing

Requirements                            Acceptance testing   # if the client likes it
    Architecture                    System Testing   # compatibility checks
        Design                  Integration testing  # second most heard of
            Implementation  Unit testing   # most heard of

## Equivalence class

Input should be divided into different groups according to how code treats it.
Thus a tester needs to classify and make equivalence classes for a given code and only one
testcase per equivalence class. 

- Combination of equivalence class - if inputs are independent make sure combination
    of each work
- Testing at boundaries. 

## Test Case

Input + steps + expected behaviour.

Uses of test cases are:

1. Find defects
1. Regulate specifcations
1. Regulate standards
1. Find safe senarios to use product ( if you can't fix it make it a feature)
1. Quality assurance
1. Decision making, block premature product releases.
1. Minimize future costs on debugging.

## Test Plan 

Layout of a formal test case

- Identification and classification (uid for testcase, make an equivalence class for it)
- Instructions ( write how to execute the test case )
- Expected results
- cleanup ( get back to original )

## White-box testing

Basically hacking in cf ( have access to design )
Can be applied to all levels like unit, integration, system.

Types:

- Coverage
    - Statement: basic requirement
    - Branch: Execute each branch atleast once. ( entering the branch is enough )
    - Condition
- Dataflow
    - Graph like structure try to access all paths. C = edges - nodes + 2 
    - Source node = Defining node, Sink node = Usage node.(DU)


### Other types

