.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

exit(3) — Linux manual page
===========================

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

   EXIT(3)                 Linux Programmer's Manual                EXIT(3)

NAME
-------------------------------------------------

::

          exit - cause normal process termination


---------------------------------------------------------

::

          #include <stdlib.h>

          noreturn void exit(int status);


---------------------------------------------------------------

::

          The exit() function causes normal process termination and the
          least significant byte of status (i.e., status & 0xFF) is
          returned to the parent (see wait(2)).

          All functions registered with atexit(3) and on_exit(3) are
          called, in the reverse order of their registration.  (It is
          possible for one of these functions to use atexit(3) or
          on_exit(3) to register an additional function to be executed
          during exit processing; the new registration is added to the
          front of the list of functions that remain to be called.)  If one
          of these functions does not return (e.g., it calls _exit(2), or
          kills itself with a signal), then none of the remaining functions
          is called, and further exit processing (in particular, flushing
          of stdio(3) streams) is abandoned.  If a function has been
          registered multiple times using atexit(3) or on_exit(3), then it
          is called as many times as it was registered.

          All open stdio(3) streams are flushed and closed.  Files created
          by tmpfile(3) are removed.

          The C standard specifies two constants, EXIT_SUCCESS and
          EXIT_FAILURE, that may be passed to exit() to indicate successful
          or unsuccessful termination, respectively.


-----------------------------------------------------------------

::

          The exit() function does not return.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────┬───────────────┬─────────────────────┐
          │Interface                 │ Attribute     │ Value               │
          ├──────────────────────────┼───────────────┼─────────────────────┤
          │exit()                    │ Thread safety │ MT-Unsafe race:exit │
          └──────────────────────────┴───────────────┴─────────────────────┘

          The exit() function uses a global variable that is not protected,
          so it is not thread-safe.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.


---------------------------------------------------

::

          The behavior is undefined if one of the functions registered
          using atexit(3) and on_exit(3) calls either exit() or longjmp(3).
          Note that a call to execve(2) removes registrations created using
          atexit(3) and on_exit(3).

          The use of EXIT_SUCCESS and EXIT_FAILURE is slightly more
          portable (to non-UNIX environments) than the use of 0 and some
          nonzero value like 1 or -1.  In particular, VMS uses a different
          convention.

          BSD has attempted to standardize exit codes (which some C
          libraries such as the GNU C library have also adopted); see the
          file <sysexits.h>.

          After exit(), the exit status must be transmitted to the parent
          process.  There are three cases:

          •  If the parent has set SA_NOCLDWAIT, or has set the SIGCHLD
             handler to SIG_IGN, the status is discarded and the child dies
             immediately.

          •  If the parent was waiting on the child, it is notified of the
             exit status and the child dies immediately.

          •  Otherwise, the child becomes a "zombie" process: most of the
             process resources are recycled, but a slot containing minimal
             information about the child process (termination status,
             resource usage statistics) is retained in process table.  This
             allows the parent to subsequently use waitpid(2) (or similar)
             to learn the termination status of the child; at that point
             the zombie process slot is released.

          If the implementation supports the SIGCHLD signal, this signal is
          sent to the parent.  If the parent has set SA_NOCLDWAIT, it is
          undefined whether a SIGCHLD signal is sent.

      Signals sent to other processes
          If the exiting process is a session leader and its controlling
          terminal is the controlling terminal of the session, then each
          process in the foreground process group of this controlling
          terminal is sent a SIGHUP signal, and the terminal is
          disassociated from this session, allowing it to be acquired by a
          new controlling process.

          If the exit of the process causes a process group to become
          orphaned, and if any member of the newly orphaned process group
          is stopped, then a SIGHUP signal followed by a SIGCONT signal
          will be sent to each process in this process group.  See
          setpgid(2) for an explanation of orphaned process groups.

          Except in the above cases, where the signalled processes may be
          children of the terminating process, termination of a process
          does not in general cause a signal to be sent to children of that
          process.  However, a process can use the prctl(2)
          PR_SET_PDEATHSIG operation to arrange that it receives a signal
          if its parent terminates.


---------------------------------------------------------

::

          _exit(2), get_robust_list(2), setpgid(2), wait(2), atexit(3),
          on_exit(3), tmpfile(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        EXIT(3)

--------------

Pages that refer to this page: `man(1) <../man1/man.1.html>`__, 
`\_exit(2) <../man2/_exit.2.html>`__, 
`kill(2) <../man2/kill.2.html>`__, 
`vfork(2) <../man2/vfork.2.html>`__, 
`wait(2) <../man2/wait.2.html>`__, 
`abort(3) <../man3/abort.3.html>`__, 
`assert(3) <../man3/assert.3.html>`__, 
`assert_perror(3) <../man3/assert_perror.3.html>`__, 
`atexit(3) <../man3/atexit.3.html>`__, 
`err(3) <../man3/err.3.html>`__,  `error(3) <../man3/error.3.html>`__, 
`on_exit(3) <../man3/on_exit.3.html>`__, 
`pthread_create(3) <../man3/pthread_create.3.html>`__, 
`pthread_detach(3) <../man3/pthread_detach.3.html>`__, 
`pthread_exit(3) <../man3/pthread_exit.3.html>`__, 
`sd_bus_set_exit_on_disconnect(3) <../man3/sd_bus_set_exit_on_disconnect.3.html>`__, 
`setjmp(3) <../man3/setjmp.3.html>`__, 
`stdin(3) <../man3/stdin.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`tmpfile(3) <../man3/tmpfile.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/exit.3.license.html>`__

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
