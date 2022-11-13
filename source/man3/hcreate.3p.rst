.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

hcreate(3p) — Linux manual page
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

   HCREATE(3P)             POSIX Programmer's Manual            HCREATE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          hcreate, hdestroy, hsearch — manage hash search table


---------------------------------------------------------

::

          #include <search.h>

          int hcreate(size_t nel);
          void hdestroy(void);
          ENTRY *hsearch(ENTRY item, ACTION action);


---------------------------------------------------------------

::

          The hcreate(), hdestroy(), and hsearch() functions shall manage
          hash search tables.

          The hcreate() function shall allocate sufficient space for the
          table, and the application shall ensure it is called before
          hsearch() is used. The nel argument is an estimate of the maximum
          number of entries that the table shall contain. This number may
          be adjusted upward by the algorithm in order to obtain certain
          mathematically favorable circumstances.

          The hdestroy() function shall dispose of the search table, and
          may be followed by another call to hcreate().  After the call to
          hdestroy(), the data can no longer be considered accessible.

          The hsearch() function is a hash-table search routine. It shall
          return a pointer into a hash table indicating the location at
          which an entry can be found. The item argument is a structure of
          type ENTRY (defined in the <search.h> header) containing two
          pointers: item.key points to the comparison key (a char *), and
          item.data (a void *) points to any other data to be associated
          with that key. The comparison function used by hsearch() is
          strcmp().  The action argument is a member of an enumeration type
          ACTION indicating the disposition of the entry if it cannot be
          found in the table. ENTER indicates that the item should be
          inserted in the table at an appropriate point. FIND indicates
          that no entry should be made.  Unsuccessful resolution is
          indicated by the return of a null pointer.

          These functions need not be thread-safe.


-----------------------------------------------------------------

::

          The hcreate() function shall return 0 if it cannot allocate
          sufficient space for the table; otherwise, it shall return non-
          zero.

          The hdestroy() function shall not return a value.

          The hsearch() function shall return a null pointer if either the
          action is FIND and the item could not be found or the action is
          ENTER and the table is full.


-----------------------------------------------------

::

          The hcreate() and hsearch() functions may fail if:

          ENOMEM Insufficient storage space is available.

          The following sections are informative.


---------------------------------------------------------

::

          The following example reads in strings followed by two numbers
          and stores them in a hash table, discarding duplicates. It then
          reads in strings and finds the matching entry in the hash table
          and prints it out.

              #include <stdio.h>
              #include <search.h>
              #include <string.h>

              struct info {        /* This is the info stored in the table */
                  int age, room;   /* other than the key. */
              };

              #define NUM_EMPL    5000    /* # of elements in search table. */

              int main(void)
              {
                  char string_space[NUM_EMPL*20];   /* Space to store strings. */
                  struct info info_space[NUM_EMPL]; /* Space to store employee info. */
                  char *str_ptr = string_space;     /* Next space in string_space. */
                  struct info *info_ptr = info_space;
                                                    /* Next space in info_space. */
                  ENTRY item;
                  ENTRY *found_item; /* Name to look for in table. */
                  char name_to_find[30];

                  int i = 0;

                  /* Create table; no error checking is performed. */
                  (void) hcreate(NUM_EMPL);
                  while (scanf("%s%d%d", str_ptr, &info_ptr->age,
                         &info_ptr->room) != EOF && i++ < NUM_EMPL) {

                      /* Put information in structure, and structure in item. */
                      item.key = str_ptr;
                      item.data = info_ptr;
                      str_ptr += strlen(str_ptr) + 1;
                      info_ptr++;

                      /* Put item into table. */
                      (void) hsearch(item, ENTER);
                  }

                  /* Access table. */
                  item.key = name_to_find;
                  while (scanf("%s", item.key) != EOF) {
                      if ((found_item = hsearch(item, FIND)) != NULL) {

                          /* If item is in the table. */
                          (void)printf("found %s, age = %d, room = %d\n",
                              found_item->key,
                              ((struct info *)found_item->data)->age,
                              ((struct info *)found_item->data)->room);
                      } else
                          (void)printf("no such employee %s\n", name_to_find);
                  }
                  return 0;
              }


---------------------------------------------------------------------------

::

          The hcreate() and hsearch() functions may use malloc() to
          allocate space.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          bsearch(3p), lsearch(3p), malloc(3p), strcmp(3p), tdelete(3p)

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

   IEEE/The Open Group               2017                       HCREATE(3P)

--------------

Pages that refer to this page:
`search.h(0p) <../man0/search.h.0p.html>`__, 
`bsearch(3p) <../man3/bsearch.3p.html>`__, 
`lsearch(3p) <../man3/lsearch.3p.html>`__, 
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
