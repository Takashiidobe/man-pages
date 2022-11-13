.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rpm-plugin-dbus-announce(8) — Linux manual page
===============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `Description <#Description>`__ \| |                                   |
| `DBus Signals <#DBus_Signals>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| Configuration <#Configuration>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RPM-DBUS-ANNOUNCE(8)                                RPM-DBUS-ANNOUNCE(8)

NAME
-------------------------------------------------

::

          rpm-plugin-dbus-announce - DBus plugin for the RPM Package
          Manager


---------------------------------------------------------------

::

          The plugin writes basic information about rpm transactions to the
          system dbus - like packages installed or removed.  Other programs
          can subscribe to the signals to be notified of the packages on
          the system change.


-----------------------------------------------------------------

::

          Sends StartTransaction and EndTransaction messages from the
          /org/rpm/Transaction object with the org.rpm.Transaction
          interface.

          The signal passes the DB cookie as a string and the transaction
          id as an unsigned 32 bit integer.


-------------------------------------------------------------------

::

          There are currently no options for this plugin in particular.
          See rpm-plugins(8) on how to control plugins in general.


---------------------------------------------------------

::

          dbus-monitor(1) rpm-plugins(8)

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

                                  03 Jun 2020          RPM-DBUS-ANNOUNCE(8)

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
