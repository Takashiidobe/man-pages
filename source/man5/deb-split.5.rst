.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

deb-split(5) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FORMAT <#FORMAT>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   deb-split(5)                   dpkg suite                   deb-split(5)

NAME
-------------------------------------------------

::

          deb-split - Debian multi-part binary package format


---------------------------------------------------------

::

          filename.deb


---------------------------------------------------------------

::

          The multi-part .deb format is used to split big packages into
          smaller pieces to ease transport in small media.


-----------------------------------------------------

::

          The file is an ar archive with a magic value of !<arch>.  The
          file names might contain a trailing slash (since dpkg 1.15.6).

          The first member is named debian-split and contains a series of
          lines, separated by newlines. Currently eight lines are present:

          •   The format version number, 2.1 at the time this manual page
              was written.

          •   The package name.

          •   The package version.

          •   The md5sum of the package.

          •   The total size of the package.

          •   The maximum part size.

          •   The current part number, followed by a slash and the total
              amount of parts (as in ‘1/10’).

          •   The package architecture (since dpkg 1.16.1).

          Programs which read multi-part archives should be prepared for
          the minor format version number to be increased and additional
          lines to be present, and should ignore these if this is the case.

          If the major format version number has changed, an incompatible
          change has been made and the program should stop. If it has not,
          then the program should be able to safely continue, unless it
          encounters an unexpected member in the archive (except at the
          end), as described below.

          The second, last required member is named data.N, where N denotes
          the part number. It contains the raw part data.

          These members must occur in this exact order. Current
          implementations should ignore any additional members after
          data.N.  Further members may be defined in the future, and (if
          possible) will be placed after these two.


---------------------------------------------------------

::

          deb(5), dpkg-split(1).

COLOPHON
---------------------------------------------------------

::

          This page is part of the dpkg (Debian Package Manager) project.
          Information about the project can be found at 
          ⟨https://wiki.debian.org/Teams/Dpkg/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://bugs.debian.org/cgi-bin/pkgreport.cgi?src=dpkg⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨https://salsa.debian.org/dpkg-team/dpkg.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-06-17.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   1.19.6-2-g6e42d5               2019-03-25                   deb-split(5)

--------------

Pages that refer to this page:
`dpkg-split(1) <../man1/dpkg-split.1.html>`__

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
