.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rpm-misc(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `Switching off feat               |                                   |
| ures <#Switching_off_features>`__ |                                   |
| \| `Debugging <#Debugging>`__ \|  |                                   |
| `Obsole                           |                                   |
| te Options <#Obsolete_Options>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RPM misc options(8)                                  RPM misc options(8)

NAME
-------------------------------------------------

::

          rpm - lesser need options for rpm(8)


-------------------------------------------------------

::

          --predefine='MACRO EXPR'
                 Defines MACRO with value EXPR.  before loading macro
                 files.


-------------------------------------------------------------------------------------

::

          --color [never|auto|always]
                 Use terminal colors for highlighting error and debug
                 message.  Default is turning colors on for ttys only
                 (auto).

          --nocontexts Disable the SELinux plugin if available.  This stops
          the plugin from setting SELinux contexts for files and
          scriptlets.

          --noglob
                 Do not glob arguments when installing package files.

          --nocaps
                 Don't verify capabilities of files.

          --excludeconfigs, --noconfigs
                 Do not install configuration files.

          --nohdrchk
                 Don't verify database header(s) when retrieved.


-----------------------------------------------------------

::

          -d, --debug
                 Print debugging information.

          --deploops
                 Print dependency loops as warning.

          --fsmdebug
                 Print debuging information of payload handling code.

          --rpmfcdebug
                 Print debug information about files packaged.

          --rpmiodebug
                 Print debug information about file IO.

          --stats
                 Print runtime statistics of often used functions.


-------------------------------------------------------------------------

::

          -K, --checksig
                 See and use rpmkeys(8).

          --nodocs
                 Do not install documentation.  Use --excludedocs instead.

          --promoteepoch
                 Enable obsolete epoch handling used in rpm 3.x time frame.

          --prtpkts
                 OBSOLETE! Used to print the packages containing and
                 representing the pgp keys for debugging purposes.

COLOPHON
---------------------------------------------------------

::

          This page is part of the rpm (RPM Package Manager) project.
          Information about the project can be found at 
          ⟨https://github.com/rpm-software-management/rpm⟩.  It is not known
          how to report bugs for this man page; if you know, please send a
          mail to man-pages@man7.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/rpm-software-management/rpm.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-25.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                        RPM misc options(8)

--------------

Pages that refer to this page: `rpm(8) <../man8/rpm.8.html>`__

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
