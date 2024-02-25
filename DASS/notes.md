
## Opportunistic approach

### Steps:

1. First prototype that has minimal features and works.
1. Modify and maintain untill these features are very usable.
1. Think of a new feature or improvement.
1. Go to step 2

### Disadvantages

- Good for personal projects.
- Bad for large scale ones where delivery on time with quality is important.


## Lifecycle Model / Process Model

### Steps (example):

1. One engineer starts writing code,
1. Other writes docs and testing
1. Other defines the file structure
1. Other defines the interface and I/O

### Features:

1. Descriptive diagramatic model. (planning, feasibility study, required tools)
1. Identify all the activities required for product developement (requirements analysis)
1. Has a precedence ordering among different activities (timeline flowchart with dependencies)
1. Life cycle of product developement is divided into phases.

## SDLC ( Software developement life cycle )

### Stages of software developement life cycle.

1. Communication - Requirements and stuff
1. Planning - Estimation, Scheduling and Tracking
1. Modeling - analysis, design
1. Construction - code, test
1. Deployment - delivery, support, feedback

### Simplified version of SDLC (phases).

1. Feasibility study / Planning ( requires monetary study ).
1. Requirements Engineering.
1. Architecture / Design.
1. Implementation.
1. Testing.
1. Maintenance.

### Requirements

Get the exact requirements, document them, analyse them, add some from your side
and then verify with the customer.

### Designs

- Try to design in a way that is compatible with some programming language.

### High level design

- decompose things into modules and establish relationship between these modules

### Detailed design

- Write the data structrues and algos required for this, and different modules designed in detail.

### Implementation

- During the implementation we write code for the above design
- At the end, all these modules are tested seperately.

### Integration and testing

- These modules are integrated through a number of steps, and partial systems are tested.

### System testing

- After all modules are linked seperately, you need to test overall features mentioned in requirements.

### Maintenance

Types of maintenance

- Preventive maintenance: Foresee the future and try to prevent errors
- Corrective maintenance: Correct errors which were not discovered during the product developement.
- Perfective maintenance: Improve implementation / enhance functionalities
- Adaptive maintenane: Port software to new environments etc.


# Types of process models

## Traditional SDLC (Waterfall process model)

As mentioned above, will write again for practice:

1. Planning - Project plan, estimates, schedule
1. Requirements - schedule, risk mgmt, tools needed
1. Analysis / Design - GUI prototypes, Design Document
1. Implementation - code
1. Testing
1. Release

## Prototype Model ( also traditional )

1. Requirement Gathering
1. Quick design with available info
1. Build prototype
1. Show customer and refine requirements
1. Back to step 2
1. after customer is satisfied
1. Final Design
1. Implement
1. Test
1. Maintain

A prototype is just a toy application, used to show the customer if that's what he
actually wants.

## Incremental Model ( very traditional )

Each increment is a mini waterfall. Built upon the previous one.

1. increment #1
1. increment #2
1. increment #3

Its called iterative incremental model if the same steps of water fall are repeated.

## Common Callenges with traditional models

- This is overkill for Lightweight applications.
- Document intensive, produced unneeded documents.
- Less flexible design.
- Big-Bang approach for coding, (coding is only one phase, so no proper customer evals)
    ( Its good to take a break and make necessary changes to existing design or requirements )
- Testing is often short-shifted
- One-shot delivery opportunity, not always successfull, may need to go back to coding to make delivery happen.
- Limited or no time given for optimization and process improvement.

# Agile bs

Application of Agility:

1. Planning
1. Release 1
1. Release 2
1. Final Release

Each release has all the traditional things:
1. User Stories
1. Test Plan
1. Implement
1. Test
1. Demo/Delivery
1. Reflect

To be agile is to be quick and continuous.

## Extreme Programming

Many Many 100s of iterations of waterfall, like once a week.

## Scrum (Scam) Process

This works for teams even though they are not good devs.

The order is:

1. A chunk of is taken in each sprint Product Backlog.
1. There is a sprint plan/meet and a sprint backlog is taken up or added
    from the previous iteration.
