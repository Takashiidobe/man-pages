.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

QmcMetric(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C++ SYNOPSIS <#C++_SYNOPSIS>`__  |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \|                                |                                   |
| `CONSTRUCTORS <#CONSTRUCTORS>`__  |                                   |
| \| `INSTANCES <#INSTANCES>`__ \|  |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   QMCMETRIC(3)            Library Functions Manual            QMCMETRIC(3)

NAME
-------------------------------------------------

::

          QmcMetric - container for a metric and all its values


-----------------------------------------------------------------

::

          #include <pcp/pmc/Metric.h>

          CC ... -lpcp_pmc -lpcp


---------------------------------------------------------------

::

          A QmcMetric object is a container for a single metric and all its
          values.

          The QmcMetricValue structure is used to hold the instance index,
          values and errors of each instance.  In the case of a singular
          metric, a single QmcMetricValue object is used.

          A QmcMetric object consists of a list of QmcMetricValue objects,
          indexes to the descriptors in the metric's QmcGroup and
          QmcContext and flags to indicate if the instances are explicit or
          implicit, and if only active metrics are required after
          QmcMetric::updateIndom is called.


-----------------------------------------------------------------

::

          Metrics should be constructed through the QmcGroup::addMetric
          methods as this will ensure that the references to the metric's
          context, descriptor and instance domain are correctly
          initialized.


-----------------------------------------------------------

::

          For metrics with an instance domain it is possible to add and
          remove any instance, and also update the instance list to reflect
          changes in a dynamic instance domain.

          bool updateIndom();
              Update the metric to include new instances.  This method will
              first call QmcContext::update to update the instance domain.
              If the active flag is set in the QmcGroup::addMetric call,
              only instances will exported by the metric, otherwise the
              metric will export all instances listed in the domain.

              The ordering of instances may change as a result of this
              call.  Instances that already existed will keep their current
              and previous values and errors, even if they are in a
              different order.

          int addInst(QString const& name);
              Add the instance name to the metric.  If the instance does
              not exist in the instance domain, a PMAPI(3) error will be
              returned.  This method ignores the value of the active flag
              set in the QmcMetric constructor.

          void removeInst(uint_t index);
              Remove the instance at position index from the metric.


---------------------------------------------------------------

::

          Error messages are generated using pmprintf(3) but are not
          flushed. It is the responsibility of the user to call pmflush(3)
          to output any messages.

          Additional diagnostics may be activated by adding the option pmc
          to the global debugging specification, as described in
          pmSetDebug(3).


---------------------------------------------------------

::

          PMAPI(3), QMC(3), QMC_Context(3), QMC_Group(3), pmflush(3) and
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

   Performance Co-Pilot               SGI                      QMCMETRIC(3)

--------------

Pages that refer to this page: `QMC(3) <../man3/QMC.3.html>`__, 
`QmcContext(3) <../man3/QmcContext.3.html>`__, 
`QmcGroup(3) <../man3/QmcGroup.3.html>`__, 
`QmcIndom(3) <../man3/QmcIndom.3.html>`__

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
