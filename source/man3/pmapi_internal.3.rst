.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmapi_internal(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MULTI-THREADED APPLICATIONS      |                                   |
| <#MULTI-THREADED_APPLICATIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMAPI_INTERNAL(3)       Library Functions Manual       PMAPI_INTERNAL(3)

NAME
-------------------------------------------------

::

          PMAPI_INTERNAL - internal details for the Performance Metrics
          Application Programming Interface


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

           ... assorted routines ...

          cc ... -lpcp


-----------------------------------------------------

::

          This documentation is intended for internal Performance Co-Pilot
          (PCP) developer use.

          These interfaces are not part of the PCP APIs that are guaranteed
          to remain fixed across releases, and they may not work, or may
          provide different semantics at some point in the future.


---------------------------------------------------------------

::

          Refer to PMAPI(3) for general information about the external
          interfaces defined in <pcp/pmapi.h>.  The interfaces described
          here assume that context.


-----------------------------------------------------------------------------------------------

::

          The following groups of internal functions and services in libpcp
          are restricted to being called from a single-thread, and this is
          enforced by returning PM_ERR_THREAD when an attempt to call the
          routines in each group from more than one thread is detected.

          1.  The interval timer services use global state with semantics
              that demand it is only used in the context of a single
              thread, so __pmAFregister(3), __pmAFunregister(3),
              __pmAFblock(3), __pmAFunblock (3) and __pmAFisempty(3).

          2.  The following access control manipulation routines that are
              principally intended for single-threaded applications:
              __pmAccAddOp, __pmAccSaveHosts, __pmAccRestoreHosts,
              __pmAccFreeSavedHosts, __pmAccAddHost, __pmAccAddClient,
              __pmAccDelClient and __pmAccDumpHosts.

          3.  The following routines that identify pmlogger control ports
              and are principally intended for single-threaded
              applications: __pmLogFindPort and __pmLogFindLocalPorts.


---------------------------------------------------------

::

          PMAPI(3).

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

   Performance Co-Pilot               PCP                 PMAPI_INTERNAL(3)

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
