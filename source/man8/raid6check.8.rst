.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

raid6check(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RAID6CHECK(8)            System Manager's Manual           RAID6CHECK(8)

NAME
-------------------------------------------------

::

          raid6check - check MD RAID6 device for errors aka Linux Software
          RAID


---------------------------------------------------------

::

          raid6check <raid6 device> <start stripe> <number of stripes>


---------------------------------------------------------------

::

          RAID6 devices in which one single component drive has errors can
          use the double parity in order to find out which component drive.
          The "raid6check" tool checks, for each stripe, the double parity
          consistency, reports mismatches and, if possible, which component
          drive has the mismatch.  Since it works at stripe level, it can
          report different drives with mismatches at different stripes.

          "raid6check" requires a non-degraded RAID6 MD device as first
          parameter, a starting stripe (usually 0) and the number of
          stripes to be checked.  If this third parameter is also 0, it
          will check the array up to the end.

          "raid6check" will start printing information about the RAID6,
          then for each stripe, it will report the parity rotation status.
          In case of parity mismatches, "raid6check" reports, if possible,
          which component drive could be responsible. Otherwise it reports
          that it is not possible to find the component drive.

          If the given MD device is not a RAID6, "raid6check" will, of
          course, not continue.

          If the RAID6 MD device is degraded, "raid6check" will report an
          error and it will not proceed further.

          No write operations are performed on the array or the components.
          Furthermore, the checked array can be online and in use during
          the operation of "raid6check".


---------------------------------------------------------

::

            raid6check /dev/md0 0 0
          This will check /dev/md0 from start to end.

            raid6check /dev/md3 0 1
          This will check the first stripe of /dev/md3.

            raid6check /dev/md1 1000 0
          This will check /dev/md1 from stripe 1000 up to the end.

            raid6check /dev/m127 128 256
          This will check 256 stripes of /dev/md127 starting from stripe
          128.

            raid6check /dev/md0 0 0 | grep -i error > md0_err.log
          This will check /dev/md0 completely and create a log file only
          with errors, if any.


---------------------------------------------------

::

          "raid6check" uses directly the component drives as found in /dev.
          Furthermore, the sysfs interface is needed in order to find out
          the RAID6 parameters.


-------------------------------------------------

::

          Negative parameters can lead to unexpected results.

          It is not clear what will happen if the RAID6 MD device gets
          degraded during the check.

          The latest version of raid6check should always be available from

                 https://www.kernel.org/pub/linux/utils/raid/mdadm/ 

          Related man pages:

          mdadm(8) mdmon(8), mdadm.conf(5), md(4).

COLOPHON
---------------------------------------------------------

::

          This page is part of the mdadm (Tool for managing md arrays in
          Linux) project.  Information about the project can be found at 
          ⟨http://neil.brown.name/blog/mdadm⟩.  If you have a bug report for
          this manual page, send it to linux-raid@vger.kernl.org.  This
          page was obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-13.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   v1.0.0                                                     RAID6CHECK(8)

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
