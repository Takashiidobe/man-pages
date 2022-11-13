.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-suspend.service(8) — Linux manual page
==============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-SUSPEND.SERVICE(8)ystemd-suspend.serviceSTEMD-SUSPEND.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-suspend.service, systemd-hibernate.service, systemd-
          hybrid-sleep.service, systemd-suspend-then-hibernate.service,
          systemd-sleep - System sleep state logic


---------------------------------------------------------

::

          systemd-suspend.service

          systemd-hibernate.service

          systemd-hybrid-sleep.service

          systemd-suspend-then-hibernate.service

          /usr/lib/systemd/system-sleep


---------------------------------------------------------------

::

          systemd-suspend.service is a system service that is pulled in by
          suspend.target and is responsible for the actual system suspend.
          Similarly, systemd-hibernate.service is pulled in by
          hibernate.target to execute the actual hibernation. Finally,
          systemd-hybrid-sleep.service is pulled in by hybrid-sleep.target
          to execute hybrid hibernation with system suspend and pulled in
          by suspend-then-hibernate.target to execute system suspend with a
          timeout that will activate hibernate later.

          Immediately before entering system suspend and/or hibernation
          systemd-suspend.service (and the other mentioned units,
          respectively) will run all executables in
          /usr/lib/systemd/system-sleep/ and pass two arguments to them.
          The first argument will be "pre", the second either "suspend",
          "hibernate", "hybrid-sleep", or "suspend-then-hibernate"
          depending on the chosen action. An environment variable called
          "SYSTEMD_SLEEP_ACTION" will be set and contain the sleep action
          that is processing. This is primarily helpful for
          "suspend-then-hibernate" where the value of the variable will be
          "suspend", "hibernate", or "suspend-after-failed-hibernate" in
          cases where hibernation has failed. Immediately after leaving
          system suspend and/or hibernation the same executables are run,
          but the first argument is now "post". All executables in this
          directory are executed in parallel, and execution of the action
          is not continued until all executables have finished.

          Note that scripts or binaries dropped in
          /usr/lib/systemd/system-sleep/ are intended for local use only
          and should be considered hacks. If applications want to react to
          system suspend/hibernation and resume, they should rather use the
          Inhibitor interface[1].

          Note that systemd-suspend.service, systemd-hibernate.service,
          systemd-hybrid-sleep.service, and
          systemd-suspend-then-hibernate.service should never be executed
          directly. Instead, trigger system sleep with a command such as
          systemctl suspend or systemctl hibernate.

          Internally, this service will echo a string like "mem" into
          /sys/power/state, to trigger the actual system suspend. What
          exactly is written where can be configured in the [Sleep] section
          of /etc/systemd/sleep.conf or a sleep.conf.d file. See
          systemd-sleep.conf(5).


-------------------------------------------------------

::

          systemd-sleep understands the following commands:

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.

          suspend, hibernate, suspend-then-hibernate, hybrid-sleep
              Suspend, hibernate, suspend then hibernate, or put the system
              to hybrid sleep.


---------------------------------------------------------

::

          systemd-sleep.conf(5), systemd(1), systemctl(1),
          systemd.special(7), systemd-halt.service(8)


---------------------------------------------------

::

           1. Inhibitor interface
              https://www.freedesktop.org/wiki/Software/systemd/inhibit

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

   systemd 249                                   SYSTEMD-SUSPEND.SERVICE(8)

--------------

Pages that refer to this page:
`systemd-sleep.conf(5) <../man5/systemd-sleep.conf.5.html>`__, 
`systemd-halt.service(8) <../man8/systemd-halt.service.8.html>`__

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
