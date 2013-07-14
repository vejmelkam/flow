

Erlang workflow manager 
=======================


System requirements
-------------------
* Plan definitions can be stored in ets tables and databases
* In principle plan definitions should (ideally) be editable using web or petri net planner
* For optimal interoperability, the plan should be exportable to/importable from PNML
* All generic and specialized tasks implemented in ''task library''
* Maybe *javascript* scripting language
* Each plan has a key-value knowledge base (i.e. ets table), which guides the execution
* The plan can be stopped and restarted at any time (i.e. even when external tasks are being executed)


The plan runner
---------------
* Each plan has a ''plan-runner'' which follows execution and stores information on the tasks
* The plan runner tracks existing tasks and is able to pause execution of network, restart the network and dispose of all tasks cleanly
* The plan runner answers queries as to where in the network the plan is and how many tasks remain
* The plan runner is able to estimate completion time based on past plan executions (under the assumptions that run times for repeated executions come from one distribution)
* The plan should be partly verifiable (i.e. variable names in tasks) before running


Tasks
-----
* Each executed task must have its own task-id so that its performance characteristics can be tracked over time
* Tasks can be reasonably implemented as joxa macros, which define input parameters, their tooltips/comments, a string description of the task and the code the task executes
* Task scripts have a library of functions available to (for example) manipulate times or filenames and have access to the plan knowledge base and can edit it
* Each task is either a library (or standard) task or a code snippet --- the code snippet has access to the key/value store and to system functions (very powerful)


Model
=====

The tentative model for the control flow of the system is a petri net (with multiple moving tokens).  This approach has several advantages:

* **place/transition petri nets** or **P/T Petri nets** have well-defined (and well-known) semantics that seem to be a good fit for the problem
* tasks are well-matched with transitions, while state pre-conditions and post-conditions can be modeled as places (parent-directory-exists -> (create-directory target) -> target-directory-exists)
* tools are available to edit petri net diagrams, which would be a big win (no need for a separate editor)


Problems
--------

* it is unclear whether standard Petri Net languages have provisions for storing executable code in transitions





