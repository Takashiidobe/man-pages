.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tzselect(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TZSELECT(8)            Linux System Administration           TZSELECT(8)

NAME
-------------------------------------------------

::

          tzselect - select a timezone


---------------------------------------------------------

::

          tzselect


---------------------------------------------------------------

::

          The tzselect program asks the user for information about the
          current location, and outputs the resulting timezone description
          to standard output.  The output is suitable as a value for the TZ
          environment variable.

          All interaction with the user is done via standard input and
          standard error.


---------------------------------------------------------------

::

          The exit status is zero if a timezone was successfully obtained
          from the user, and is nonzero otherwise.


---------------------------------------------------------------

::

          AWK    Name of a POSIX-compliant awk program (default: awk).

          TZDIR  Name of the directory containing timezone data files
                 (default: /usr/share/zoneinfo).


---------------------------------------------------

::

          TZDIR/iso3166.tab
                 Table of ISO 3166 2-letter country codes and country
                 names.

          TZDIR/zone.tab
                 Table of country codes, latitude and longitude, TZ values,
                 and descriptive comments.

          TZDIR/TZ
                 Timezone data file for timezone TZ.


---------------------------------------------------------

::

          tzfile(5), zdump(8), zic(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                    TZSELECT(8)

--------------

Pages that refer to this page:
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`tzfile(5) <../man5/tzfile.5.html>`__, 
`environ(7) <../man7/environ.7.html>`__

--------------

`Copyright and license for this manual
page <../man8/tzselect.8.license.html>`__

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
