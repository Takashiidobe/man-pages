.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmfstring(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| COMPATIBILITY <#COMPATIBILITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::


   PMFSTRING(3)            Library Functions Manual            PMFSTRING(3)

NAME
-------------------------------------------------

::

          pmfstring - safe string scanning


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          ssize_t pmfstring(FILE *f, char **str);

          cc ... -lpcp


---------------------------------------------------------------

::

          pmfstring is a safe string scanning routine with semantics
          similar to fscanf(3) with the %s format specifier.  It scans the
          input stream from f skipping initial whitespace characters, then
          accumulating all the subsequent non-whitespace characters.

          The main difference is that pmfstring allocates the result buffer
          str using the malloc(3) family and ensures that str is (a) large
          enough and (b) null-byte terminated.

          Additionally pmfstring does not consider \n to be a whitespace
          character in the initial scan (before filling str) and so will
          not scan past the end of the current line, which is different to
          fscanf(3) and better aligned with the PCP use cases.

          The caller is responsible for maintaining a reference to str or
          calling free(3) to release the associated storage.

          On success, pmfstring returns the length of str (the same length
          as strlen(3) would return) that is guaranteed to be not less than
          1.

          Failure is indicated by one of the following, and str is not
          assigned a value:
           • 0 to indicate no non-whitespace characters were found before
             the end of the current line from the stream f
           • -1 ( aka EOF) to indicate end of file on the stream f
           • -2 to indicate some more serious failure, probably in the
             malloc(3) routines; refer to errno for more information


-------------------------------------------------------------------

::

          pmfstring has similar semantics to the %ms format specifier in
          some versions of fscanf(3) and the C99 fscanf_s(3) routine -
          unfortunately neither of these is portable.


---------------------------------------------------------

::

          free(3), fscanf(3), malloc(3) and strlen(3).

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

   Performance Co-Pilot               PCP                      PMFSTRING(3)

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
