.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

atexit(3) — Linux manual page
=============================

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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ATEXIT(3)               Linux Programmer's Manual              ATEXIT(3)

NAME
-------------------------------------------------

::

          atexit - register a function to be called at normal process
          termination


---------------------------------------------------------

::

          #include <stdlib.h>

          int atexit(void (*function)(void));


---------------------------------------------------------------

::

          The atexit() function registers the given function to be called
          at normal process termination, either via exit(3) or via return
          from the program's main().  Functions so registered are called in
          the reverse order of their registration; no arguments are passed.

          The same function may be registered multiple times: it is called
          once for each registration.

          POSIX.1 requires that an implementation allow at least ATEXIT_MAX
          (32) such functions to be registered.  The actual limit supported
          by an implementation can be obtained using sysconf(3).

          When a child process is created via fork(2), it inherits copies
          of its parent's registrations.  Upon a successful call to one of
          the exec(3) functions, all registrations are removed.


-----------------------------------------------------------------

::

          The atexit() function returns the value 0 if successful;
          otherwise it returns a nonzero value.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │atexit()                              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.


---------------------------------------------------

::

          Functions registered using atexit() (and on_exit(3)) are not
          called if a process terminates abnormally because of the delivery
          of a signal.

          If one of the registered functions calls _exit(2), then any
          remaining functions are not invoked, and the other process
          termination steps performed by exit(3) are not performed.

          POSIX.1 says that the result of calling exit(3) more than once
          (i.e., calling exit(3) within a function registered using
          atexit()) is undefined.  On some systems (but not Linux), this
          can result in an infinite recursion; portable programs should not
          invoke exit(3) inside a function registered using atexit().

          The atexit() and on_exit(3) functions register functions on the
          same list: at normal process termination, the registered
          functions are invoked in reverse order of their registration by
          these two functions.

          According to POSIX.1, the result is undefined if longjmp(3) is
          used to terminate execution of one of the functions registered
          using atexit().

      Linux notes
          Since glibc 2.2.3, atexit() (and on_exit(3)) can be used within a
          shared library to establish functions that are called when the
          shared library is unloaded.


---------------------------------------------------------

::

          #include <stdio.h>
          #include <stdlib.h>
          #include <unistd.h>

          void
          bye(void)
          {
              printf("That was all, folks\n");
          }

          int
          main(void)
          {
              long a;
              int i;

              a = sysconf(_SC_ATEXIT_MAX);
              printf("ATEXIT_MAX = %ld\n", a);

              i = atexit(bye);
              if (i != 0) {
                  fprintf(stderr, "cannot set exit function\n");
                  exit(EXIT_FAILURE);
              }

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          _exit(2), dlopen(3), exit(3), on_exit(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      ATEXIT(3)

--------------

Pages that refer to this page: `execve(2) <../man2/execve.2.html>`__, 
`\_exit(2) <../man2/_exit.2.html>`__, 
`dlopen(3) <../man3/dlopen.3.html>`__, 
`exit(3) <../man3/exit.3.html>`__, 
`on_exit(3) <../man3/on_exit.3.html>`__, 
`pmdaopenlog(3) <../man3/pmdaopenlog.3.html>`__, 
`pmfault(3) <../man3/pmfault.3.html>`__, 
`pmopenlog(3) <../man3/pmopenlog.3.html>`__, 
`pthread_atfork(3) <../man3/pthread_atfork.3.html>`__, 
`pthread_exit(3) <../man3/pthread_exit.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/atexit.3.license.html>`__

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
