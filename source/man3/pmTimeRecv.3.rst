.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmtime(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMTIME(3)               Library Functions Manual               PMTIME(3)

NAME
-------------------------------------------------

::

          pmTimeConnect, pmTimeDisconnect, pmTimeRecv, pmTimeSendAck,
          pmTimeShowDialog - time control functions for synchronizing the
          archive position and update interval between one or more
          applications


-------------------------------------------------------------

::

          #include <pcp/pmtime.h>

          int pmTimeConnect(int port, pmTime *state);
          int pmTimeDisconnect(int fd);
          int pmTimeSendAck(int fd, struct timeval *fetchTime);
          int pmTimeShowDialog(int fd, int show);
          int pmTimeRecv(int fd, pmTime *state);

          cc ... -lpcp_gui


---------------------------------------------------------------

::

          These functions form part of the Performance Metrics Applications
          Programming Interface (PMAPI) and are intended to provide a
          uniform mechanism for applications to both replay archive data
          and report live data in a time synchronized manner.

          The pmTime structure has the following fields:
            typedef struct {
                unsigned int        magic;
                unsigned int        length;
                pm_tctl_command     command;
                pm_tctl_source      source;
                pm_tctl_state       state;
                pm_tctl_mode        mode;
                struct timeval      delta;
                struct timeval      position;
                struct timeval      start;     /* archive only */
                struct timeval      end;       /* archive only */
                char                data[0];   /* arbitrary length info (TZ) */
            } pmTime;

          In the simplest case, the application should call pmTimeConnect
          to connect to the time control server, pmtime(1), and then
          repeatedly call pmTimeRecv in the main loop of the application.
          On success, pmTimeConnect returns a non-negative file descriptor.
          In applications which have multiple threads of control, rather
          than simply blocking in pmTimeRecv, the file descriptor may be
          used in calls to select(2).  In graphical applications, the file
          descriptor may be used to interface with the event loop.

          The port parameter to pmTimeConnect is the port number of the
          socket on which the time control server is (or will be) listening
          for new connections.

          The state parameter to pmTimeConnect is used to initialize a new
          time control server or to pass additional information to an
          existing time control server.  The start and finish fields
          indicate the chronological bounds interesting to the application.
          The showdialog field indicates whether the time control server
          should initially show or hide the dialog.  The position, delta,
          and data fields indicate the initial archive position, update
          interval, time zone string and time zone label string.

          pmTimeRecv blocks until the time control server sends a command
          message.  It then updates the state parameter and returns one of
          the PM_TCTL command identifiers.

          The PM_TCTL_SET command indicates the application should seek to
          the archive position (see pmSetMode(3)) returned in the position
          field of the state parameter.

          The PM_TCTL_STEP command indicates the application should perform
          an update, i.e. advance (or rewind, if delta is negative) to the
          time indicated by position and then fetch new metric values,
          update the display or whatever.  In order for several application
          to remain synchronized, the time control server will wait until
          all applications have acknowledged that they have completed the
          step command.  Applications should call pmTimeSendAck when the
          step command has been processed.  Note that PM_TCTL_STEP is the
          only command that requires an explicit acknowledgement.

          The PM_TCTL_VCRMODE command is used by the time control server to
          indicate the current VCR mode.

          The value is returned in the vcrmode field of the state parameter
          passed to pmTimeRecv, and remains valid until the next
          PM_TCTL_VCRMODE command is received.

          The PM_TCTL_TZ command indicates the application should use a new
          time- zone, as indicated in the tz and tzlabel fields of the
          state parameter.

          The PM_TCTL_BOUNDS command is sent to all applications when the
          time control server changes its chronological bounds.  This may
          occur when a new application connects to the time control server
          or the user changes the bounds manually.  Most applications will
          ignore this command.

          The PM_TCTL_SHOWDIALOG command will be sent to all applications
          when the visibility of the time control server changes.  This
          allows applications to alter the text in menus or buttons to
          reflect this change.  Applications may change the visibility of
          the time control dialog using the pmTimeShowDialog function.  The
          initial visibility is determined when the time control dialog is
          first created by an application calling pmTimeConnect with the
          showdialog field in the state parameter set to the desired value.

          The pmTimeDisconnect function may be used to close the command
          socket to the time control server.  This is useful when
          applications need to change the connection mode, e.g. to divorce
          the current time control server and connect to a new one.


---------------------------------------------------------

::

          pmtime(1), PMAPI(3) and pmSetMode(3).

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

   Performance Co-Pilot             Aconex                        PMTIME(3)

--------------

Pages that refer to this page: `pcpintro(3) <../man3/pcpintro.3.html>`__

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
