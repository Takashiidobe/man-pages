.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sa2(8) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SA2(8)                     Linux User's Manual                    SA2(8)

NAME
-------------------------------------------------

::

          sa2 - Create a report from the current standard system activity
          daily data file.


---------------------------------------------------------

::

          /usr/local/lib64/sa/sa2


---------------------------------------------------------------

::

          The sa2 command is a shell procedure variant of the sar command
          which writes a daily report in the sarDD or the sarYYYYMMDD file,
          where YYYY stands for the current year, MM for the current month
          and DD for the current day. By default the report is saved in the
          /var/log/sa directory. The sa2 command will also remove reports
          more than one week old by default.  You can however keep reports
          for a longer (or a shorter) period by setting the HISTORY
          environment variable. Read the sysstat(5) manual page for
          details.

          The sa2 command accepts most of the flags and parameters of the
          sar command.

          The sa2 command is designed to be started automatically by the
          cron command.


---------------------------------------------------------

::

          To run the sa2 command daily, place the following entry in your
          root crontab file:

          5 19 * * 1-5 /usr/local/lib64/sa/sa2 -A

          This will generate by default a daily report called sarDD in the
          /var/log/sa directory, where the DD parameter is a number
          representing the day of the month.


---------------------------------------------------

::

          /var/log/sa/sarDD
          /var/log/sa/sarYYYYMMDD
                 The standard system activity daily report files and their
                 default location.  YYYY stands for the current year, MM
                 for the current month and DD for the current day.


-----------------------------------------------------

::

          Sebastien Godard (sysstat <at> orange.fr)


---------------------------------------------------------

::

          sar(1), sadc(8), sa1(8), sadf(1), sysstat(5)

          https://github.com/sysstat/sysstat 
          http://pagesperso-orange.fr/sebastien.godard/ 

COLOPHON
---------------------------------------------------------

::

          This page is part of the sysstat (sysstat performance monitoring
          tools) project.  Information about the project can be found at 
          ⟨http://sebastien.godard.pagesperso-orange.fr/⟩.  If you have a
          bug report for this manual page, send it to sysstat-AT-orange.fr.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/sysstat/sysstat.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-07-17.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Linux                           JULY 2020                         SA2(8)

--------------

Pages that refer to this page:
`pmlogger_daily_report(1) <../man1/pmlogger_daily_report.1.html>`__, 
`sadf(1) <../man1/sadf.1.html>`__,  `sar(1) <../man1/sar.1.html>`__, 
`sysstat(5) <../man5/sysstat.5.html>`__, 
`sa1(8) <../man8/sa1.8.html>`__,  `sadc(8) <../man8/sadc.8.html>`__

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
