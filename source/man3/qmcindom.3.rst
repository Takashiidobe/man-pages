.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

QmcIndom(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C++ SYNOPSIS <#C++_SYNOPSIS>`__  |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \|                                |                                   |
| `CONSTRUCTORS <#CONSTRUCTORS>`__  |                                   |
| \|                                |                                   |
| `DY                               |                                   |
| NAMIC INDOMS <#DYNAMIC_INDOMS>`__ |                                   |
| \| `PROFILES <#PROFILES>`__ \|    |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   QMCINDOM(3)             Library Functions Manual             QMCINDOM(3)

NAME
-------------------------------------------------

::

          QmcIndom - container for a instance domain description


-----------------------------------------------------------------

::

          #include <QmcIndom.h>

          CC ... -lqmc -lpcp


---------------------------------------------------------------

::

          A QmcIndom object represents a PMAPI(3) instance domain.  This
          includes a description of all the instances in the instance
          domain.

          A QmcInstance is a structure used to describe each instance in
          the instance domain.  This includes:

             - internal identifier. If this is less than zero, the instance
             is treated as a NULL entry in the instance table.

             - external name

             - reference count, ie. the number of QmcMetric objects
             referring to this instance.

             - the likely position of the instance in the pmResult from a
             pmFetch(3).  This is also used to indicate the position of the
             next NULL instance in the instance table, if this entry is
             also NULL.

             - a flag indicating if the instance was in the last
             pmGetInDom(3).

          The QmcIndom object has a list of QmcInstance structures, and
          various flags and counters to support dynamic instance domains
          where instances may come and go with each fetch and efficient
          profile generation.


-----------------------------------------------------------------

::

          QmcIndom::QmcIndom(int type, QmcDesc &desc);
              Calls pmGetInDom(3) and pmGetInDomArchive(3) for host and
              archive contexts to obtain the entire instance list for the
              instance domain of type and identified in desc.


---------------------------------------------------------------------

::

          The support of dynamic instance domains for live contexts is
          complex since many metrics may be referencing any of the
          instances in the domain.  Therefore the instance list may be
          sparse as the position of instances in the list must be
          maintained.

          When the instance domain is updated, instances may be removed
          from the list if they are not in the new instance list (as
          returned by pmGetInDom(3)) and is not referenced by any metrics.
          Each instance in the new list is then compared with the old list
          to determine which instances are still active, and any new
          instances need to be added.  An instance is considered the same
          if both the internal and external identifiers are the same.  New
          instances are first inserted into positions of deleted instances
          before being appended to the list.

          This algorithm is expensive (potentially O(N^2)).

          bool changed() const;
              Returns true if the instance domain may have changed in the
              last fetch.

          void newFetch();
              Reset the flags that may have indicated that the instance
              domain had changed.  This is called by QmcContext::fetch.

          void hasChanged();
              Set the flags to indicate that the instance domain may have
              changed.  This is called by QmcMetric::extractValues.

          int update();
              Update the instance domain as described above. On subsequent
              calls, before the next fetch, this method will remove any
              instances that are no longer referenced without updating the
              instance list with a pmGetInDom(3) call.

          uint_t numInsts() const;
              Returns the number of instances that are not NULL.

          uint_t numActiveInsts() const;
              Returns the number of instances that are active according to
              the last QmcIndom::update call.

          uint_t listLen() const;
              Returns the length of the instance list, including NULL
              instances.


---------------------------------------------------------

::

          The algorithm for determining the most compact profile uses the
          number of instances (_instances.length()), the number of
          referenced instances (_count), the number of active instances
          (_numActive) and the number of referenced active instances
          (_numActiveRef).

                  if (all active instances are referenced
                      or there are no active instances)

                          request all instances implicitly

                  else if (the number of referenced instances
                           is less than the number of active
                           instances that are not referenced)

                          delete all instances from profile
                          add all referenced instances

                  else

                          add all instances to profile
                          delete all instances that are not referenced

          bool diffProfile() const;
              Returns true if the profile has potentially changed since the
              last call to QmcIndom::genProfile.

          int genProfile();
              Generates a new profile for the instance domain. a PMAPI(3)
              error code is returned if the profile failed.


---------------------------------------------------------------

::

          Error messages are generated using pmprintf(3) but are not
          flushed. It is the responsibility of the user to call pmflush(3)
          to output any messages.

          Additional diagnostics may be activated by adding the options pmc
          and/or indom to the global debugging specification, as described
          in pmSetDebug(3).


-------------------------------------------------

::

          Users have no control over the algorithm used to generate the
          profile. In the case of proc metrics, an implicit profile could
          be generated if all process instances are required, even though
          this will result in no values being returned in the fetch.


---------------------------------------------------------

::

          PMAPI(3), QMC(3), QmcContext(3), QmcDesc(3), QmcMetric(3),
          pmFetch(3), pmflush(3), pmGetInDom(3), pmGetInDomArchive(3) and
          pmprintf(3).

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

   Performance Co-Pilot               SGI                       QMCINDOM(3)

--------------

Pages that refer to this page: `QMC(3) <../man3/QMC.3.html>`__, 
`QmcContext(3) <../man3/QmcContext.3.html>`__

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
