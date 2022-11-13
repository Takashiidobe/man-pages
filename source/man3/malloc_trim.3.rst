.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

malloc_trim(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MALLOC_TRIM(3)          Linux Programmer's Manual         MALLOC_TRIM(3)

NAME
-------------------------------------------------

::

          malloc_trim - release free memory from the heap


---------------------------------------------------------

::

          #include <malloc.h>

          int malloc_trim(size_t pad);


---------------------------------------------------------------

::

          The malloc_trim() function attempts to release free memory from
          the heap (by calling sbrk(2) or madvise(2) with suitable
          arguments).

          The pad argument specifies the amount of free space to leave
          untrimmed at the top of the heap.  If this argument is 0, only
          the minimum amount of memory is maintained at the top of the heap
          (i.e., one page or less).  A nonzero argument can be used to
          maintain some trailing space at the top of the heap in order to
          allow future allocations to be made without having to extend the
          heap with sbrk(2).


-----------------------------------------------------------------

::

          The malloc_trim() function returns 1 if memory was actually
          released back to the system, or 0 if it was not possible to
          release any memory.


-----------------------------------------------------

::

          No errors are defined.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │malloc_trim()                         │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          This function is a GNU extension.


---------------------------------------------------

::

          Only the main heap (using sbrk(2)) honors the pad argument;
          thread heaps do not.

          Since glibc 2.8 this function frees memory in all arenas and in
          all chunks with whole free pages.

          Before glibc 2.8 this function only freed memory at the top of
          the heap in the main arena.


---------------------------------------------------------

::

          sbrk(2), malloc(3), mallopt(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                 MALLOC_TRIM(3)

--------------

Pages that refer to this page:
`mallinfo(3) <../man3/mallinfo.3.html>`__, 
`malloc(3) <../man3/malloc.3.html>`__, 
`mallopt(3) <../man3/mallopt.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/malloc_trim.3.license.html>`__

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
