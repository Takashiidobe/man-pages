.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

udev.conf(5) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UDEV.CONF(5)                    udev.conf                   UDEV.CONF(5)

NAME
-------------------------------------------------

::

          udev.conf - Configuration for device event managing daemon


---------------------------------------------------------

::

          /etc/udev/udev.conf


---------------------------------------------------------------

::

          systemd-udevd(8) expects its main configuration file at
          /etc/udev/udev.conf. It consists of a set of variables allowing
          the user to override default udev values. All empty lines or
          lines beginning with '#' are ignored. The following variables can
          be set:

          udev_log=
              The log level. Valid values are the numerical syslog
              priorities or their textual representations: err, info and
              debug.

          children_max=
              An integer. The maximum number of events executed in
              parallel.

              This is the same as the --children-max= option.

          exec_delay=
              An integer. Delay the execution of each RUN{program}
              parameter by the given number of seconds. This option might
              be useful when debugging system crashes during coldplug
              caused by loading non-working kernel modules.

              This is the same as the --exec-delay= option.

          event_timeout=
              An integer. The number of seconds to wait for events to
              finish. After this time, the event will be terminated. The
              default is 180 seconds.

              This is the same as the --event-timeout= option.

          resolve_names=
              Specifies when systemd-udevd should resolve names of users
              and groups. When set to early (the default), names will be
              resolved when the rules are parsed. When set to late, names
              will be resolved for every event. When set to never, names
              will never be resolved and all devices will be owned by root.

              This is the same as the --resolve-names= option.

          timeout_signal=
              Specifies a signal that systemd-udevd will send on worker
              timeouts. Note that both workers and spawned processes will
              be killed using this signal. Defaults to SIGKILL.

          In addition, systemd-udevd can be configured by command line
          options and the kernel command line (see systemd-udevd(8)).


---------------------------------------------------------

::

          systemd-udevd(8), udev(7), udevadm(8)

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

   systemd 249                                                 UDEV.CONF(5)

--------------

Pages that refer to this page:
`systemd-udevd.service(8) <../man8/systemd-udevd.service.8.html>`__

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
