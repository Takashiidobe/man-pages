.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdainstance(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MULTI-D                          |                                   |
| IMENSIONAL INSTANCE NAMING <#MULT |                                   |
| I-DIMENSIONAL_INSTANCE_NAMING>`__ |                                   |
| \| `CAVEAT <#CAVEAT>`__ \|        |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAINSTANCE(3)         Library Functions Manual         PMDAINSTANCE(3)

NAME
-------------------------------------------------

::

          pmdaInstance - return instance descriptions for a PMDA


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaInstance(pmInDom indom, int inst, char *name,
                  pmInResult **result, pmdaExt *pmda);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          pmdaInstance uses the standard PMDA(3) data structures to return
          information concerning the instance domain indom.

          The result structure is constructed by pmdaInstance and will
          contain one or more instance names and/or identifiers as
          specified by the inst and name arguments.

          If inst has the value PM_IN_NULL and name is a null string,
          result will contain all the instances names and identifiers in
          the instance domain.

          If inst is PM_IN_NULL but name is the name of an instance in the
          instance domain indom, then result will contain the instance
          identifier for instance name.  Note that if name contains no
          spaces, partial matching up to the first space in the instance
          name is performed, i.e.  ``1'' will match instance name ``1
          minute''.  If name contains an embedded space, then no partial
          matching is performed and name should match one of the instance
          names exactly.

          If name is a null string but inst is an instance identifier in
          the instance domain indom, then result will contain the name for
          instance inst.  The result structure is allocated with malloc(3)
          and should be released by the caller with free(3).


-----------------------------------------------------------------------------------------------------------

::

          Further to the above description of name, the set of rules
          describing external instance names is provided in the
          pmdaCacheStore(3) manual page.

          Instance domains adds another dimension (set of values) to
          metrics.  However, this may not suffice to describe complex
          multi-dimensional instance domain situations.  For this case the
          approach used by a number of PMDAs is to structure the external
          instance names using a delimiter (``/'' or ``::'' are most
          commonly used) to allow separation of the other dimensions.  In
          this situation, instance domain labels should be used to define
          names for each instance name component.  This allows PMAPI(3)
          client tools to identify and refine value fetches to specific
          dimensions of interest.

          For example, some of the Linux kernel cgroup (control group)
          metric instance domains are multi-dimensional.  The instance
          domain represents individual values across both control groups
          and CPUs, making this a two-dimensional instance domain.  The
          instance names associated with this cgroup metrics indom have
          been structured using the ``::'' delimiter to separate the two
          dimensions.  The instance domain itself has been labeled
          accordingly, as follows.

          $ pminfo --desc --fetch --labels cgroup.cpuacct.usage_percpu
          cgroup.cpuacct.usage_percpu
               Data Type: 64-bit unsigned int  InDom: 3.22 0xc00016
               Semantics: counter  Units: nanosec
               inst [0 or "/::cpu0"] value 713787
               inst [1 or "/::cpu1"] value 353969
               inst [2 or "/app::cpu0"] value 407816
               inst [3 or "/app::cpu1"] value 202747
               inst [0 or "/::cpu0"] labels {"device_type":"cpu","cgroup":"/","cpu":0}
               inst [1 or "/::cpu1"] labels {"device_type":"cpu","cgroup":"/","cpu":1}
               inst [2 or "/app::cpu0"] labels {"device_type":"cpu","cgroup":"/app","cpu":0}
               inst [3 or "/app::cpu1"] labels {"device_type":"cpu","cgroup":"/app","cpu":1}

          $ pminfo --labels 3.22
          InDom: 3.22 0xc00016
               labels {"device_type":"cpu"}

          As shown above the individual instances inherit the labels from
          the instance domain, and the PMDA also applies additional per-
          instance labels describing individual cgroup and CPU names.  When
          this model has been used by the PMDA, PMAPI clients are able to
          restrict their queries to the cgroup metric instances - in the
          example, restricting to processor "cpu0" using the "cpu" label,
          perhaps, or to just the "/app" cgroup metrics using the "cgroup"
          label.

          Furthermore, using this labeling scheme client tools can also
          correlate related instances across different instance domains.

          $ pminfo --desc --fetch --labels kernel.percpu.cpu.irq.soft
          kernel.percpu.cpu.irq.soft
               Data Type: 64-bit unsigned int  InDom: 60.0 0xf000000
               Semantics: counter  Units: millisec
               inst [0 or "cpu0"] value 6770
               inst [1 or "cpu1"] value 100
               inst [0 or "cpu0"] labels {"device_type":"cpu"}
               inst [1 or "cpu1"] labels {"device_type":"cpu"}

          $ pminfo --labels 60.0
          InDom: 60.0 0xf000000
               labels {"device_type":"cpu"}

          Although these two metrics have different instance domains (60.0
          and 3.22 respectively) and are sourced from different PMDAs, the
          "device_type" label identifies the common device to which these
          values relate.


-----------------------------------------------------

::

          The PMDA must be using PMDA_INTERFACE_2 or later, as specified in
          the call to pmdaDSO(3) or pmdaDaemon(3).  If labeling of multi-
          dimensional instance names is performed, the PMDA must use
          PMDA_INTERFACE_7 or later.

          Because of optional partial matching up to the first space in the
          instance name, the PMDA developer should ensure that if instance
          names are allowed to have spaces, the names are unique up to the
          first space.


---------------------------------------------------------------

::

          If any errors occur during the execution of pmdaInstance, the
          result structure is deallocated.  If the instance domain indom is
          not supported by the PMDA, pmdaInstance will return PM_ERR_INDOM.

          If the inst or name does not correspond to any instances in the
          indom domain, pmdaInstance will return PM_ERR_INST.


---------------------------------------------------------

::

          malloc(3), PMAPI(3), PMDA(3), pmdaCacheStore(3), pmdaLabel(3) and
          pmGetInDom(3).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                   PMDAINSTANCE(3)

--------------

Pages that refer to this page:
`pmlogrewrite(1) <../man1/pmlogrewrite.1.html>`__, 
`pmda(3) <../man3/pmda.3.html>`__, 
`pmdacache(3) <../man3/pmdacache.3.html>`__, 
`pmdadaemon(3) <../man3/pmdadaemon.3.html>`__, 
`pmdadso(3) <../man3/pmdadso.3.html>`__, 
`pmdamain(3) <../man3/pmdamain.3.html>`__

--------------

--------------

.. container:: footer

   +-----------------------+-----------------------+-----------------------+
   | HTML rendering        |                       | |Cover of TLPI|       |
   | created 2021-08-27 by |                       |                       |
   | `Michael              |                       |                       |
   | Ker                   |                       |                       |
   | risk <https://man7.or |                       |                       |
   | g/mtk/index.html>`__, |                       |                       |
   | author of `The Linux  |                       |                       |
   | Programming           |                       |                       |
   | Interface <https:     |                       |                       |
   | //man7.org/tlpi/>`__, |                       |                       |
   | maintainer of the     |                       |                       |
   | `Linux man-pages      |                       |                       |
   | project <             |                       |                       |
   | https://www.kernel.or |                       |                       |
   | g/doc/man-pages/>`__. |                       |                       |
   |                       |                       |                       |
   | For details of        |                       |                       |
   | in-depth **Linux/UNIX |                       |                       |
   | system programming    |                       |                       |
   | training courses**    |                       |                       |
   | that I teach, look    |                       |                       |
   | `here <https://ma     |                       |                       |
   | n7.org/training/>`__. |                       |                       |
   |                       |                       |                       |
   | Hosting by `jambit    |                       |                       |
   | GmbH                  |                       |                       |
   | <https://www.jambit.c |                       |                       |
   | om/index_en.html>`__. |                       |                       |
   +-----------------------+-----------------------+-----------------------+

--------------

.. container:: statcounter

   |Web Analytics Made Easy - StatCounter|

.. |Cover of TLPI| image:: https://man7.org/tlpi/cover/TLPI-front-cover-vsmall.png
   :target: https://man7.org/tlpi/
.. |Web Analytics Made Easy - StatCounter| image:: https://c.statcounter.com/7422636/0/9b6714ff/1/
   :class: statcounter
   :target: https://statcounter.com/
