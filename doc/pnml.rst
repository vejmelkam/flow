

PNML Elements
*************

The PNML format is extensible, every place, transition and arc can have a ''toolspecific'' section.
The toolspecific section contains joxa code or a simpler variant thereof (constructed via macros).
At some point of time, javascript code (that can call into the system) may be useful for non-programmers.
Pre-conditions and post-conditions could be specified via ''requires'' and ''provides'' elements.

Graphics elements can be safely ignored.


Example place
^^^^^^^^^^^^^

    <place id="p9">
      <name>
        <text>p9</text>
        <graphics>
          <offset y="240" x="780"/>
        </graphics>
      </name>
      <graphics>
        <position y="200" x="780"/>
        <dimension y="40" x="40"/>
      </graphics>
    </place>


Example transition
^^^^^^^^^^^^^^^^^^

    <transition id="t7_op_1">
      <name>
        <text>or-join</text>
        <graphics>
          <offset y="240" x="720"/>
        </graphics>
      </name>
      <graphics>
        <position y="200" x="720"/>
        <dimension y="40" x="40"/>
      </graphics>
      <toolspecific version="1.0" tool="WoPeD">
        <operator type="105" id="t7"/>
      </toolspecific>
    </transition>


Example arc
^^^^^^^^^^^

    <arc target="t6" source="p3" id="a33">
      <inscription>
        <text>1</text>
      </inscription>
      <graphics/>
    </arc>




Example element
^^^^^^^^^^^^^^^

.. code-block:: xml
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
                (plan-kb/put "wps-exec-dir" tgt)
                (tasks-fsys/create-directory tgt))
      </code>
      <output>
        <variable domain="kb">wps-exec-dir</variable>
      </output>
      <provides>
        <condition>wps-execution-directory-exists</condition>
      </provides>
    </toolspecific>


Verification
^^^^^^^^^^^^

* the network would be **consistent** if every variable in the <input> section would be guaranteed to be defined when the transition is enabled (regardless of history)

