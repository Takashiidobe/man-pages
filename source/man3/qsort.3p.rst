.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

qsort(3p) — Linux manual page
=============================

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

   QSORT(3P)               POSIX Programmer's Manual              QSORT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          qsort — sort a table of data


---------------------------------------------------------

::

          #include <stdlib.h>

          void qsort(void *base, size_t nel, size_t width,
              int (*compar)(const void *, const void *));


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The qsort() function shall sort an array of nel objects, the
          initial element of which is pointed to by base.  The size of each
          object, in bytes, is specified by the width argument. If the nel
          argument has the value zero, the comparison function pointed to
          by compar shall not be called and no rearrangement shall take
          place.

          The application shall ensure that the comparison function pointed
          to by compar does not alter the contents of the array. The
          implementation may reorder elements of the array between calls to
          the comparison function, but shall not alter the contents of any
          individual element.

          When the same objects (consisting of width bytes, irrespective of
          their current positions in the array) are passed more than once
          to the comparison function, the results shall be consistent with
          one another.  That is, they shall define a total ordering on the
          array.

          The contents of the array shall be sorted in ascending order
          according to a comparison function. The compar argument is a
          pointer to the comparison function, which is called with two
          arguments that point to the elements being compared. The
          application shall ensure that the function returns an integer
          less than, equal to, or greater than 0, if the first argument is
          considered respectively less than, equal to, or greater than the
          second. If two members compare as equal, their order in the
          sorted array is unspecified.


-----------------------------------------------------------------

::

          The qsort() function shall not return a value.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The comparison function need not compare every byte, so arbitrary
          data may be contained in the elements in addition to the values
          being compared.


-----------------------------------------------------------

::

          The requirement that each argument (hereafter referred to as p)
          to the comparison function is a pointer to elements of the array
          implies that for every call, for each argument separately, all of
          the following expressions are non-zero:

              ((char *)p - (char *)base) % width == 0
              (char *)p >= (char *)base
              (char *)p < (char *)base + nel * width


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          alphasort(3p)

          The Base Definitions volume of POSIX.1‐2017, stdlib.h(0p)


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

   IEEE/The Open Group               2017                         QSORT(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`alphasort(3p) <../man3/alphasort.3p.html>`__, 
`bsearch(3p) <../man3/bsearch.3p.html>`__

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
