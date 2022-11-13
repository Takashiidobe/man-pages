.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-udevd.service(8) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `KERNEL COMMA                     |                                   |
| ND LINE <#KERNEL_COMMAND_LINE>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-UDEVD.SERVICE(8)  systemd-udevd.service SYSTEMD-UDEVD.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-udevd.service, systemd-udevd-control.socket, systemd-
          udevd-kernel.socket, systemd-udevd - Device event managing daemon


---------------------------------------------------------

::

          systemd-udevd.service

          systemd-udevd-control.socket

          systemd-udevd-kernel.socket

          /usr/lib/systemd/systemd-udevd [--daemon] [--debug]
                                         [--children-max=] [--exec-delay=]
                                         [--event-timeout=]
                                         [--resolve-names=early|late|never]
                                         [--version] [--help]


---------------------------------------------------------------

::

          systemd-udevd listens to kernel uevents. For every event,
          systemd-udevd executes matching instructions specified in udev
          rules. See udev(7).

          The behavior of the daemon can be configured using udev.conf(5),
          its command line options, environment variables, and on the
          kernel command line, or changed dynamically with udevadm control.


-------------------------------------------------------

::

          -d, --daemon
              Detach and run in the background.

          -D, --debug
              Print debug messages to standard error.

          -c, --children-max=
              Limit the number of events executed in parallel.

          -e, --exec-delay=
              Delay the execution of each RUN{program} parameter by the
              given number of seconds. This option might be useful when
              debugging system crashes during coldplug caused by loading
              non-working kernel modules.

          -t, --event-timeout=
              Set the number of seconds to wait for events to finish. After
              this time, the event will be terminated. The default is 180
              seconds.

          -s, --timeout-signal=
              Set the signal which systemd-udevd will send to forked off
              processes after reaching event timeout. The setting can be
              overridden at boot time with the kernel command line option
              udev.timeout_signal=. Setting to SIGABRT may be helpful in
              order to debug worker timeouts. Defaults to SIGKILL. Note
              that setting the option on the command line overrides the
              setting from the configuration file.

          -N, --resolve-names=
              Specify when systemd-udevd should resolve names of users and
              groups. When set to early (the default), names will be
              resolved when the rules are parsed. When set to late, names
              will be resolved for every event. When set to never, names
              will never be resolved and all devices will be owned by root.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


-------------------------------------------------------------------------------

::

          Parameters prefixed with "rd." will be read when systemd-udevd is
          used in an initrd, those without will be processed both in the
          initrd and on the host.

          udev.log_level=, rd.udev.log_level=
              Set the log level.

          udev.children_max=, rd.udev.children_max=
              Limit the number of events executed in parallel.

          udev.exec_delay=, rd.udev.exec_delay=
              Delay the execution of each RUN{program} parameter by the
              given number of seconds. This option might be useful when
              debugging system crashes during coldplug caused by loading
              non-working kernel modules.

          udev.event_timeout=, rd.udev.event_timeout=
              Wait for events to finish up to the given number of seconds.
              This option might be useful if events are terminated due to
              kernel drivers taking too long to initialize.

          udev.timeout_signal=, rd.udev.timeout_signal=
              Specifies a signal that systemd-udevd will send to workers on
              timeout. Note that kernel command line option overrides both
              the setting in the configuration file and the one on the
              program command line.

          udev.blockdev_read_only, rd.udev.blockdev_read_only
              If specified, mark all physical block devices read-only as
              they appear. Synthetic block devices (such as loopback block
              devices or device mapper devices) are left as they are. This
              is useful to guarantee that the contents of physical block
              devices remains unmodified during runtime, for example to
              implement fully stateless systems, for testing or for
              recovery situations where corrupted file systems shall not be
              corrupted further through accidental modification.

              A block device may be marked writable again by issuing the
              blockdev --setrw command, see blockdev(8) for details.

          net.ifnames=
              Network interfaces are renamed to give them predictable names
              when possible. It is enabled by default; specifying 0
              disables it.

          net.naming-scheme=
              Network interfaces are renamed to give them predictable names
              when possible (unless net.ifnames=0 is specified, see above).
              With this kernel command line option it is possible to pick a
              specific version of this algorithm and override the default
              chosen at compilation time. Expects one of the naming scheme
              identifiers listed in systemd.net-naming-scheme(7), or
              "latest" to select the latest scheme known (to this
              particular version of systemd-udevd.service).

              Note that selecting a specific scheme is not sufficient to
              fully stabilize interface naming: the naming is generally
              derived from driver attributes exposed by the kernel. As the
              kernel is updated, previously missing attributes
              systemd-udevd.service is checking might appear, which affects
              older name derivation algorithms, too.


---------------------------------------------------------

::

          udev.conf(5), udev(7), udevadm(8)

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

   systemd 249                                     SYSTEMD-UDEVD.SERVICE(8)

--------------

Pages that refer to this page: `sd-hwdb(3) <../man3/sd-hwdb.3.html>`__, 
`sd_hwdb_get(3) <../man3/sd_hwdb_get.3.html>`__, 
`sd_hwdb_new(3) <../man3/sd_hwdb_new.3.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`systemd.link(5) <../man5/systemd.link.5.html>`__, 
`udev.conf(5) <../man5/udev.conf.5.html>`__, 
`file-hierarchy(7) <../man7/file-hierarchy.7.html>`__, 
`kernel-command-line(7) <../man7/kernel-command-line.7.html>`__, 
`systemd.net-naming-scheme(7) <../man7/systemd.net-naming-scheme.7.html>`__, 
`udev(7) <../man7/udev.7.html>`__, 
`systemd-network-generator.service(8) <../man8/systemd-network-generator.service.8.html>`__, 
`systemd-vconsole-setup.service(8) <../man8/systemd-vconsole-setup.service.8.html>`__, 
`udevadm(8) <../man8/udevadm.8.html>`__

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
