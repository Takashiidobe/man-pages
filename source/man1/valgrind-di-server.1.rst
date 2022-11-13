.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

valgrind-di-server(1) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VALGRIND-DI-SERVER(1)      valgrind-di-server      VALGRIND-DI-SERVER(1)

NAME
-------------------------------------------------

::

          valgrind-di-server - Experimental debuginfo server for valgrind


---------------------------------------------------------

::

          valgrind-di-server [options]


---------------------------------------------------------------

::

          valgrind-di-server accepts (multiple) connections from valgrind
          processes that use the
           --debuginfo-server option on the specified port and serves
          (compressed) debuginfo files (in chunks) from the current working
          directory.


-------------------------------------------------------

::

          -e --exit-at-zero
              When the number of connected processes falls back to zero,
              exit. Without this, it will run forever, that is, until you
              send it Control-C.

          --max-connect=INTEGER
              By default, the server can connect to up to 50 processes.
              Occasionally, that number is too small. Use this option to
              provide a different limit. E.g.  --max-connect=100.

          portnumber
              Changes the port it listens on from the default (1500). The
              specified port must be in the range 1024 to 65535. The same
              restriction applies to port numbers specified by the
              --debuginfo-server option to Valgrind itself.


---------------------------------------------------------

::

          valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or
          http://www.valgrind.org/docs/manual/index.html.


-----------------------------------------------------

::

          Julian Seward.

COLOPHON
---------------------------------------------------------

::

          This page is part of the valgrind (a system for debugging and
          profiling Linux programs) project.  Information about the project
          can be found at ⟨http://www.valgrind.org/⟩.  If you have a bug
          report for this manual page, see
          ⟨http://www.valgrind.org/support/bug_reports.html⟩.  This page
          was obtained from the project's upstream Git repository
          ⟨http://sourceware.org/git/valgrind.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-06.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Release 3.17.0                 08/27/2021          VALGRIND-DI-SERVER(1)

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
