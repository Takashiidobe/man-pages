.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-logind.service(8) — Linux manual page
=============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-LOGIND.SERVICE(8)systemd-logind.serviceSYSTEMD-LOGIND.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-logind.service, systemd-logind - Login manager


---------------------------------------------------------

::

          systemd-logind.service

          /usr/lib/systemd/systemd-logind


---------------------------------------------------------------

::

          systemd-logind is a system service that manages user logins. It
          is responsible for:

          •   Keeping track of users and sessions, their processes and
              their idle state. This is implemented by allocating a systemd
              slice unit for each user below user.slice, and a scope unit
              below it for each concurrent session of a user. Also, a
              per-user service manager is started as system service
              instance of user@.service for each logged in user.

          •   Generating and managing session IDs. If auditing is available
              and an audit session ID is already set for a session, then
              this ID is reused as the session ID. Otherwise, an
              independent session counter is used.

          •   Providing polkit[1]-based access for users for operations
              such as system shutdown or sleep

          •   Implementing a shutdown/sleep inhibition logic for
              applications

          •   Handling of power/sleep hardware keys

          •   Multi-seat management

          •   Session switch management

          •   Device access management for users

          •   Automatic spawning of text logins (gettys) on virtual console
              activation and user runtime directory management

          User sessions are registered with logind via the pam_systemd(8)
          PAM module.

          See logind.conf(5) for information about the configuration of
          this service.

          See sd-login(3) for information about the basic concepts of
          logind such as users, sessions and seats.

          See org.freedesktop.login1(5) and org.freedesktop.LogControl1(5)
          for information about the D-Bus APIs systemd-logind provides.

          For more information on the inhibition logic see the Inhibitor
          Lock Developer Documentation[2].

          If you are interested in writing a display manager that makes use
          of logind, please have look at Writing Display Managers[3]. If
          you are interested in writing a desktop environment that makes
          use of logind, please have look at Writing Desktop
          Environments[4].


---------------------------------------------------------

::

          systemd(1), systemd-user-sessions.service(8), loginctl(1),
          logind.conf(5), pam_systemd(8), sd-login(3)


---------------------------------------------------

::

           1. polkit
              http://www.freedesktop.org/wiki/Software/polkit

           2. Inhibitor Lock Developer Documentation
              https://www.freedesktop.org/wiki/Software/systemd/inhibit

           3. Writing Display Managers
              https://www.freedesktop.org/wiki/Software/systemd/writing-display-managers

           4. Writing Desktop Environments
              http://www.freedesktop.org/wiki/Software/systemd/writing-desktop-environments

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

   systemd 249                                    SYSTEMD-LOGIND.SERVICE(8)

--------------

Pages that refer to this page:
`loginctl(1) <../man1/loginctl.1.html>`__, 
`sd_bus_creds_get_pid(3) <../man3/sd_bus_creds_get_pid.3.html>`__, 
`sd-login(3) <../man3/sd-login.3.html>`__, 
`logind.conf(5) <../man5/logind.conf.5.html>`__, 
`org.freedesktop.login1(5) <../man5/org.freedesktop.login1.5.html>`__, 
`systemd.slice(5) <../man5/systemd.slice.5.html>`__, 
`user@.service(5) <../man5/user@.service.5.html>`__, 
`systemd.special(7) <../man7/systemd.special.7.html>`__, 
`pam_systemd(8) <../man8/pam_systemd.8.html>`__, 
`systemd-machined.service(8) <../man8/systemd-machined.service.8.html>`__, 
`systemd-user-sessions.service(8) <../man8/systemd-user-sessions.service.8.html>`__

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
