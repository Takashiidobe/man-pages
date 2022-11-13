.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bsearch(3p) — Linux manual page
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

   BSEARCH(3P)             POSIX Programmer's Manual            BSEARCH(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          bsearch — binary search a sorted table


---------------------------------------------------------

::

          #include <stdlib.h>

          void *bsearch(const void *key, const void *base, size_t nel,
              size_t width, int (*compar)(const void *, const void *));


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The bsearch() function shall search an array of nel objects, the
          initial element of which is pointed to by base, for an element
          that matches the object pointed to by key.  The size of each
          element in the array is specified by width.  If the nel argument
          has the value zero, the comparison function pointed to by compar
          shall not be called and no match shall be found.

          The comparison function pointed to by compar shall be called with
          two arguments that point to the key object and to an array
          element, in that order.

          The application shall ensure that the comparison function pointed
          to by compar does not alter the contents of the array. The
          implementation may reorder elements of the array between calls to
          the comparison function, but shall not alter the contents of any
          individual element.

          The implementation shall ensure that the first argument is always
          a pointer to the key.

          When the same objects (consisting of width bytes, irrespective of
          their current positions in the array) are passed more than once
          to the comparison function, the results shall be consistent with
          one another.  That is, the same object shall always compare the
          same way with the key.

          The application shall ensure that the function returns an integer
          less than, equal to, or greater than 0 if the key object is
          considered, respectively, to be less than, to match, or to be
          greater than the array element. The application shall ensure that
          the array consists of all the elements that compare less than,
          all the elements that compare equal to, and all the elements that
          compare greater than the key object, in that order.


-----------------------------------------------------------------

::

          The bsearch() function shall return a pointer to a matching
          member of the array, or a null pointer if no match is found. If
          two or more members compare equal, which member is returned is
          unspecified.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          The example below searches a table containing pointers to nodes
          consisting of a string and its length. The table is ordered
          alphabetically on the string in the node pointed to by each
          entry.

          The code fragment below reads in strings and either finds the
          corresponding node and prints out the string and its length, or
          prints an error message.

              #include <stdio.h>
              #include <stdlib.h>
              #include <string.h>

              #define TABSIZE    1000

              struct node {                  /* These are stored in the table. */
                  char *string;
                  int length;
              };
              struct node table[TABSIZE];    /* Table to be searched. */
                  .
                  .
                  .
              {
                  struct node *node_ptr, node;
                  /* Routine to compare 2 nodes. */
                  int node_compare(const void *, const void *);
                  .
                  .
                  .
                  while (scanf("%ms", &node.string) != EOF) {
                      node_ptr = (struct node *)bsearch((void *)(&node),
                             (void *)table, TABSIZE,
                             sizeof(struct node), node_compare);
                      if (node_ptr != NULL) {
                          (void)printf("string = %20s, length = %d\n",
                              node_ptr->string, node_ptr->length);
                      } else {
                          (void)printf("not found: %s\n", node.string);
                      }
                      free(node.string);
                  }
              }
              /*
                  This routine compares two nodes based on an
                  alphabetical ordering of the string field.
              */
              int
              node_compare(const void *node1, const void *node2)
              {
                  return strcoll(((const struct node *)node1)->string,
                      ((const struct node *)node2)->string);
              }


---------------------------------------------------------------------------

::

          The pointers to the key and the element at the base of the table
          should be of type pointer-to-element.

          The comparison function need not compare every byte, so arbitrary
          data may be contained in the elements in addition to the values
          being compared.

          In practice, the array is usually sorted according to the
          comparison function.


-----------------------------------------------------------

::

          The requirement that the second argument (hereafter referred to
          as p) to the comparison function is a pointer to an element of
          the array implies that for every call all of the following
          expressions are non-zero:

              ( (char *)p - (char *)base ) % width == 0
              (char *)p >= (char *)base
              (char *)p < (char *)base + nel * width


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          hcreate(3p), lsearch(3p), qsort(3p), tdelete(3p)

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

   IEEE/The Open Group               2017                       BSEARCH(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`hcreate(3p) <../man3/hcreate.3p.html>`__

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
