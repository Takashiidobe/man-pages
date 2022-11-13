.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

set_tid_address(2) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SET_TID_ADDRESS(2)      Linux Programmer's Manual     SET_TID_ADDRESS(2)

NAME
-------------------------------------------------

::

          set_tid_address - set pointer to thread ID


---------------------------------------------------------

::

          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          pid_t syscall(SYS_set_tid_address, int *tidptr);

          Note: glibc provides no wrapper for set_tid_address(),
          necessitating the use of syscall(2).


---------------------------------------------------------------

::

          For each thread, the kernel maintains two attributes (addresses)
          called set_child_tid and clear_child_tid.  These two attributes
          contain the value NULL by default.

          set_child_tid
                 If a thread is started using clone(2) with the
                 CLONE_CHILD_SETTID flag, set_child_tid is set to the value
                 passed in the ctid argument of that system call.

                 When set_child_tid is set, the very first thing the new
                 thread does is to write its thread ID at this address.

          clear_child_tid
                 If a thread is started using clone(2) with the
                 CLONE_CHILD_CLEARTID flag, clear_child_tid is set to the
                 value passed in the ctid argument of that system call.

          The system call set_tid_address() sets the clear_child_tid value
          for the calling thread to tidptr.

          When a thread whose clear_child_tid is not NULL terminates, then,
          if the thread is sharing memory with other threads, then 0 is
          written at the address specified in clear_child_tid and the
          kernel performs the following operation:

              futex(clear_child_tid, FUTEX_WAKE, 1, NULL, NULL, 0);

          The effect of this operation is to wake a single thread that is
          performing a futex wait on the memory location.  Errors from the
          futex wake operation are ignored.


-----------------------------------------------------------------

::

          set_tid_address() always returns the caller's thread ID.


-----------------------------------------------------

::

          set_tid_address() always succeeds.


---------------------------------------------------------

::

          This call is present since Linux 2.5.48.  Details as given here
          are valid since Linux 2.5.49.


-------------------------------------------------------------------

::

          This system call is Linux-specific.


---------------------------------------------------------

::

          clone(2), futex(2), gettid(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-06-20             SET_TID_ADDRESS(2)

--------------

Pages that refer to this page: `clone(2) <../man2/clone.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`futex(7) <../man7/futex.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/set_tid_address.2.license.html>`__

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
