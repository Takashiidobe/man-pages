.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ditroff(7) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Description <#Description>`__ \| |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ditroff(7)          Miscellaneous Information Manual          ditroff(7)


-------------------------------------------------

::

          ditroff - device-independent typesetter roff


---------------------------------------------------------------

::

          The name ditroff refers to a historical development stage of the
          roff(7) text processing system.  In roff systems extant today,
          the name troff is a synonym for ditroff.

          Early versions of roff by Joe Ossanna generated two programs from
          the same sources, using conditional compilation to distinguish
          them.  nroff produced text-oriented TTY output, while troff
          generated graphical output for exactly one output device, the
          Wang Graphic Systems CAT phototypesetter.

          In 1979, Brian Kernighan rewrote troff to support more devices by
          creating an intermediate output format for troff that could be
          fed into postprocessor programs which actually do the printout on
          the device.  Kernighan's version marks what is known as
          “classical troff” today.  In order to distinguish it from
          Ossanna's original version, it was called ditroff (device
          independent troff) on some systems, though this naming isn't
          mentioned in the classical documentation.

          Today, all existing roff systems are based on Kernighan's multi-
          device troff.  The distinction between troff and ditroff is no
          longer necessary; each modern troff provides the complete
          functionality of ditroff.

          The easiest way to use ditroff is via the GNU roff system, groff.
          The groff(1) program is a wrapper around (di)troff that
          automatically handles device postprocessing.


-------------------------------------------------------

::

          This document was written by Bernd Warken ⟨groff-bernd.warken-72@
          web.de⟩.


---------------------------------------------------------

::

          CSTR #54
                 refers to the 1992 revision of the Nroff/Troff User's
                 Manual by J. F. Ossanna and Brian Kernighan.

          CSTR #97
                 refers to A Typesetter-independent TROFF, by Brian
                 Kernighan and is the original documentation of the first
                 multi-device troff (ditroff).

          roff(7)
                 provides a history and conceptual overview of roff
                 systems.

          troff(1)
                 describes the GNU implementation of (di)troff.

          groff(1)
                 documents the GNU roff program and includes pointers to
                 further documentation about groff.

          groff_out(5)
                 describes the groff version of the intermediate output
                 language, the basis for multi-device output.

COLOPHON
---------------------------------------------------------

::

          This page is part of the groff (GNU troff) project.  Information
          about the project can be found at 
          ⟨http://www.gnu.org/software/groff/⟩.  If you have a bug report
          for this manual page, see ⟨http://www.gnu.org/software/groff/⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://git.savannah.gnu.org/git/groff.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                   ditroff(7)

--------------

Pages that refer to this page: `groff(1) <../man1/groff.1.html>`__

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
