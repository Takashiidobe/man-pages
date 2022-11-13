.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

futex(7) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FUTEX(7)                Linux Programmer's Manual               FUTEX(7)

NAME
-------------------------------------------------

::

          futex - fast user-space locking


---------------------------------------------------------

::

          #include <linux/futex.h>


---------------------------------------------------------------

::

          The Linux kernel provides futexes ("Fast user-space mutexes") as
          a building block for fast user-space locking and semaphores.
          Futexes are very basic and lend themselves well for building
          higher-level locking abstractions such as mutexes, condition
          variables, read-write locks, barriers, and semaphores.

          Most programmers will in fact not be using futexes directly but
          will instead rely on system libraries built on them, such as the
          Native POSIX Thread Library (NPTL) (see pthreads(7)).

          A futex is identified by a piece of memory which can be shared
          between processes or threads.  In these different processes, the
          futex need not have identical addresses.  In its bare form, a
          futex has semaphore semantics; it is a counter that can be
          incremented and decremented atomically; processes can wait for
          the value to become positive.

          Futex operation occurs entirely in user space for the
          noncontended case.  The kernel is involved only to arbitrate the
          contended case.  As any sane design will strive for
          noncontention, futexes are also optimized for this situation.

          In its bare form, a futex is an aligned integer which is touched
          only by atomic assembler instructions.  This integer is four
          bytes long on all platforms.  Processes can share this integer
          using mmap(2), via shared memory segments, or because they share
          memory space, in which case the application is commonly called
          multithreaded.

      Semantics
          Any futex operation starts in user space, but it may be necessary
          to communicate with the kernel using the futex(2) system call.

          To "up" a futex, execute the proper assembler instructions that
          will cause the host CPU to atomically increment the integer.
          Afterward, check if it has in fact changed from 0 to 1, in which
          case there were no waiters and the operation is done.  This is
          the noncontended case which is fast and should be common.

          In the contended case, the atomic increment changed the counter
          from -1  (or some other negative number).  If this is detected,
          there are waiters.  User space should now set the counter to 1
          and instruct the kernel to wake up any waiters using the
          FUTEX_WAKE operation.

          Waiting on a futex, to "down" it, is the reverse operation.
          Atomically decrement the counter and check if it changed to 0, in
          which case the operation is done and the futex was uncontended.
          In all other circumstances, the process should set the counter to
          -1 and request that the kernel wait for another process to up the
          futex.  This is done using the FUTEX_WAIT operation.

          The futex(2) system call can optionally be passed a timeout
          specifying how long the kernel should wait for the futex to be
          upped.  In this case, semantics are more complex and the
          programmer is referred to futex(2) for more details.  The same
          holds for asynchronous futex waiting.


---------------------------------------------------------

::

          Initial futex support was merged in Linux 2.5.7 but with
          different semantics from those described above.  Current
          semantics are available from Linux 2.5.40 onward.


---------------------------------------------------

::

          To reiterate, bare futexes are not intended as an easy-to-use
          abstraction for end users.  Implementors are expected to be
          assembly literate and to have read the sources of the futex user-
          space library referenced below.

          This man page illustrates the most common use of the futex(2)
          primitives; it is by no means the only one.


---------------------------------------------------------

::

          clone(2), futex(2), get_robust_list(2), set_robust_list(2),
          set_tid_address(2), pthreads(7)

          Fuss, Futexes and Furwocks: Fast Userlevel Locking in Linux
          (proceedings of the Ottawa Linux Symposium 2002), futex example
          library, futex-*.tar.bz2 
          ⟨ftp://ftp.kernel.org/pub/linux/kernel/people/rusty/⟩.

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2017-09-15                       FUTEX(7)

--------------

Pages that refer to this page: `futex(2) <../man2/futex.2.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/futex.7.license.html>`__

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
