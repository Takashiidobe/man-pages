.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmgetversion(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMGETVERSION(3)         Library Functions Manual         PMGETVERSION(3)

NAME
-------------------------------------------------

::

          pmGetVersion - fetch installed PCP version number


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmGetVersion(void);

          cc ... -lpcp


---------------------------------------------------------------

::

          pmGetVersion returns a binary encoding of the locally installed
          PCP version number.

          This may be used in conjunction with the related macros
          PM_VERSION(a,b,c) and PM_VERSION_CURRENT that generate PCP
          version numbers in the same format.  Refer to the example below.

          The encoding uses one byte for each of the parts of the version
          number of the installed PCP package, namely the major number, the
          minor number and the revision number.  So PCP version 3.10.5 is
          encoded as 0x30a05.

          The string format of the installed PCP package version number as
          also available from pmGetConfig with the argument PCP_VERSION.

          pmGetVersion was introduced in PCP 3.10.5.


-------------------------------------------------------

::

          The following C fragment demonstrates the use of both the
          compile-time macros and the run-time pmGetVersion function for an
          application that should not be built for PCP versions older than
          3.10.5, but after that there are two alternative implementations
          with a newer (faster, sweeter, smaller) variant of the XYZ
          service that only becoming available in PCP 4.0.0.

          #include <pcp/pmapi.h>

          #ifdef PM_VERSION_CURRENT
          #if PM_VERSION_CURRENT < PM_VERSION(3,10,5)
              /* no pmGetVersion() before PCP 3.10.5 */
              printf("PCP version 0x%x too old\n", PM_VERSION_CURRENT);
          #endif
              version = pmGetVersion();
              if (version >= PM_VERSION(4,0,0) {
               /* V2 of the XYZ service introduced in PCP 4.0.0 */
               printf("Using V2 of service XYZ\n")
               ...
              }
              else {
               printf("Using V1 of service XYZ\n")
               ...
              }
          #else
              {
               char *ver = pmGetConfig("PCP_VERSION");
               /* only option is to extract version number from returned string */
               ...
              }
          #endif


---------------------------------------------------------

::

          PMAPI(3), and pmGetConfig(3).

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

   Performance Co-Pilot               PCP                   PMGETVERSION(3)

--------------

Pages that refer to this page:
`pmgetconfig(3) <../man3/pmgetconfig.3.html>`__

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
