.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-networkd-wait-online.service(8) — Linux manual page
===========================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-NETWORKD-WAIT-ONLINE.SERVICE(8)-online.service-ONLINE.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-networkd-wait-online.service, systemd-networkd-wait-
          online - Wait for network to come online


---------------------------------------------------------

::

          systemd-networkd-wait-online.service

          /usr/lib/systemd/systemd-networkd-wait-online


---------------------------------------------------------------

::

          systemd-networkd-wait-online is a oneshot system service (see
          systemd.service(5)), that waits for the network to be configured.
          By default, it will wait for all links it is aware of and which
          are managed by systemd-networkd.service(8) to be fully configured
          or failed, and for at least one link to be online. Here, online
          means that the link's operational state is equal or higher than
          "degraded". The threshold can be configured by
          --operational-state= option.


-------------------------------------------------------

::

          The following options are understood:

          -i INTERFACE[:MIN_OPERSTATE[:MAX_OPERSTATE]],
          --interface=INTERFACE[:MIN_OPERSTATE[:MAX_OPERSTATE]]
              Network interface to wait for before deciding if the system
              is online. This is useful when a system has several
              interfaces which will be configured, but a particular one is
              necessary to access some network resources. When used, all
              other interfaces are ignored. This option may be used more
              than once to wait for multiple network interfaces. When this
              option is specified multiple times, then
              systemd-networkd-wait-online waits for all specified
              interfaces to be online. Optionally, required minimum and
              maximum operational states can be specified after a colon
              ":". Please see networkctl(1) for possible operational
              states. If the operational state is not specified here, then
              the value from RequiredForOnline= in the corresponding
              .network file is used if present, and "degraded" otherwise.

          --ignore=INTERFACE
              Network interfaces to be ignored when deciding if the system
              is online. By default, only the loopback interface is
              ignored. This option may be used more than once to ignore
              multiple network interfaces.

          -o MIN_OPERSTATE[:MAX_OPERSTATE],
          --operational-state=MIN_OPERSTATE[:MAX_OPERSTATE]
              Takes a minimum operational state and an optional maximum
              operational state. Please see networkctl(1) for possible
              operational states. If set, the specified value overrides
              RequiredForOnline= settings in .network files. But this does
              not override operational states specified in --interface=
              option.

          -4, --ipv4
              Waiting for an IPv4 address of each network interface to be
              configured. If this option is specified with --any, then
              systemd-networkd-wait-online exits with success when at least
              one interface becomes online and has an IPv4 address. The
              option is applied only for the operational state "degraded"
              or above. If neither --ipv4 nor --ipv6 is specified, then the
              value from RequiredFamilyForOnline= in the corresponding
              .network file is used if present.

          -6, --ipv6
              Waiting for an IPv6 address of each network interface to be
              configured. If this option is specified with --any, then
              systemd-networkd-wait-online exits with success when at least
              one interface becomes online and has an IPv6 address. The
              option is applied only for the operational state "degraded"
              or above. If neither --ipv4 nor --ipv6 is specified, then the
              value from RequiredFamilyForOnline= in the corresponding
              .network file is used if present.

          --any
              Even if several interfaces are in configuring state,
              systemd-networkd-wait-online exits with success when at least
              one interface becomes online. When this option is specified
              with --interface=, then systemd-networkd-wait-online waits
              for one of the specified interfaces to be online. This option
              is useful when some interfaces may not have carrier on boot.

          --timeout=SECS
              Fail the service if the network is not online by the time the
              timeout elapses. A timeout of 0 disables the timeout.
              Defaults to 120 seconds.

          -q, --quiet
              Suppress log messages.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------

::

          systemd(1), systemd.service(5), systemd-networkd.service(8),
          networkctl(1)

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

   systemd 249                      SYSTEMD-NETWORKD-WAIT-ONLINE.SERVICE(8)

--------------

Pages that refer to this page:
`systemd-networkd.service(8) <../man8/systemd-networkd.service.8.html>`__

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
