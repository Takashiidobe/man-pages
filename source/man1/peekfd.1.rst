.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

peekfd(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PEEKFD(1)                     User Commands                    PEEKFD(1)

NAME
-------------------------------------------------

::

          peekfd - peek at file descriptors of running processes


---------------------------------------------------------

::

          peekfd [-8,--eight-bit-clean] [-n,--no-headers] [-f,--follow]
          [-d,--duplicates-removed] [-V,--version] [-h,--help] pid [fd]
          [fd] ...


---------------------------------------------------------------

::

          peekfd attaches to a running process and intercepts all reads and
          writes to file descriptors.  You can specify the desired file
          descriptor numbers or dump all of them.


-------------------------------------------------------

::

          -8     Do no post-processing on the bytes being read or written.

          -n     Do not display headers indicating the source of the bytes
                 dumped.

          -c     Also dump the requested file descriptor activity in any
                 new child processes that are created.

          -d     Remove duplicate read/writes from the output.  If you're
                 looking at a tty with echo, you might want this.

          -v     Display a version string.

          -h     Display a help message.


---------------------------------------------------

::

          /proc/*/fd
                 Not used but useful for the user to look at to get good
                 file descriptor numbers.


---------------------------------------------------------------

::

          None.


---------------------------------------------------------------

::

          The following diagnostics may be issued on stderr:

          Error attaching to pid <PID>
                 An unknown error occurred while attempted to attach to a
                 process, you may need to be root.


-------------------------------------------------

::

          Probably lots.  Don't be surprised if the process you are
          monitoring dies.


-----------------------------------------------------

::

          Trent Waddington ⟨trent.waddington@gmail.com⟩


---------------------------------------------------------

::

          ttysnoop(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the psmisc (Small utilities that use the
          /proc filesystem) project.  Information about the project can be
          found at ⟨https://gitlab.com/psmisc/psmisc⟩.  If you have a bug
          report for this manual page, see
          ⟨https://gitlab.com/psmisc/psmisc/issues⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://gitlab.com/psmisc/psmisc.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-06-21.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   psmisc                         2020-09-09                      PEEKFD(1)

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
