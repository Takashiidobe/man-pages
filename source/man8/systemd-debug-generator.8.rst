.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-debug-generator(8) — Linux manual page
==============================================

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

   SYSTEMD-DEBUG-GENERATOR(8)ystemd-debug-generatorSTEMD-DEBUG-GENERATOR(8)

NAME
-------------------------------------------------

::

          systemd-debug-generator - Generator for enabling a runtime debug
          shell and masking specific units at boot


---------------------------------------------------------

::

          /usr/lib/systemd/system-generators/systemd-debug-generator


---------------------------------------------------------------

::

          systemd-debug-generator is a generator that reads the kernel
          command line and understands three options:

          If the systemd.mask= or rd.systemd.mask= option is specified and
          followed by a unit name, this unit is masked for the runtime,
          similar to the effect of systemctl(1)'s mask command. This is
          useful to boot with certain units removed from the initial boot
          transaction for debugging system startup. May be specified more
          than once.  rd.systemd.mask= is honored only by initial RAM disk
          (initrd) while systemd.mask= is honored only in the main system.

          If the systemd.wants= or rd.systemd.wants= option is specified
          and followed by a unit name, a start job for this unit is added
          to the initial transaction. This is useful to start one or more
          additional units at boot. May be specified more than once.
          rd.systemd.wants= is honored only by initial RAM disk (initrd)
          while systemd.wants= is honored only in the main system.

          If the systemd.debug_shell or rd.systemd.debug_shell option is
          specified, the debug shell service "debug-shell.service" is
          pulled into the boot transaction and a debug shell will be
          spawned during early boot. By default, /dev/tty9 is used, but a
          specific tty can also be set, either with or without the /dev/
          prefix. Note that the shell may also be turned on persistently by
          enabling it with systemctl(1)'s enable command.
          rd.systemd.debug_shell= is honored only by initial RAM disk
          (initrd) while systemd.debug_shell is honored only in the main
          system.

          systemd-debug-generator implements systemd.generator(7).


---------------------------------------------------------

::

          systemd(1), systemctl(1), kernel-command-line(7)

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

   systemd 249                                   SYSTEMD-DEBUG-GENERATOR(8)

--------------

Pages that refer to this page:
`kernel-command-line(7) <../man7/kernel-command-line.7.html>`__, 
`systemd.generator(7) <../man7/systemd.generator.7.html>`__

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
