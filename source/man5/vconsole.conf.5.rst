.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

vconsole.conf(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `KERNEL COMMA                     |                                   |
| ND LINE <#KERNEL_COMMAND_LINE>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VCONSOLE.CONF(5)              vconsole.conf             VCONSOLE.CONF(5)

NAME
-------------------------------------------------

::

          vconsole.conf - Configuration file for the virtual console


---------------------------------------------------------

::

          /etc/vconsole.conf


---------------------------------------------------------------

::

          The /etc/vconsole.conf file configures the virtual console, i.e.
          keyboard mapping and console font. It is applied at boot by udev
          using 90-vconsole.rules file. You can safely mask this file if
          you want to avoid this kind of initialization.

          The basic file format of the vconsole.conf is a newline-separated
          list of environment-like shell-compatible variable assignments.
          It is possible to source the configuration from shell scripts,
          however, beyond mere variable assignments no shell features are
          supported, allowing applications to read the file without
          implementing a shell compatible execution engine.

          Note that the kernel command line options vconsole.keymap=,
          vconsole.keymap_toggle=, vconsole.font=, vconsole.font_map=,
          vconsole.font_unimap= may be used to override the console
          settings at boot.

          Depending on the operating system other configuration files might
          be checked for configuration of the virtual console as well,
          however only as fallback.

          /etc/vconsole.conf is usually created and updated using
          systemd-localed.service(8).  localectl(1) may be used to instruct
          systemd-localed.service to query or update configuration.


-------------------------------------------------------

::

          The following options are understood:

          KEYMAP=, KEYMAP_TOGGLE=
              Configures the key mapping table for the keyboard.  KEYMAP=
              defaults to "us" if not set. The KEYMAP_TOGGLE= can be used
              to configure a second toggle keymap and is by default unset.

          FONT=, FONT_MAP=, FONT_UNIMAP=
              Configures the console font, the console map and the unicode
              font map.


-------------------------------------------------------------------------------

::

          A few configuration parameters from vconsole.conf may be
          overridden on the kernel command line:

          vconsole.keymap=, vconsole.keymap_toggle=
              Overrides KEYMAP= and KEYMAP_TOGGLE=.

          vconsole.font=, vconsole.font_map=, vconsole.font_unimap=
              Overrides FONT=, FONT_MAP=, and FONT_UNIMAP=.


-------------------------------------------------------

::

          Example 1. German keyboard and console

          /etc/vconsole.conf:

              KEYMAP=de-latin1
              FONT=eurlatgr


---------------------------------------------------------

::

          systemd(1), systemd-vconsole-setup.service(8), loadkeys(1),
          setfont(8), locale.conf(5), systemd-localed.service(8)

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

   systemd 249                                             VCONSOLE.CONF(5)

--------------

Pages that refer to this page:
`localectl(1) <../man1/localectl.1.html>`__, 
`systemd-firstboot(1) <../man1/systemd-firstboot.1.html>`__, 
`kernel-command-line(7) <../man7/kernel-command-line.7.html>`__, 
`systemd-localed.service(8) <../man8/systemd-localed.service.8.html>`__, 
`systemd-vconsole-setup.service(8) <../man8/systemd-vconsole-setup.service.8.html>`__

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
