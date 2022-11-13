.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-bless-boot.service(8) — Linux manual page
=================================================

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

   SYSTEMD-BLESS-BOOT.SERVICE(8)d-bless-boot.serviceD-BLESS-BOOT.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-bless-boot.service, systemd-bless-boot - Mark current
          boot process as successful


---------------------------------------------------------

::

          systemd-bless-boot.service

          /usr/lib/systemd/system-bless-boot


---------------------------------------------------------------

::

          systemd-bless-boot.service is a system service that marks the
          current boot process as successful. It's automatically pulled
          into the initial transaction when systemd-bless-boot-generator(8)
          detects that systemd-boot(7) style boot counting is used.

          Internally, the service operates based on the LoaderBootCountPath
          EFI variable (of the vendor UUID
          4a67b082-0a4c-41cf-b6c7-440b29bb8c4), which is passed from the
          boot loader to the OS. It contains a file system path (relative
          to the EFI system partition) of the Boot Loader Specification[1]
          compliant boot loader entry file or unified kernel image file
          that was used to boot up the system.  systemd-bless-boot.service
          removes the two 'tries done' and 'tries left' numeric boot
          counters from the filename, which indicates to future invocations
          of the boot loader that the entry has completed booting
          successfully at least once. (This service will hence rename the
          boot loader entry file or unified kernel image file on the first
          successful boot.)


-------------------------------------------------------

::

          The /usr/lib/systemd/system-bless-boot executable may also be
          invoked from the command line, taking one of the following
          command arguments:

          status
              The current status of the boot loader entry file or unified
              kernel image file is shown. This outputs one of "good",
              "bad", "indeterminate", "clean", depending on the state and
              previous invocations of the command. The string
              "indeterminate" is shown initially after boot, before it has
              been marked as "good" or "bad". The string "good" is shown
              after the boot was marked as "good" with the good command
              below, and "bad" conversely after the bad command was
              invoked. The string "clean" is returned when boot counting is
              currently not in effect.

              This command is implied if no command argument is specified.

          good
              When invoked, the current boot loader entry file or unified
              kernel image file will be marked as "good", executing the
              file rename operation described above. This command is
              intended to be invoked at the end of a successful boot. The
              systemd-bless-boot.service unit invokes this command.

          bad
              When called the 'tries left' counter in the boot loader entry
              file name or unified kernel image file name is set to zero,
              marking the boot loader entry or kernel image as "bad", so
              that the boot loader won't consider it anymore on future
              boots (at least as long as there are other entries available
              that are not marked "bad" yet). This command is normally not
              executed, but can be used to instantly put an end to the boot
              counting logic if a problem is detected and persistently mark
              the boot entry as bad.

          indeterminate
              This command undoes any marking of the current boot loader
              entry file or unified kernel image file as good or bad. This
              is implemented by renaming the boot loader entry file or
              unified kernel image file back to the path encoded in the
              LoaderBootCountPath EFI variable.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------

::

          systemd(1), systemd-boot(7), systemd.special(7)


---------------------------------------------------

::

           1. Boot Loader Specification
              https://systemd.io/BOOT_LOADER_SPECIFICATION

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

   systemd 249                                SYSTEMD-BLESS-BOOT.SERVICE(8)

--------------

Pages that refer to this page:
`systemd-boot(7) <../man7/systemd-boot.7.html>`__, 
`systemd.special(7) <../man7/systemd.special.7.html>`__, 
`systemd-bless-boot-generator(8) <../man8/systemd-bless-boot-generator.8.html>`__

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
