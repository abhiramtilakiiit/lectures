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










