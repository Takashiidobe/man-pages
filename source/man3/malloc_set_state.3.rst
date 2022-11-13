.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

malloc_get_state(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MALLOC_GET_STATE(3)     Linux Programmer's Manual    MALLOC_GET_STATE(3)

NAME
-------------------------------------------------

::

          malloc_get_state, malloc_set_state - record and restore state of
          malloc implementation


---------------------------------------------------------

::

          #include <malloc.h>

          void *malloc_get_state(void);
          int malloc_set_state(void *state);


---------------------------------------------------------------

::

          Note: these function are removed in glibc version 2.25.

          The malloc_get_state() function records the current state of all
          malloc(3) internal bookkeeping variables (but not the actual
          contents of the heap or the state of malloc_hook(3) functions
          pointers).  The state is recorded in a system-dependent opaque
          data structure dynamically allocated via malloc(3), and a pointer
          to that data structure is returned as the function result.  (It
          is the caller's responsibility to free(3) this memory.)

          The malloc_set_state() function restores the state of all
          malloc(3) internal bookkeeping variables to the values recorded
          in the opaque data structure pointed to by state.


-----------------------------------------------------------------

::

          On success, malloc_get_state() returns a pointer to a newly
          allocated opaque data structure.  On error (for example, memory
          could not be allocated for the data structure),
          malloc_get_state() returns NULL.

          On success, malloc_set_state() returns 0.  If the implementation
          detects that state does not point to a correctly formed data
          structure, malloc_set_state() returns -1.  If the implementation
          detects that the version of the data structure referred to by
          state is a more recent version than this implementation knows
          about, malloc_set_state() returns -2.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │malloc_get_state(),                   │ Thread safety │ MT-Safe │
          │malloc_set_state()                    │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          These functions are GNU extensions.


---------------------------------------------------

::

          These functions are useful when using this malloc(3)
          implementation as part of a shared library, and the heap contents
          are saved/restored via some other method.  This technique is used
          by GNU Emacs to implement its "dumping" function.

          Hook function pointers are never saved or restored by these
          functions, with two exceptions: if malloc checking (see
          mallopt(3)) was in use when malloc_get_state() was called, then
          malloc_set_state() resets malloc checking hooks if possible; if
          malloc checking was not in use in the recorded state, but the
          caller has requested malloc checking, then the hooks are reset to
          0.


---------------------------------------------------------

::

          malloc(3), mallopt(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22            MALLOC_GET_STATE(3)

--------------

Pages that refer to this page: `malloc(3) <../man3/malloc.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/malloc_get_state.3.license.html>`__

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
