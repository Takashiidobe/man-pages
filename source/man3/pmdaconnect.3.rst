.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdaconnect(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDACONNECT(3)          Library Functions Manual          PMDACONNECT(3)

NAME
-------------------------------------------------

::

          pmdaConnect - establish a connection between a daemon PMDA and
          PMCD


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          void pmdaConnect(pmdaInterface *dispatch);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          pmdaConnect initializes an IPC channel between a PMDA(3) and the
          pmcd(1) process on the local host.  The type of the connection is
          dependent on the e_io field of the pmdaExt structure:

          pmdaPipe
                 Use stdin/stdout to communicate; assumes this is a pipe
                 created by pmcd before the PMDA(3) was launched.

          pmdaInet
                 Assume pmcd(1) will establish a connection to an IPv4
                 internet domain socket set up by the PMDA(3).  The name or
                 number of the port must be specified in the e_sockname or
                 e_port fields of the pmdaExt structure, respectively.

          pmdaIPv6
                 Assume pmcd(1) will establish a connection to an IPv6
                 internet domain socket set up by the PMDA(3).  The name or
                 number of the port must be specified in the e_sockname or
                 e_port fields of the pmdaExt structure, respectively.

          pmdaUnix
                 Assume pmcd(1) will establish a connection to a unix
                 domain socket set up by the PMDA(3).  The port number must
                 be specified in the e_port field of the pmdaExt structure.

          pmdaUnknown
                 The initial value of e_io which defaults to using
                 stdin/stdout.

          The relevant pmdaExt fields are initialized by pmdaDaemon(3) and
          set by pmdaGetOpt(3) or pmdaGetOptions(3) so most PMDAs should
          not need to access or modify them.

          Traditionally most PMDAs have called pmdaConnect after calls to
          pmdaDaemon(3), pmdaGetOptions(3) (or pmdaGetOpt(3)) and
          pmdaInit(3).  If the PMDA requires significant processing at
          startup to identify the available metrics and/or instance domains
          before pmdaInit(3) can be called, then it risks timing out during
          the handshake protocol that starts as soon as pmcd(1) launches
          the PMDA and does not conclude until pmdaConnect is called.  In
          this case, it is advisable to move the pmdaConnect call, so that
          it comes after the call to pmdaGetOptions(3) (or pmdaGetOpt(3))
          and before the call to pmdaInit(3).


-----------------------------------------------------

::

          The PMDA must be using PMDA_INTERFACE_2 or later, as specified in
          the call to pmdaDaemon(3).


---------------------------------------------------------------

::

          pmdaConnect will log the type of connection made to pmcd(1) if
          the PMAPI(3) debugging option libpmda has been set in the global
          debugging specification, as described in pmSetDebug(3).

          If an error occurs that is unrecoverable, dispatch->status is set
          to a value less than 0, otherwise it is zero or positive.


---------------------------------------------------------

::

          pmcd(1), pipe(2), socket(2), PMAPI(3), PMDA(3), pmdaDaemon(3),
          pmdaGetOpt(3), pmdaGetOptions(3) and pmdaInit(3).

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

   Performance Co-Pilot               PCP                    PMDACONNECT(3)

--------------

Pages that refer to this page: `pmda(3) <../man3/pmda.3.html>`__

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
