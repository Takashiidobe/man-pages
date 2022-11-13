.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmtime(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMTIME(1)                General Commands Manual               PMTIME(1)

NAME
-------------------------------------------------

::

          pmtime - time control server for Performance Co-Pilot


---------------------------------------------------------

::

          pmtime [-V?]  [-p port]


---------------------------------------------------------------

::

          pmtime is a graphical user interface for performance monitoring
          applications using the PCP infrastructure and requiring
          interactive time control.

          pmtime is not normally invoked directly by users.  Rather, it is
          more typical for it to be started by client applications (e.g.
          pmchart(1), pmstat(1) or pmval(1)).

          There are two modes of interacting with a pmtime process - live
          host mode, and historical archive mode.  In archive mode the
          window presents time controls suitable for manipulating the
          archive position, allowing full VCR control to move forwards and
          backwards in time at configurable rates and intervals.  In live
          mode the pmtime window contains the simpler time controls
          suitable for live monitoring.

          Note that the pmtime window is only made visible when explicitly
          requested.  Multiple client applications can be connected to a
          single pmtime server - when the final client application exits,
          pmtime will also exit.


-------------------------------------------------------

::

          The available command line options are:

          -p port, --guiport=port
               port is the port number which pmtime will use for
               communication with its clients (monitoring applications).

          -V, --version
               Display version number and exit.

          -?, --help
               Display usage message and exit.


---------------------------------------------------------------

::

          When a port number is not explicitly requested on the command
          line via the -p option, the environment variable PMTIME_PORT can
          be set to specify the port number from which available-port
          probing will commence when pmtime is searching for a port number
          to use.

          The default starting port number is 43334.


---------------------------------------------------------

::

          PCPIntro(1), pmchart(1), pmstat(1) and pmval(1).

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

   Performance Co-Pilot                                           PMTIME(1)

--------------

Pages that refer to this page:
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmchart(1) <../man1/pmchart.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`pmview(1) <../man1/pmview.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmgetoptions(3) <../man3/pmgetoptions.3.html>`__, 
`pmtime(3) <../man3/pmtime.3.html>`__, 
`pmview(5) <../man5/pmview.5.html>`__

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
