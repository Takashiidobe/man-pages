.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

abort(3) — Linux manual page
============================

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

   ABORT(3)                Linux Programmer's Manual               ABORT(3)

NAME
-------------------------------------------------

::

          abort - cause abnormal process termination


---------------------------------------------------------

::

          #include <stdlib.h>

          noreturn void abort(void);


---------------------------------------------------------------

::

          The abort() function first unblocks the SIGABRT signal, and then
          raises that signal for the calling process (as though raise(3)
          was called).  This results in the abnormal termination of the
          process unless the SIGABRT signal is caught and the signal
          handler does not return (see longjmp(3)).

          If the SIGABRT signal is ignored, or caught by a handler that
          returns, the abort() function will still terminate the process.
          It does this by restoring the default disposition for SIGABRT and
          then raising the signal for a second time.


-----------------------------------------------------------------

::

          The abort() function never returns.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │abort()                               │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          SVr4, POSIX.1-2001, POSIX.1-2008, 4.3BSD, C89, C99.


---------------------------------------------------

::

          Up until glibc 2.26, if the abort() function caused process
          termination, all open streams were closed and flushed (as with
          fclose(3)).  However, in some cases this could result in
          deadlocks and data corruption.  Therefore, starting with glibc
          2.27, abort() terminates the process without flushing streams.
          POSIX.1 permits either possible behavior, saying that abort()
          "may include an attempt to effect fclose() on all open streams".


---------------------------------------------------------

::

          gdb(1), sigaction(2), assert(3), exit(3), longjmp(3), raise(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       ABORT(3)

--------------

Pages that refer to this page: `assert(3) <../man3/assert.3.html>`__, 
`assert_perror(3) <../man3/assert_perror.3.html>`__, 
`mallopt(3) <../man3/mallopt.3.html>`__, 
`mcheck(3) <../man3/mcheck.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/abort.3.license.html>`__

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
