.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

locale.conf(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOCALE.CONF(5)                 locale.conf                LOCALE.CONF(5)

NAME
-------------------------------------------------

::

          locale.conf - Configuration file for locale settings


---------------------------------------------------------

::

          /etc/locale.conf


---------------------------------------------------------------

::

          The /etc/locale.conf file configures system-wide locale settings.
          It is read at early boot by systemd(1).

          The basic file format of locale.conf is a newline-separated list
          of environment-like shell-compatible variable assignments. It is
          possible to source the configuration from shell scripts, however,
          beyond mere variable assignments, no shell features are
          supported, allowing applications to read the file without
          implementing a shell compatible execution engine.

          Note that the kernel command line options locale.LANG=,
          locale.LANGUAGE=, locale.LC_CTYPE=, locale.LC_NUMERIC=,
          locale.LC_TIME=, locale.LC_COLLATE=, locale.LC_MONETARY=,
          locale.LC_MESSAGES=, locale.LC_PAPER=, locale.LC_NAME=,
          locale.LC_ADDRESS=, locale.LC_TELEPHONE=, locale.LC_MEASUREMENT=,
          locale.LC_IDENTIFICATION= may be used to override the locale
          settings at boot.

          The locale settings configured in /etc/locale.conf are
          system-wide and are inherited by every service or user, unless
          overridden or unset by individual programs or individual users.

          Depending on the operating system, other configuration files
          might be checked for locale configuration as well, however only
          as fallback.

          /etc/locale.conf is usually created and updated using
          systemd-localed.service(8).  localectl(1) may be used to alter
          the settings in this file during runtime from the command line.
          Use systemd-firstboot(1) to initialize them on mounted (but not
          booted) system images.


-------------------------------------------------------

::

          The following locale settings may be set using /etc/locale.conf:
          LANG=, LANGUAGE=, LC_CTYPE=, LC_NUMERIC=, LC_TIME=, LC_COLLATE=,
          LC_MONETARY=, LC_MESSAGES=, LC_PAPER=, LC_NAME=, LC_ADDRESS=,
          LC_TELEPHONE=, LC_MEASUREMENT=, LC_IDENTIFICATION=. Note that
          LC_ALL may not be configured in this file. For details about the
          meaning and semantics of these settings, refer to locale(7).


-------------------------------------------------------

::

          Example 1. German locale with English messages

          /etc/locale.conf:

              LANG=de_DE.UTF-8
              LC_MESSAGES=en_US.UTF-8


---------------------------------------------------------

::

          systemd(1), locale(7), localectl(1), systemd-localed.service(8),
          systemd-firstboot(1)

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

   systemd 249                                               LOCALE.CONF(5)

--------------

Pages that refer to this page:
`localectl(1) <../man1/localectl.1.html>`__, 
`systemd(1) <../man1/systemd.1.html>`__, 
`systemd-firstboot(1) <../man1/systemd-firstboot.1.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`vconsole.conf(5) <../man5/vconsole.conf.5.html>`__, 
`systemd-localed.service(8) <../man8/systemd-localed.service.8.html>`__

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
