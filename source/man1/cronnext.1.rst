.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cronnext(1) — Linux manual page
===============================

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

   CRONNEXT(1)                   User Commands                  CRONNEXT(1)

NAME
-------------------------------------------------

::

          cronnext - time of next job cron will execute


---------------------------------------------------------

::

          cronnext [-i users] [-e users] [-s] [-a] [-t time] [-q time] [-j
                   command] [-l] [-c] [-f] [-h] [-V] [file]...


---------------------------------------------------------------

::

          Determine the time cron will execute the next job.  Without
          arguments, it prints that time considering all crontabs, in
          number of seconds since the Epoch, rounded to the minute. This
          number can be converted into other formats using date(1), like
          date --date @43243254

          The file arguments are optional. If provided, cronnext uses them
          as crontabs instead of the ones installed in the system.


-------------------------------------------------------

::

          -i user,user,user,...
                 Consider only the crontabs of the specified users.  Use
                 *system* for the system crontab.

          -e user,user,user,...
                 Do not consider the crontabs of the specified users.

          -s     Do not consider the system crontab, usually the
                 /etc/crontab file.  The system crontab usually contains
                 the hourly, daily, weekly and montly crontabs, which might
                 be better dealt with anacron(8).

          -a     Use the crontabs installed in the system in addition to
                 the ones passed as file arguments. This is implicit if no
                 file is passed.

          -t time
                 Determine the next job from this time, instead of now.
                 The time is expressed in number of seconds since the
                 Epoch, as obtained for example by date +%s --date "now + 2
                 hours", and is internally rounded to the minute.

          -q time
                 Do not check jobs over this time, expressed in the same
                 way as in option -t.

          -j command
                 Only look for jobs that contain command as a substring.

          -l     Print the whole entries of the jobs that are the next to
                 be executed by cron.  The default is to only print their
                 next time of execution.

          -c     Print every entry in every crontab with the next time it
                 is executed.

          -f     Print all jobs that are executed in the given interval.
                 Requires option -q.

          -h     Print usage output and exit.

          -V     Print version and exit.


-----------------------------------------------------

::

          Marco Migliori ⟨sgerwk@aol.com⟩


---------------------------------------------------------

::

          cron(8), cron(1), crontab(5), crontab(1), anacron(8),
          anacrontab(5), atq(1), date(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the cronie (crond daemon) project.
          Information about the project can be found at 
          ⟨https://github.com/cronie-crond/cronie⟩.  If you have a bug
          report for this manual page, see
          ⟨https://github.com/cronie-crond/cronie/issues⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/cronie-crond/cronie.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-07-13.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   cronie                         2017-06-11                    CRONNEXT(1)

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
