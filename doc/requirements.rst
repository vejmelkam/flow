

Erlang workflow manager 
=======================


System requirements
-------------------

  * Plan definitions can be stored in ets tables and databases
  * In principle plan definitions should be editable using web or petri net planner
  * All generic and specialized tasks implemented in erlang or joxa
  * Maybe: *javascript* scripting language
  * Each plan has a key-value knowledge base, which guides the execution
  * The plan can be stopped and restarted at any time (i.e. even when external tasks are being executed)


The plan runner
---------------
  * Each plan has a ''plan-runner'' which follows execution and stores statistical information on the tasks
  * The plan runner tracks existing tasks and is able to dispose of them cleanly
  * The plan runner answers queries as to where in the network the plan is and how many tasks remain
  * The plan runner is able to estimate completion time based on past plan executions (under the assumptions that run times for repeated executions come from one distributions)
  * The plan should be partly verifiable (i.e. variable names in tasks) before running


Tasks
-----
  * Each executed task must have its own task-id so that its performance characteristics can be tracked over time
  * Tasks can be reasonably implemented as behaviors (erlang) or namespaces (joxa, here joxa is a win, multiple namespaces allowd in one module)
  * Task scripts have a library of functions available to (for example) manipulate times or filenames and have access to the plan knowledge base and can edit it


Model
=====

The tentative model for the control flow of the system is a petri net (with multiple moving tokens).  This approach has several advantages:

  * **place/transition petri nets** or **P/T Petri nets** have well-defined (and well-known) semantics that seem to be a good fit for the problem
  * tasks are well-matched with transitions, while state pre-conditions and effects can be modeled as places (parent-directory-exists -> (create-directory target) -> target-directory-exists)
  * tools are available to edit petri net diagrams, which would be a big win (no need for a separate editor)


Problems
--------

  * it is unclear whether standard Petri Net languages have provisions for storing executable code in transitions





