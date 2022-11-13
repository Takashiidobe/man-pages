.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

queue(7) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   QUEUE(7)                Linux Programmer's Manual               QUEUE(7)

NAME
-------------------------------------------------

::

          queue - implementations of linked lists and queues


---------------------------------------------------------------

::

          The <sys/queue.h> header file provides a set of macros that
          define and operate on the following data structures:

          *  singly linked lists (SLIST)

          *  doubly linked lists (LIST)

          *  singly linked tail queues (STAILQ)

          *  doubly linked tail queues (TAILQ)

          *  doubly linked circular queues (CIRCLEQ)

          All structures support the following functionality:

          *  Insertion of a new entry at the head of the list.

          *  Insertion of a new entry after any element in the list.

          *  O(1) removal of an entry from the head of the list.

          *  Forward traversal through the list.

          Code size and execution time depend on the complexity of the data
          structure being used, so programmers should take care to choose
          the appropriate one.

      Singly linked lists (SLIST)
          Singly linked lists are the simplest and support only the above
          functionality.  Singly linked lists are ideal for applications
          with large datasets and few or no removals, or for implementing a
          LIFO queue.  Singly linked lists add the following functionality:

          *  O(n) removal of any entry in the list.

      Singly linked tail queues (STAILQ)
          Singly linked tail queues add the following functionality:

          *  Entries can be added at the end of a list.

          *  O(n) removal of any entry in the list.

          *  They may be concatenated.

          However:

          *  All list insertions must specify the head of the list.

          *  Each head entry requires two pointers rather than one.

          Singly linked tail queues are ideal for applications with large
          datasets and few or no removals, or for implementing a FIFO
          queue.

      Doubly linked data structures
          All doubly linked types of data structures (lists and tail
          queues) additionally allow:

          *  Insertion of a new entry before any element in the list.

          *  O(1) removal of any entry in the list.

          However:

          *  Each element requires two pointers rather than one.

      Doubly linked lists (LIST)
          Linked lists are the simplest of the doubly linked data
          structures.  They add the following functionality over the above:

          *  They may be traversed backwards.

          However:

          *  To traverse backwards, an entry to begin the traversal and the
             list in which it is contained must be specified.

      Doubly linked tail queues (TAILQ)
          Tail queues add the following functionality:

          *  Entries can be added at the end of a list.

          *  They may be traversed backwards, from tail to head.

          *  They may be concatenated.

          However:

          *  All list insertions and removals must specify the head of the
             list.

          *  Each head entry requires two pointers rather than one.

      Doubly linked circular queues (CIRCLEQ)
          Circular queues add the following functionality over the above:

          *  The first and last entries are connected.

          However:

          *  The termination condition for traversal is more complex.


-------------------------------------------------------------------

::

          Not in POSIX.1, POSIX.1-2001, or POSIX.1-2008.  Present on the
          BSDs.  <sys/queue.h> macros first appeared in 4.4BSD.


---------------------------------------------------

::

          Some BSDs provide SIMPLEQ instead of STAILQ.  They are identical,
          but for historical reasons they were named differently on
          different BSDs.  STAILQ originated on FreeBSD, and SIMPLEQ
          originated on NetBSD.  For compatibility reasons, some systems
          provide both sets of macros.  Glibc provides both STAILQ and
          SIMPLEQ, which are identical except for a missing SIMPLEQ
          equivalent to STAILQ_CONCAT().


---------------------------------------------------------

::

          circleq(3), insque(3), list(3), slist(3), stailq(3), tailq(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       QUEUE(7)

--------------

Pages that refer to this page: `circleq(3) <../man3/circleq.3.html>`__, 
`insque(3) <../man3/insque.3.html>`__, 
`list(3) <../man3/list.3.html>`__, 
`slist(3) <../man3/slist.3.html>`__, 
`stailq(3) <../man3/stailq.3.html>`__, 
`tailq(3) <../man3/tailq.3.html>`__

--------------

`Copyright and license for this manual
page <../man7/queue.7.license.html>`__

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
