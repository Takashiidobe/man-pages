.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nameif(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NAMEIF(8)          Linux System Administrator's Manual         NAMEIF(8)

NAME
-------------------------------------------------

::

          nameif - name network interfaces based on MAC addresses


---------------------------------------------------------

::

          nameif [-c configfile] [-s]
          nameif [-c configfile] [-s] {interface macaddress}


---------------------------------------------------------------

::

          nameif renames network interfaces based on mac addresses. When no
          arguments are given /etc/mactab is read. Each line  of it
          contains an interface name and a Ethernet MAC address. Comments
          are allowed starting with #.  Otherwise the interfaces specified
          on the command line are processed.  nameif looks for the
          interface with the given MAC address and renames it to the name
          given.

          When the -s argument is given all error messages go to the
          syslog.

          When the -c argument is given with a file name that file is read
          instead of /etc/mactab.


---------------------------------------------------

::

          nameif should be run before the interface is up, otherwise it'll
          fail.


---------------------------------------------------

::

          /etc/mactab


-------------------------------------------------

::

          Only works for Ethernet currently.

COLOPHON
---------------------------------------------------------

::

          This page is part of the net-tools (networking utilities)
          project.  Information about the project can be found at 
          ⟨http://net-tools.sourceforge.net/⟩.  If you have a bug report for
          this manual page, see ⟨http://net-tools.sourceforge.net/⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨git://git.code.sf.net/p/net-tools/code⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-04-22.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   net-tools                      2008-10-03                      NAMEIF(8)

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
