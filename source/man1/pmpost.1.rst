.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmpost(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| UNIX SEE ALSO <#UNIX_SEE_ALSO>`__ |                                   |
| \|                                |                                   |
| `WINDOW                           |                                   |
| S SEE ALSO <#WINDOWS_SEE_ALSO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMPOST(1)                General Commands Manual               PMPOST(1)

NAME
-------------------------------------------------

::

          pmpost - append messages to the Performance Co-Pilot notice board


---------------------------------------------------------

::

          $PCP_BINADM_DIR/pmpost message


---------------------------------------------------------------

::

          pmpost will append the text message to the end of the Performance
          Co-Pilot (PCP) notice board file ($PCP_LOG_DIR/NOTICES) in an
          atomic manner that guards against corruption of the notice board
          file by concurrent invocations of pmpost.

          The PCP notice board is intended to be a persistent store and
          clearing house for important messages relating to the operation
          of the PCP and the notification of performance alerts from
          pmie(1) when other notification options are either unavailable or
          unsuitable.

          Before being written, messages are prefixed by the current time,
          and when the current day is different to the last time the notice
          board file was written, pmpost will prepend the message with the
          full date.

          If the notice board file does not exist, pmpost will create it.
          pmpost would usually run from long-running PCP daemons executing
          under the (typically unprivileged) $PCP_USER and $PCP_GROUP
          accounts.  The file should be owned and writable by the $PCP_USER
          user, and readable by others.


---------------------------------------------------

::

          $PCP_LOG_DIR/NOTICES
               the PCP notice board file


-----------------------------------------------------------------------

::

          The file /etc/pcp.conf contains the local values for PCP_
          variables.


-------------------------------------------------------------------

::

          logger(1).


-------------------------------------------------------------------------

::

          pcp-eventlog(1).


---------------------------------------------------------

::

          pmie(1), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                         PMPOST(1)

--------------

Pages that refer to this page: `pcpintro(1) <../man1/pcpintro.1.html>`__

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
