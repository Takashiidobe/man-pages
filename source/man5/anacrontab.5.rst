.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

anacrontab(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ANACRONTAB(5)                 File Formats                 ANACRONTAB(5)

NAME
-------------------------------------------------

::

          /etc/anacrontab - configuration file for Anacron


---------------------------------------------------------------

::

          The /etc/anacrontab configuration file describes the jobs
          controlled by anacron(8).  It can contain three types of lines:
          job-description lines, environment assignments, or empty lines.

          Job-description lines can have the following format:

             period in days   delay in minutes   job-identifier   command

          The period in days variable specifies the frequency of execution
          of a job in days.  This variable can be represented by an integer
          or a macro (@daily, @weekly, @monthly), where @daily denotes the
          same value as the integer 1, @weekly the same as 7, and @monthly
          specifies that the job is run once a month, independent on the
          length of the month.

          The delay in minutes variable specifies the number of minutes
          anacron waits, if necessary, before executing a job.  This
          variable is represented by an integer where 0 means no delay.

          The job-identifier variable specifies a unique name of a job
          which is used in the log files.

          The command variable specifies the command to execute.  The
          command can either be a command such as ls /proc >> /tmp/proc or
          a command to execute a custom script.

          Environment assignment lines can have the following format:

             VAR=VALUE

          Any spaces around VAR are removed.  No spaces around VALUE are
          allowed (unless you want them to be part of the value).  The
          specified assignment takes effect from the next line until the
          end of the file, or to the next assignment of the same variable.

          The START_HOURS_RANGE variable defines an interval (in hours)
          when scheduled jobs can be run.  In case this time interval is
          missed, for example, due to a power down, then scheduled jobs are
          not executed that day.

          The RANDOM_DELAY variable denotes the maximum number of minutes
          that will be added to the delay in minutes variable which is
          specified for each job.  A RANDOM_DELAY set to 12 would therefore
          add, randomly, between 0 and 12 minutes to the delay in minutes
          for each job in that particular anacrontab.  When set to 0, no
          random delay is added.

          If MAILTO is defined (and non-empty), mail is sent to the
          specified address, otherwise, system user is used.

          If MAILFROM is defined (and non-empty), it is used as the
          envelope sender address, otherwise, system user is used.

          (Note: Both MAILFROM and MAILTO variables are expanded, so
          setting them as in the following example works as expected:
          MAILFROM=cron-$USER@cron.com ($USER is replaced by the system
          user) )

          Empty lines are either blank lines, line containing white spaces
          only, or lines with white spaces followed by a '#' followed by an
          arbitrary comment.

          You can continue a line onto the next line by adding a '\' at the
          end of it.

          In case you want to disable Anacron, add a line with 0anacron
          which is the name of the script running the Anacron into the
          /etc/cron.hourly/jobs.deny file.


-------------------------------------------------------

::

          This example shows how to set up an Anacron job similar in
          functionality to /etc/crontab which starts all regular jobs
          between 6:00 and 8:00 only.  A RANDOM_DELAY which can be 30
          minutes at the most is specified.  Jobs will run serialized in a
          queue where each job is started only after the previous one is
          finished.

          # environment variables
          SHELL=/bin/sh
          PATH=/sbin:/bin:/usr/sbin:/usr/bin
          MAILTO=root
          RANDOM_DELAY=30
          # Anacron jobs will start between 6am and 8am.
          START_HOURS_RANGE=6-8
          # delay will be 5 minutes + RANDOM_DELAY for cron.daily
          1         5    cron.daily          nice run-parts /etc/cron.daily
          7         0    cron.weekly         nice run-parts /etc/cron.weekly
          @monthly  0    cron.monthly        nice run-parts /etc/cron.monthly


---------------------------------------------------------

::

          anacron(8), crontab(1)

          The Anacron README file.


-----------------------------------------------------

::

          Itai Tzur ⟨itzur@actcom.co.il⟩

          Currently maintained by Pascal Hakim ⟨pasc@(debian.org|
          redellipse.net)⟩.

          For Fedora, maintained by Marcela Mašláňová
          ⟨mmaslano@redhat.com⟩.

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

   cronie                         2012-11-22                  ANACRONTAB(5)

--------------

Pages that refer to this page:
`cronnext(1) <../man1/cronnext.1.html>`__, 
`anacron(8) <../man8/anacron.8.html>`__, 
`cron(8) <../man8/cron.8.html>`__

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
