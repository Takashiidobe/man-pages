.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

machine-info(5) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MACHINE-INFO(5)               machine-info               MACHINE-INFO(5)

NAME
-------------------------------------------------

::

          machine-info - Local machine information file


---------------------------------------------------------

::

          /etc/machine-info


---------------------------------------------------------------

::

          The /etc/machine-info file contains machine metadata.

          The basic file format of machine-info is a newline-separated list
          of environment-like shell-compatible variable assignments. It is
          possible to source the configuration from shell scripts, however,
          beyond mere variable assignments no shell features are supported,
          allowing applications to read the file without implementing a
          shell compatible execution engine.

          /etc/machine-info contains metadata about the machine that is set
          by the user or administrator. The settings configured here have
          the highest precedence. When not set, appropriate values may be
          determined automatically, based on the information about the
          hardware or other configuration files. It is thus completely fine
          for this file to not be present.

          You may use hostnamectl(1) to change the settings of this file
          from the command line.


-------------------------------------------------------

::

          The following machine metadata parameters may be set using
          /etc/machine-info:

          PRETTY_HOSTNAME=
              A pretty human-readable UTF-8 machine identifier string. This
              should contain a name like "Lennart's Laptop" which is useful
              to present to the user and does not suffer by the syntax
              limitations of internet domain names. If possible, the
              internet hostname as configured in /etc/hostname should be
              kept similar to this one. Example: if this value is
              "Lennart's Computer" an Internet hostname of
              "lennarts-computer" might be a good choice. If this parameter
              is not set, an application should fall back to the Internet
              hostname for presentation purposes.

          ICON_NAME=
              An icon identifying this machine according to the XDG Icon
              Naming Specification[1]. If this parameter is not set, an
              application should fall back to "computer" or a similar icon
              name.

          CHASSIS=
              The chassis type. Currently, the following chassis types are
              defined: "desktop", "laptop", "convertible", "server",
              "tablet", "handset", "watch", and "embedded", as well as the
              special chassis types "vm" and "container" for virtualized
              systems that lack an immediate physical chassis.

              Note that most systems allow detection of the chassis type
              automatically (based on firmware information or suchlike).
              This setting should only be used to override a misdetection
              or to manually configure the chassis type where automatic
              detection is not available.

          DEPLOYMENT=
              Describes the system deployment environment. One of the
              following is suggested: "development", "integration",
              "staging", "production".

          LOCATION=
              Describes the system location if applicable and known. Takes
              a human-friendly, free-form string. This may be as generic as
              "Berlin, Germany" or as specific as "Left Rack, 2nd Shelf".


-------------------------------------------------------

::

              PRETTY_HOSTNAME="Lennart's Tablet"
              ICON_NAME=computer-tablet
              CHASSIS=tablet
              DEPLOYMENT=production


---------------------------------------------------------

::

          systemd(1), os-release(5), hostname(5), machine-id(5),
          hostnamectl(1), systemd-hostnamed.service(8)


---------------------------------------------------

::

           1. XDG Icon Naming Specification
              http://standards.freedesktop.org/icon-naming-spec/icon-naming-spec-latest.html

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

   systemd 249                                              MACHINE-INFO(5)

--------------

Pages that refer to this page:
`hostnamectl(1) <../man1/hostnamectl.1.html>`__, 
`hostname(5) <../man5/hostname.5.html>`__, 
`machine-id(5) <../man5/machine-id.5.html>`__, 
`org.freedesktop.hostname1(5) <../man5/org.freedesktop.hostname1.5.html>`__, 
`os-release(5) <../man5/os-release.5.html>`__, 
`systemd.network(5) <../man5/systemd.network.5.html>`__, 
`systemd-hostnamed.service(8) <../man8/systemd-hostnamed.service.8.html>`__

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
