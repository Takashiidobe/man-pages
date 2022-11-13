.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__pmlookupipc(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOOKUPIPC(3)          Library Functions Manual          PMLOOKUPIPC(3)

NAME
-------------------------------------------------

::

          __pmAddIPC, __pmLookupIPC, __pmFdLookupIPC, __pmOverrideLastFd,
          __pmPrintIPC, __pmResetIPC - IPC version infrastructure support


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmAddIPC(int fd, __pmIPC ipc);
          int __pmLookupIPC(__pmIPC **ipcp);
          int __pmFdLookupIPC(int fd, __pmIPC **ipcp);
          void __pmOverrideLastFd(int fd);
          void __pmPrintIPC(void);
          void __pmResetIPC(int fd);

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

          IPC channels throughout the distributed PCP framework are
          affected by the PCP 2.0 (and later) PDU changes.  These functions
          are the interface to the libpcp IPC connection management global
          data.  This data consists of a hash table of __pmIPC structures
          (indexed by file descriptor) and a cached, most-recently-used
          file descriptor.

          Newly created IPC channels must be registered with the hash table
          using __pmAddIPC, such that the PDU sending and decoding routines
          can determine whether they need to perform any PDU version
          translations or not, for backward compatibility with previous the
          PCP 1.x IPC protocol.

          __pmLookupIPC and __pmFdLookupIPC both provide handles to the
          __pmIPC structure associated with the given file descriptor, as
          previously established by a call to __pmAddIPC.  The difference
          between the two is that one allows an explicit file descriptor
          lookup, and the other uses the cached, most-recently-used file
          descriptor.  So __pmLookupIPC actually calls __pmFdLookupIPC
          using this cached file descriptor as the argument.  The
          justification for having both is that in some places it is not
          possible to use __pmFdLookupIPC (which is preferred), since at
          that particular level of the PMAPI a file descriptor is not
          available (see the __pmDecodeError code for an example).

          The __pmOverrideLastFd is an escape mechanism for use in those
          situations where the last PDU fetch did not go through the usual
          channels (ie. __pmGetPDU), so as to ensure that the cached file
          descriptor is the correct file descriptor for the PDU which is
          currently being processed.  This will typically be used for
          archive PDU processing or where version information is not
          available for a given file descriptor (eg. immediately prior to a
          PDU version exchange).

          __pmPrintIPC is a useful debugging routine for displaying a table
          mapping all currently registered file descriptors to their
          associated PDU version numbers.  Unused entries in this table
          should display the value zero in the version column.

          __pmResetIPC resets the version information associated with the
          given file descriptor to some known (invalid) number.  Subsequent
          lookups on this file descriptor will return an UNKNOWN_VERSION
          embedded within the __pmIPC structure.


---------------------------------------------------------------

::

          A negative return value from __pmLookupIPC indicates that the
          requested file descriptor is not registered in the hash table.
          This typically indicates closure of an IPC channel, so PM_ERR_IPC
          is returned if this is the case.


---------------------------------------------------------

::

          PMAPI(3)

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

   Performance Co-Pilot               PCP                    PMLOOKUPIPC(3)

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
