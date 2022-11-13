.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmnumberstr(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMNUMBERSTR(3)          Library Functions Manual          PMNUMBERSTR(3)

NAME
-------------------------------------------------

::

          pmNumberStr, pmNumberStr_r - fixed width output format for
          numbers


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          const char *pmNumberStr(double value);
          char *pmNumberStr_r(double value, char *buf, int buflen);

          cc ... -lpcp


---------------------------------------------------------------

::

          pmNumberStr returns the address of a 8-byte buffer that holds a
          null-byte terminated representation of value suitable for output
          with fixed width fields.  The pmNumberStr_r function does the
          same, but stores the result in a user-supplied buffer buf of
          length buflen, which should have room for at least 8 bytes.

          The value is scaled using multipliers in powers of ``one
          thousand'' (the decimal ``kilo'') and has a bias that provides
          greater precision for positive numbers as opposed to negative
          numbers.

          The format depends on the sign and magnitude of value as follows
          (d represents a decimal digit):

                    ┌──────────────────────────────────┬─────────┐
                    │           value range            │ format  │
                    ├──────────────────────────────────┼─────────┤
                    │        > 999995000000000         │  inf?   │
                    │999995000000000 - 999995000000    │ ddd.ddT │
                    │   999995000000 - 999995000       │ ddd.ddG │
                    │      999995000 - 999995          │ ddd.ddM │
                    │         999995 - 999.995         │ ddd.ddK │
                    │        999.995 - 0.005           │ ddd.dd  │
                    │          0.005 - -0.005          │   0.00  │
                    │         -0.005 - -99.95          │ -dd.dd  │
                    │        -99.995 - -99995          │ -dd.ddK │
                    │         -99995 - -99995000       │ -dd.ddM │
                    │      -99995000 - -99995000000    │ -dd.ddG │
                    │   -99995000000 - -99995000000000 │ -dd.ddT │
                    │       < -99995000000000          │ -inf?   │
                    └──────────────────────────────────┴─────────┘
          At the boundary points of the ranges, the chosen format will
          retain the maximum number of significant digits.


---------------------------------------------------

::

          pmNumberStr returns a pointer to a static buffer and hence is not
          thread-safe.  Multi-threaded applications should use
          pmNumberStr_r instead.


---------------------------------------------------------

::

          printf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                    PMNUMBERSTR(3)

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
