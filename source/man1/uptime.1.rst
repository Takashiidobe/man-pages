.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

Another version of this page is provided by the
`coreutils <uptime.1@@coreutils.html>`__ project

--------------

uptime(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UPTIME(1)                     User Commands                    UPTIME(1)

NAME
-------------------------------------------------

::

          uptime - Tell how long the system has been running.


---------------------------------------------------------

::

          uptime [options]


---------------------------------------------------------------

::

          uptime gives a one line display of the following information.
          The current time, how long the system has been running, how many
          users are currently logged on, and the system load averages for
          the past 1, 5, and 15 minutes.

          This is the same information contained in the header line
          displayed by w(1).

          System load averages is the average number of processes that are
          either in a runnable or uninterruptable state.  A process in a
          runnable state is either using the CPU or waiting to use the CPU.
          A process in uninterruptable state is waiting for some I/O
          access, eg waiting for disk.  The averages are taken over the
          three time intervals.  Load averages are not normalized for the
          number of CPUs in a system, so a load average of 1 means a single
          CPU system is loaded all the time while on a 4 CPU system it
          means it was idle 75% of the time.


-------------------------------------------------------

::

          -p, --pretty
                 show uptime in pretty format

          -h, --help
                 display this help text

          -s, --since
                 system up since, in yyyy-mm-dd HH:MM:SS format

          -V, --version
                 display version information and exit


---------------------------------------------------

::

          /var/run/utmp
                 information about who is currently logged on

          /proc  process information


-------------------------------------------------------

::

          uptime was written by Larry Greenfield ⟨greenfie@gauss.rutgers.
          edu⟩ and Michael K. Johnson ⟨johnsonm@sunsite.unc.edu⟩


---------------------------------------------------------

::

          ps(1), top(1), utmp(5), w(1)


---------------------------------------------------------------------

::

          Please send bug reports to ⟨procps@freelists.org⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of the procps-ng (/proc filesystem utilities)
          project.  Information about the project can be found at 
          ⟨https://gitlab.com/procps-ng/procps⟩.  If you have a bug report
          for this manual page, see
          ⟨https://gitlab.com/procps-ng/procps/blob/master/Documentation/bugs.md⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://gitlab.com/procps-ng/procps.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   procps-ng                     December 2012                    UPTIME(1)

--------------

Pages that refer to this page: `htop(1) <../man1/htop.1.html>`__, 
`pcp-uptime(1) <../man1/pcp-uptime.1.html>`__, 
`tload(1) <../man1/tload.1.html>`__,  `top(1) <../man1/top.1.html>`__, 
`w(1) <../man1/w.1.html>`__, 
`getloadavg(3) <../man3/getloadavg.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`time_namespaces(7) <../man7/time_namespaces.7.html>`__

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
