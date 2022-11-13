.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

logsave(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOGSAVE(8)               System Manager's Manual              LOGSAVE(8)

NAME
-------------------------------------------------

::

          logsave - save the output of a command in a logfile


---------------------------------------------------------

::

          logsave [ -asv ] logfile cmd_prog [ ... ]


---------------------------------------------------------------

::

          The logsave program will execute cmd_prog with the specified
          argument(s), and save a copy of its output to logfile.  If the
          containing directory for logfile does not exist, logsave will
          accumulate the output in memory until it can be written out.  A
          copy of the output will also be written to standard output.

          If cmd_prog is a single hyphen ('-'), then instead of executing a
          program, logsave will take its input from standard input and save
          it in logfile

          logsave is useful for saving the output of initial boot scripts
          until the /var partition is mounted, so the output can be written
          to /var/log.


-------------------------------------------------------

::

          -a     This option will cause the output to be appended to
                 logfile, instead of replacing its current contents.

          -s     This option will cause logsave to skip writing to the log
                 file text which is bracketed with a control-A (ASCII 001
                 or Start of Header) and control-B (ASCII 002 or Start of
                 Text).  This allows progress bar information to be visible
                 to the user on the console, while not being written to the
                 log file.

          -v     This option will make logsave to be more verbose in its
                 output to the user.


-----------------------------------------------------

::

          Theodore Ts'o (tytso@mit.edu)


---------------------------------------------------------

::

          fsck(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the e2fsprogs (utilities for ext2/3/4
          filesystems) project.  Information about the project can be found
          at ⟨http://e2fsprogs.sourceforge.net/⟩.  It is not known how to
          report bugs for this man page; if you know, please send a mail to
          man-pages@man7.org.  This page was obtained from the project's
          upstream Git repository
          ⟨git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-22.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   E2fsprogs version 1.46.4       August 2021                    LOGSAVE(8)

--------------

Pages that refer to this page:
`e2fsck.conf(5) <../man5/e2fsck.conf.5.html>`__

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
