.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lsearch(3p) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LSEARCH(3P)             POSIX Programmer's Manual            LSEARCH(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          lsearch, lfind — linear search and update


---------------------------------------------------------

::

          #include <search.h>

          void *lsearch(const void *key, void *base, size_t *nelp, size_t width,
              int (*compar)(const void *, const void *));
          void *lfind(const void *key, const void *base, size_t *nelp,
              size_t width, int (*compar)(const void *, const void *));


---------------------------------------------------------------

::

          The lsearch() function shall linearly search the table and return
          a pointer into the table for the matching entry. If the entry
          does not occur, it shall be added at the end of the table. The
          key argument points to the entry to be sought in the table. The
          base argument points to the first element in the table. The width
          argument is the size of an element in bytes. The nelp argument
          points to an integer containing the current number of elements in
          the table. The integer to which nelp points shall be incremented
          if the entry is added to the table. The compar argument points to
          a comparison function which the application shall supply (for
          example, strcmp()).  It is called with two arguments that point
          to the elements being compared. The application shall ensure that
          the function returns 0 if the elements are equal, and non-zero
          otherwise.

          The lfind() function shall be equivalent to lsearch(), except
          that if the entry is not found, it is not added to the table.
          Instead, a null pointer is returned.


-----------------------------------------------------------------

::

          If the searched for entry is found, both lsearch() and lfind()
          shall return a pointer to it. Otherwise, lfind() shall return a
          null pointer and lsearch() shall return a pointer to the newly
          added element.

          Both functions shall return a null pointer in case of error.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

      Storing Strings in a Table
          This fragment reads in less than or equal to TABSIZE strings of
          length less than or equal to ELSIZE and stores them in a table,
          eliminating duplicates.

              #include <stdio.h>
              #include <string.h>
              #include <search.h>

              #define TABSIZE 50
              #define ELSIZE 120

              ...
                  char line[ELSIZE], tab[TABSIZE][ELSIZE];
                  size_t nel = 0;
                  ...
                  while (fgets(line, ELSIZE, stdin) != NULL && nel < TABSIZE)
                      (void) lsearch(line, tab, &nel,
                          ELSIZE, (int (*)(const void *, const void *)) strcmp);
                  ...

      Finding a Matching Entry
          The following example finds any line that reads "Thisisatest.".

              #include <search.h>
              #include <string.h>
              ...
              char line[ELSIZE], tab[TABSIZE][ELSIZE];
              size_t nel = 0;
              char *findline;
              void *entry;

              findline = "This is a test.\n";

              entry = lfind(findline, tab, &nel, ELSIZE, (
                  int (*)(const void *, const void *)) strcmp);


---------------------------------------------------------------------------

::

          The comparison function need not compare every byte, so arbitrary
          data may be contained in the elements in addition to the values
          being compared.

          Undefined results can occur if there is not enough room in the
          table to add a new item.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          hcreate(3p), tdelete(3p)

          The Base Definitions volume of POSIX.1‐2017, search.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                       LSEARCH(3P)

--------------

Pages that refer to this page:
`search.h(0p) <../man0/search.h.0p.html>`__, 
`bsearch(3p) <../man3/bsearch.3p.html>`__, 
`hcreate(3p) <../man3/hcreate.3p.html>`__, 
`lfind(3p) <../man3/lfind.3p.html>`__, 
`tdelete(3p) <../man3/tdelete.3p.html>`__

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
