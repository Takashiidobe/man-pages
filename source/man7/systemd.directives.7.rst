.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd.directives(7) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `UNIT                             |                                   |
|  DIRECTIVES <#UNIT_DIRECTIVES>`__ |                                   |
| \|                                |                                   |
| `OPTIONS O                        |                                   |
| N THE KERNEL COMMAND LINE <#OPTIO |                                   |
| NS_ON_THE_KERNEL_COMMAND_LINE>`__ |                                   |
| \|                                |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| EFI VARIABLES <#EFI_VARIABLES>`__ |                                   |
| \|                                |                                   |
| `HOME AR                          |                                   |
| EA/USER ACCOUNT DIRECTIVES <#HOME |                                   |
| _AREA/USER_ACCOUNT_DIRECTIVES>`__ |                                   |
| \|                                |                                   |
| `UDEV                             |                                   |
|  DIRECTIVES <#UDEV_DIRECTIVES>`__ |                                   |
| \|                                |                                   |
| `NETWORK DI                       |                                   |
| RECTIVES <#NETWORK_DIRECTIVES>`__ |                                   |
| \|                                |                                   |
| `JO                               |                                   |
| URNAL FIELDS <#JOURNAL_FIELDS>`__ |                                   |
| \|                                |                                   |
| `PAM CONFIGURATION DIRECTIVES <   |                                   |
| #PAM_CONFIGURATION_DIRECTIVES>`__ |                                   |
| \|                                |                                   |
| `/ETC/CRYPTTA                     |                                   |
| B, /ETC/VERITYTAB AND /ETC/FSTAB  |                                   |
| OPTIONS <#/ETC/CRYPTTAB,_/ETC/VER |                                   |
| ITYTAB_AND_/ETC/FSTAB_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `SYSTEMD.NSPAWN(5) DIRECTIVES <   |                                   |
| #SYSTEMD.NSPAWN(5)_DIRECTIVES>`__ |                                   |
| \|                                |                                   |
| `PROGRAM CONFIGURATION OPTIONS <# |                                   |
| PROGRAM_CONFIGURATION_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `COMMAND LINE O                   |                                   |
| PTIONS <#COMMAND_LINE_OPTIONS>`__ |                                   |
| \| `CONSTANTS <#CONSTANTS>`__ \|  |                                   |
| `DNS RESOURCE RECORD TYPE         |                                   |
| S <#DNS_RESOURCE_RECORD_TYPES>`__ |                                   |
| \|                                |                                   |
| `MISCELLANEOUS                    |                                   |
|  OPTIONS AND DIRECTIVES <#MISCELL |                                   |
| ANEOUS_OPTIONS_AND_DIRECTIVES>`__ |                                   |
| \| `SPECIFIERS <#SPECIFIERS>`__   |                                   |
| \|                                |                                   |
| `FILES AND DIRECT                 |                                   |
| ORIES <#FILES_AND_DIRECTORIES>`__ |                                   |
| \|                                |                                   |
| `D-BUS                            |                                   |
| INTERFACES <#D-BUS_INTERFACES>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| D-BUS METHODS <#D-BUS_METHODS>`__ |                                   |
| \|                                |                                   |
| `D-BUS                            |                                   |
| PROPERTIES <#D-BUS_PROPERTIES>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| D-BUS SIGNALS <#D-BUS_SIGNALS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD.DIRECTIVES(7)      systemd.directives      SYSTEMD.DIRECTIVES(7)

NAME
-------------------------------------------------

::

          systemd.directives - Index of configuration directives


-----------------------------------------------------------------------

::

          Directives for configuring units, used in unit files.


-------------------------------------------------------------------------------------------------------------

::

          Kernel boot options for configuring the behaviour of the systemd
          process.


-----------------------------------------------------------------------------------

::

          Environment variables understood by the systemd manager and other
          programs and environment variable-compatible settings.


-------------------------------------------------------------------

::

          EFI variables understood by systemd-boot(7) and other programs.


-----------------------------------------------------------------------------------------------------------

::

          Directives for configuring home areas and user accounts via
          systemd-homed.service(8).


-----------------------------------------------------------------------

::

          Directives for configuring systemd units through the udev
          database.


-----------------------------------------------------------------------------

::

          Directives for configuring network links through the
          net-setup-link udev builtin and networks through
          systemd-networkd.


---------------------------------------------------------------------

::

          Fields in the journal events with a well known meaning.


-------------------------------------------------------------------------------------------------

::

          Directives for configuring PAM behaviour.


-----------------------------------------------------------------------------------------------------------------------------------------------

::

          Options which influence mounted filesystems and encrypted
          volumes.


-------------------------------------------------------------------------------------------------

::

          Directives for configuring systemd-nspawn containers.


---------------------------------------------------------------------------------------------------

::

          Directives for configuring the behaviour of the systemd process
          and other tools through configuration files.


---------------------------------------------------------------------------------

::

          Command-line options accepted by programs in the systemd suite.


-----------------------------------------------------------

::

          Various constants used and/or defined by systemd.


-------------------------------------------------------------------------------------------

::


-----------------------------------------------------------------------------------------------------------------

::

          Other configuration elements which don't fit in any of the above
          groups.


-------------------------------------------------------------

::

          Short strings which are substituted in configuration directives.


-----------------------------------------------------------------------------------

::

          Paths and file names referred to in the documentation.


-------------------------------------------------------------------------

::

          Interfaces exposed over D-Bus.


-------------------------------------------------------------------

::

          Methods exposed in the D-Bus interface.


-------------------------------------------------------------------------

::

          Properties exposed in the D-Bus interface.


-------------------------------------------------------------------

::

          Signals emitted in the D-Bus interface.

COLOPHON
---------------------------------------------------------

::

          This index contains 0 entries in 22 sections, referring to 0
          individual manual pages.

.. _colophon-top-1:

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

   systemd 249                                        SYSTEMD.DIRECTIVES(7)

--------------

Pages that refer to this page: `systemd(1) <../man1/systemd.1.html>`__, 
`systemd.automount(5) <../man5/systemd.automount.5.html>`__, 
`systemd.device(5) <../man5/systemd.device.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`systemd.kill(5) <../man5/systemd.kill.5.html>`__, 
`systemd.mount(5) <../man5/systemd.mount.5.html>`__, 
`systemd.nspawn(5) <../man5/systemd.nspawn.5.html>`__, 
`systemd.path(5) <../man5/systemd.path.5.html>`__, 
`systemd.resource-control(5) <../man5/systemd.resource-control.5.html>`__, 
`systemd.scope(5) <../man5/systemd.scope.5.html>`__, 
`systemd.service(5) <../man5/systemd.service.5.html>`__, 
`systemd-sleep.conf(5) <../man5/systemd-sleep.conf.5.html>`__, 
`systemd.slice(5) <../man5/systemd.slice.5.html>`__, 
`systemd.socket(5) <../man5/systemd.socket.5.html>`__, 
`systemd.swap(5) <../man5/systemd.swap.5.html>`__, 
`systemd-system.conf(5) <../man5/systemd-system.conf.5.html>`__, 
`systemd.target(5) <../man5/systemd.target.5.html>`__, 
`systemd.timer(5) <../man5/systemd.timer.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`systemd.index(7) <../man7/systemd.index.7.html>`__, 
`systemd.journal-fields(7) <../man7/systemd.journal-fields.7.html>`__, 
`systemd.time(7) <../man7/systemd.time.7.html>`__

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