1. Every sprint takes 1-4 weeks and there is a sprint review + retrospective happening
    every once in a day
1. After the iteration is complete we have a chunk of finished work incremented to the final
    working product.

## Characteristics of Agile Dev

- Incemental developement (releases)
- Each iteration touches all life-cycle activities.
- Each release has testing
- Flexible Design.
- Reflection after each release cycle.
- Several Technical and customer focused presentation opportunities.
- Test-Driven developement
- Continuous integration - not big bang
- Refactoring - going back and changing small things to fix bugs

## Continuous Integration and Delivery

- Integration is when all the code getting pushed gets tested for changes. If free of bug
    fixes they are ready to be deployed.
- The deployment occurs manually.

Continuous Delivery goes a step further and handles the releases too.


## Operations

There are things other than making software that need to be taken care of.

- Managing / Allocating harware / OS databases, resources.
- Monitoring load spikes, performance, crashes, hardware updates.
- Backups Rollbacks releases.

The coordination between Developers and Operators is called System Administration.
They are known to use a lot of tools for this integration purposes.

## DevOps

These are the things that DevOps do:

- Continuous Integration.
- Continuous Delivery.
- Infrastructure as code, test and deploy in containers.
- Monitoring and logging
- Microservice architecture
- Communicate and Collaborate.

# Estimation

Its always good to make estimates after more things are known about the project.
Its always good to average out many people's estimates together. The law of Large numbers (SLLM)
# FPA

Steps

1. Count the number of business functions per category
1. Assign each of them complexity factor
1. This is called UFPT (Unadjusted function point total)
1. Calculate the influence multiplier for the project (based on 14 different metrics)
1. Multiply the Influence multiplier. (AFPT is formed)
1. Now calculate effort and time based on FPTs.

# Wideband Delphi

Group agreement, present experts with response form. Collect anonymous opinions and feedback.
Conduct another round of above till there is overall agreement.

Disadvantages:
- May take long time to reiterate the process.
- Fails to reach consensus at all.


# Scheduling and Tracking

1. Work Breakdown structure (what needs to be done)
1. Size estimation (done already)
1. Identify dependencies make a topology
1. Make a schedule with estimation of duration

## Partitioning

Decompose your schedule into manageable chunks, Then divide and conquer

Division into three parts:
1. Functions - Spans the life of a project, usually divides horizontally (risk management, change management)
1. Activities - element of work with its own set of cost, duration and resources
1. Tasks - Lowest level of work.

## WBS (Work Breakdown Structure)

Is a checklist of work to be accomplished. It lists project outputs and departments responsible for it.

Most WBS have different levels Level 1,2,3,4 where each ones get more specific on what to do.

### Types of WBS

- Process WBS - Activity oriented, used by PM ( like division between different phases )
- Product WBS - Function / Entity oriented, used by Engineer Manger ( like division in things to make )
- Hybrid WBS

### While making WBS things to keep in mind

- List of activities not things (even in product based)
- List of items can be gathered by stakeholders.
- Do not plan more than you can manage try to keep simple, use subdivisions as much as possible
- Base your WBS based on some other WBS, use a template

### Tasks

Tasks should be small (usually 1-2 person 1-2 weeks), and each tasks has a definable end result.


# Sequence of Work (how)

## Milestone chart

Just a simple list of all activities with checkboxes, like WBS

## Gantt chart

Just a simple chart that contains a list of activities, estimated cost and duration for
that task. Doesn't show interdependencies of project

## Network Techniques

- CPM (Critical Method): You create topology as specified. But you calculate possible paths, when one thing
    gets delayed how much delay does it cause for other. Certain activities can be run in parallel or postponed etc.
    - Critical Path = The worst case or the longest possible path.
    - Slack Time = Maximum amount of delay allowed for non critical activity.

- Pert (Program Evaluation and Review Technique): A Topology or precedence flowchart is created. Also contains
    duration and dependencies.


# Requirement analysis

One of the main reasons products fail is because there is lack of input from users and requirements not satisfied
or wrongly done.

