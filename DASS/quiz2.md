# Dass quiz notess

## Different Design aspects

- Architecture Design (Divide into components and study how they interact,
  interface with each other) - State, Sequence (behaviour)
- Class Design: Class diagram
  Various features of each class (inside class)
- User Interface Design
- Algorithm Design
- Protocol Design

## Software Design

It is a way of expressing a solution to a problem without use of any programming
language.

### Fundamental Concepts of Software programming

- Abstraction: data, procedure, control (so that other one need not exactly know
  what is happening inside, but just happens and comes here).
- Seperation of concerns (Functional division): a complex problem can be divided
  into smaller pieces
- Modularity (Code division): Compartmentalization of Data and function
- Hiding (encapsulation): controlled interfaces (private and public)
- Refinement - Detail explanation of each abstraction, handles requirements
  fulfilment.
- Design Classes - design details which help analysis classes get implemented
- Patterns - prevent reinventing the wheel and using previously successfull
  stuff.

### Abstraction

For example the door contains its own, attributes and functions and doesn't know
anything about who is entering and why. All that is stored in the different
class

### Modularity

It costs a lot to integrate so find a trade-off.

### Coupling

This happens when there are a lot of interdependencies. Changes in one place
shouldn't affect changes in other place. Also makes it harder to understand how
thigns work.

## Class diagram

- Classes: represent the types of data themselves
- Associations: represent linkages between instances of classes
- Attributes: represent data found in classes
- Operations: represent the functions performed by the classs
- Generalizations: group classes into inheritence hierarchies

### Generalizations

Discriminator is the criteria used to generalize the subclasses.

### Interface

It is a bunch of classes, without variables or with.

## Behavorial classes

Behaviour is dynamic unlike a class and can change different states.

- State diagram: provides description sequences of operations without regard of
  what operations do.
- Sequence diagrams: describe interactions among object

### Interaction of sequence diagram

Messages are individual units of calls.
Life line is the box
Timeline is the vertical arrow (starting point is what is important)

### State Diagrams

A state diagram specifies the life history of an object in terms of sequence of
operations.

A state diagram describes the behaviour in terms of sequences of states, in
response to events.

- **Event** is an instantaneous action, that acts as trigger for change in state
  diagram.
- **State** is an instance of attributes and values of a class, which is given a
  name to abstract out the values.
- **Transition** occurs when event causes state change on **guard condition** being
  satisfied.
- **Protocol state machines** - Have pre and post conditions added to an
  operation.

## Quality of design

- If you need to change more things, bad quality

### Quality attributes

The totality of features or characteristics which bear upon its ability to
satisfy requirements.

### Types of Quality

- Business qualities
- System qualities
- Architectural qualities

### RDD (Responsibility driven developement)

Responsibility is an obligation of a class in terms of its role. It can be of
two types:

- Doing: starting an action, controlling and coordinating other activities.
- Knowing: Knowing about some private data, about other object's public data,
  things it can derive and calculate (private function)

### Grasp (General Responsibility assignment software patterns)

Coupling is how strongly one element is connected to or has the knowledge of
other elements. Try to keep coupling as low as possible while fulfilling
responsibilities.

### MVC Pattern

- Model - Makes a class with everything private
- View - components that displays data from model
- controller- components that handles, input output of model (user interacts
  with controller)
