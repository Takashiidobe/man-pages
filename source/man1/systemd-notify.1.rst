.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-notify(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-NOTIFY(1)            systemd-notify            SYSTEMD-NOTIFY(1)

NAME
-------------------------------------------------

::

          systemd-notify - Notify service manager about start-up completion
          and other daemon status changes


---------------------------------------------------------

::

          systemd-notify [OPTIONS...] [VARIABLE=VALUE...]


---------------------------------------------------------------

::

          systemd-notify may be called by daemon scripts to notify the init
          system about status changes. It can be used to send arbitrary
          information, encoded in an environment-block-like list of
          strings. Most importantly, it can be used for start-up completion
          notification.

          This is mostly just a wrapper around sd_notify() and makes this
          functionality available to shell scripts. For details see
          sd_notify(3).

          The command line may carry a list of environment variables to
          send as part of the status update.

          Note that systemd will refuse reception of status updates from
          this command unless NotifyAccess= is set for the service unit
          this command is called from.

          Note that sd_notify() notifications may be attributed to units
          correctly only if either the sending process is still around at
          the time PID 1 processes the message, or if the sending process
          is explicitly runtime-tracked by the service manager. The latter
          is the case if the service manager originally forked off the
          process, i.e. on all processes that match NotifyAccess=main or
          NotifyAccess=exec. Conversely, if an auxiliary process of the
          unit sends an sd_notify() message and immediately exits, the
          service manager might not be able to properly attribute the
          message to the unit, and thus will ignore it, even if
          NotifyAccess=all is set for it. When --no-block is used, all
          synchronization for reception of notifications is disabled, and
          hence the aforementioned race may occur if the invoking process
          is not the service manager or spawned by the service manager.

          Hence, systemd-notify will first attempt to invoke sd_notify()
          pretending to have the PID of the invoking process. This will
          only succeed when invoked with sufficient privileges. On failure,
          it will then fall back to invoking it under its own PID. This
          behaviour is useful in order that when the tool is invoked from a
          shell script the shell process — and not the systemd-notify
          process — appears as sender of the message, which in turn is
          helpful if the shell process is the main process of a service,
          due to the limitations of NotifyAccess=all. Use the --pid= switch
          to tweak this behaviour.


-------------------------------------------------------

::

          The following options are understood:

          --ready
              Inform the init system about service start-up completion.
              This is equivalent to systemd-notify READY=1. For details
              about the semantics of this option see sd_notify(3).

          --pid=
              Inform the service manager about the main PID of the daemon.
              Takes a PID as argument. If the argument is specified as
              "auto" or omitted, the PID of the process that invoked
              systemd-notify is used, except if that's the service manager.
              If the argument is specified as "self", the PID of the
              systemd-notify command itself is used, and if "parent" is
              specified the calling process' PID is used — even if it is
              the service manager. This is equivalent to systemd-notify
              MAINPID=$PID. For details about the semantics of this option
              see sd_notify(3).

          --uid=USER
              Set the user ID to send the notification from. Takes a UNIX
              user name or numeric UID. When specified the notification
              message will be sent with the specified UID as sender, in
              place of the user the command was invoked as. This option
              requires sufficient privileges in order to be able manipulate
              the user identity of the process.

          --status=
              Send a free-form status string for the daemon to the init
              systemd. This option takes the status string as argument.
              This is equivalent to systemd-notify STATUS=.... For details
              about the semantics of this option see sd_notify(3).

          --booted
              Returns 0 if the system was booted up with systemd, non-zero
              otherwise. If this option is passed, no message is sent. This
              option is hence unrelated to the other options. For details
              about the semantics of this option, see sd_booted(3). An
              alternate way to check for this state is to call systemctl(1)
              with the is-system-running command. It will return "offline"
              if the system was not booted with systemd.

          --no-block
              Do not synchronously wait for the requested operation to
              finish. Use of this option is only recommended when
              systemd-notify is spawned by the service manager, or when the
              invoking process is directly spawned by the service manager
              and has enough privileges to allow systemd-notify to send the
              notification on its behalf. Sending notifications with this
              option set is prone to race conditions in all other cases.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


-------------------------------------------------------

::

          Example 1. Start-up Notification and Status Updates

          A simple shell daemon that sends start-up notifications after
          having set up its communication channel. During runtime it sends
          further status updates to the init system:

              #!/bin/bash

              mkfifo /tmp/waldo
              systemd-notify --ready --status="Waiting for data..."

              while : ; do
                      read a < /tmp/waldo
                      systemd-notify --status="Processing $a"

                      # Do something with $a ...

                      systemd-notify --status="Waiting for data..."
              done


---------------------------------------------------------

::

          systemd(1), systemctl(1), systemd.unit(5), sd_notify(3),
          sd_booted(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                            SYSTEMD-NOTIFY(1)

--------------

Pages that refer to this page: `systemd(1) <../man1/systemd.1.html>`__

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