A requirement is a short and concise statement, that all stakeholders agree with and helps solve customer's
problems.

## Scope

Try to be as precise as possible with the requirements, exclude things if too broad.

## Types of requirements

- Business Requirements - high level objectives
- Functional Requirements - describe what system does
- Non-Functional Requirements - things that are obviously expected

SRS document is  what is used to document requirements.

## Stages of Requirements

- Requirements Gathering and Analysis
- Requirements Specification

This is useful because analyst can easily obtain specification.
It is important to detect ambiguities and inconsistencies in the user requirements, thus analysis is required.

## Inconsistent Requirements and Incomplete Requirements

## Analysis of the gathered requirements

Requirements analysis involves:

- Obtaining a clear, in-depth understanding of the application to be developed.
- Remove all ambiguities and inconsistencies from Customer perception.

## Software Requirements Specification

Systematically organize requirements into SRS after fixing all ambiguities.

## Quality requirements

- Correct: Only user required stuff, don't add things on ur own
- Feasible: Doable in budget
- Necessary: Trace each requirement back to origin (reason)
- Unambiguous: one interpretation
- Verifiable: proper way to check
- Prioritized: good to convert into FPA

## Prototyping

- Simplest kind, use a mockup language, and not perform any computations.

# SRS

SRS can be used in the following context

- Statement of user needs
- Contract document (contract between dev and customer)
- Reference document (during any controversies we refer back to SRS)
- Definition of implementation

SRS is a black box of specification, only input and output is documented implementation details
are left for design. ( what not how )

## Good SRS document

- Be concise but not ambiguous
- Well structured and easy to change
- Should be consistent and complete
- Should be tracable and divided
- Should be verifiable ( have some test cases for them )

## Parts of SRS document

1. Functional Requirements - Every function changes input and transforms into output.
1. Non-Functional Requirements - Which do not have specific function, Maintainability, Portability, Usability
    - Performance Requirements: They go into specifying requirements on how the functional requirements
    should be done - fast, secure, reliable, easily usable.
    - External interface requirements: Non-Functional requirements also store information like, what OS/DBMS
    to use, hardware to be used
1. Goals of implementation - they consist of things that can't be verified, like future of the project

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
            Implementation  Unit testing   (individual modules tested in isolation)

The more testing done in the bottommost is the most useful.

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
    - Defining node (where it is defined or redefined), Usage node (where it is used)

### Other types

- Loop Boundary Analysis
    - Boundary conditions of a loop (only for a loop)
- Data Dependency Testing
    - Uses the knowledge of variables and data types. Like i32 may add to i64 if summed O(n).
- Path Predicate Testing
    -  Analyses conditions of a conditional to generate testcases ( if i > 0 has negetive and positive )
- Combinatorial Testing
    - Based on input parameters, if one bad, other. Other bad the one. (all cases)
- Error Guessing 
    - Using experience to guess
- Mutation Testing
    - Break what's not broken and test to see if it is detected as broken.
- Model Based Training
    - There are different states in a model, at each transition between state testing is done.
- Static program Analysis (linting)
    - Analysing source code without executing it to detect common malpractices, includes semantic (syntactic) analysis.

### Unit tests processes

- Writing testcase
- Framework Usage (pytest)
- Isolation of Unit
- Mocking/Stubbing (force isolation of unit)
- Regression testing (testing old testcases again after making small changes)
- Test coverage


## Integration testing

Integrate each pair and test them if they work well with each other.

Types:

- Big Bang: For small systems all things are put together and tested. ( not viable for bigger, number of unittests will be high )
- Top Down: Integrate higher modules and make stubs for lower ones. (stubs fake performance and cost is high)
- Bottom Up: Use drivers (fake upper layer) for upper level modules, Then integrate, then remove the drivers once a level is done.
- Critical-First: integrate critical components first others later.
- Function-at-a-time: integrate based on function they perform. ( May postpone function to function interaction )
- Integrate modules as and when delivered. ( missed schedules if certain ones take time )
- Sandwich - Use both top-down and bottom down integration.
