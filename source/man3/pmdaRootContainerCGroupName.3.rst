.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdarootconnect(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONTAINERS <#CONTAINERS>`__ \|   |                                   |
| `PROCESSES <#PROCESSES>`__ \|     |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAROOTCONNECT(3)      Library Functions Manual      PMDAROOTCONNECT(3)

NAME
-------------------------------------------------

::

          pmdaRootConnect, pmdaRootShutdown, pmdaRootContainerHostName,
          pmdaRootContainerProcessID, pmdaRootContainerCGroupName,
          pmdaRootProcessStart, pmdaRootProcessWait,
          pmdaRootProcessTerminate - privileged PCP collector services


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaRootConnect(void);
          void pmdaRootShutdown(int fd);
          int pmdaRootContainerHostName(int fd, char *name, int namelen,
                  char *buffer, int buflen);
          int pmdaRootContainerProcessID(int fd, char *name, int namelen);
          int pmdaRootContainerCGroupName(int fd, char *name, int namelen,
                  char *buffer, int buflen);
          int pmdaRootProcessStart(int fd, int ipctype, char *label, int
                  labellen, const char *args, int argslen, int *pid, int
                  *infd, int *outfd);
          int pmdaRootProcessWait(int fd, int pid, int *status);
          int pmdaRootProcessTerminate(int fd, int pid);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          pmdaRootConnect initializes an IPC channel between a PCP
          collector process - either a PMDA(3) or pmcd(1) itself - and the
          pmdaroot(1) server.

          On success, the return value from pmdaRootConnect is a unix(7)
          domain socket file descriptor, which can be subsequently passed
          to each of the other APIs described here.  This channel can be
          used to perform limited privilege escalation for specific
          scenarios needed by PCP collector services.  The channel can be
          deactivated using the pmdaRootShutdown interface.


-------------------------------------------------------------

::

          Several interfaces are provided for access to the container
          facilities of modern Linux distributions, as needed by various
          agents accessing kernel features related to containers.

          pmdaRootContainerHostName allows lookup of the current hostname
          for a named container on behalf of an unprivileged process, via
          the setns(3) system call on Linux.  On success, the hostname is
          returned in the supplied buffer, of size buflen and the return
          value indicates the length of the hostname.

          pmdaRootContainerProcessID performs a name to process identifier
          translation - on success, the return value is the identifier of
          the first process started (process 1) in the named container.

          pmdaRootContainerCGroupName fills the supplied buffer with the
          engine-specific names of kernel control groups that have been
          used to build the container identified by name.  When successful,
          the return value indicates the length of the cgroup name resolved
          for the container.

          The name of the container is interpreted by pmdaroot(1), which
          attempts to match up the specified name with one of the
          implementations of containers that it is aware of.  Hence, the
          name argument is potentially interpreted differently, depending
          on the installed container engine, as determined internally by
          pmdaroot).

          In the case of the Docker container engine, for example, a valid
          container name can be the unique hash identifier, the human-
          readable name, or any unique identifier substring. This is the
          algorithm used by the Docker client tools themselves.


-----------------------------------------------------------

::

          A second set of interfaces are provided allowing the collector
          system to start privileged child processes.  In particular, these
          are used by pmcd(1) so that it can start privileged PMDAs even
          when it is running under an unprivileged account itself.

          These interfaces allow processes to be started
          (pmdaRootProcessStart), reaped upon completion
          (pmdaRootProcessWait), and forcibly terminated through use of
          signals (pmdaRootProcessTerminate).  At this stage, they are
          intended only for use by pmcd itself and as such are described
          here only for completeness.


---------------------------------------------------------------

::

          All pmdaRoot interfaces will return negative status codes
          suitable for passing to pmErrStr_r(3).


---------------------------------------------------------

::

          pmcd(1), pmdaroot(1), pmErrStr_r(3), PMDA(3), setns(3) and
          unix(7).

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

   Performance Co-Pilot               PCP                PMDAROOTCONNECT(3)

--------------

Pages that refer to this page: `pmdaroot(1) <../man1/pmdaroot.1.html>`__

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
