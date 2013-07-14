

PNML Elements
=============

The PNML format is extensible, every place, transition and arc can have a ''toolspecific'' section.
The toolspecific section contains joxa code or a simpler variant thereof (constructed via macros).
At some point of time, javascript code (that can call into the system) may be useful for non-programmers.
Pre-conditions and post-conditions could be specified via ''requires'' and ''provides'' elements.


Code task
---------
**Example element**

.. code-block :: xml
  <toolspecific>
    <input>
      <variable domain="kb">working-directory</variable>
      <variable domain="kb">job-id</variable>
    </input>
    <requires>
      <condition>working-directory-exists</condition>
    </requires>
    <code script="joxa">
      (let* (wd (plan-kb/get "working-directory")
             ji (plan-kb/get "job-id")
             tgt (filename/join wd (lists/flatten "wps-exec-" ji)))
	     (tasks-fsys/create-directory tgt)
	     (plan-kb/put "wps-exec-dir" tgt))
    </code>
    <output>
      <variable domain="kb">wps-exec-dir</variable>
    </output>
    <provides>
      <condition>wps-execution-directory-exists</condition>
    </provides>
  </toolspecific>


Verification
------------

* the network would be **consistent** if every variable in the <input> section would be guaranteed to be defined when the transition is enabled (regardless of history)

