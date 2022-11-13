.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

exit(3p) — Linux manual page
============================

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

   EXIT(3P)                POSIX Programmer's Manual               EXIT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          exit — terminate a process


---------------------------------------------------------

::

          #include <stdlib.h>

          void exit(int status);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The value of status may be 0, EXIT_SUCCESS, EXIT_FAILURE, or any
          other value, though only the least significant 8 bits (that is,
          status & 0377) shall be available from wait() and waitpid(); the
          full value shall be available from waitid() and in the siginfo_t
          passed to a signal handler for SIGCHLD.

          The exit() function shall first call all functions registered by
          atexit(), in the reverse order of their registration, except that
          a function is called after any previously registered functions
          that had already been called at the time it was registered. Each
          function is called as many times as it was registered. If, during
          the call to any such function, a call to the longjmp() function
          is made that would terminate the call to the registered function,
          the behavior is undefined.

          If a function registered by a call to atexit() fails to return,
          the remaining registered functions shall not be called and the
          rest of the exit() processing shall not be completed. If exit()
          is called more than once, the behavior is undefined.

          The exit() function shall then flush all open streams with
          unwritten buffered data and close all open streams. Finally, the
          process shall be terminated with the same consequences as
          described in Consequences of Process Termination.


-----------------------------------------------------------------

::

          The exit() function does not return.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          See _Exit().


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          _Exit(3p), atexit(3p), exec(1p), longjmp(3p), tmpfile(3p),
          wait(3p), waitid(3p)

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

   IEEE/The Open Group               2017                          EXIT(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`sh(1p) <../man1/sh.1p.html>`__, 
`abort(3p) <../man3/abort.3p.html>`__, 
`aio_error(3p) <../man3/aio_error.3p.html>`__, 
`aio_read(3p) <../man3/aio_read.3p.html>`__, 
`aio_return(3p) <../man3/aio_return.3p.html>`__, 
`aio_write(3p) <../man3/aio_write.3p.html>`__, 
`atexit(3p) <../man3/atexit.3p.html>`__, 
`close(3p) <../man3/close.3p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`\_Exit(3p) <../man3/_Exit.3p.html>`__, 
`flockfile(3p) <../man3/flockfile.3p.html>`__, 
`getrusage(3p) <../man3/getrusage.3p.html>`__, 
`lio_listio(3p) <../man3/lio_listio.3p.html>`__, 
`mlock(3p) <../man3/mlock.3p.html>`__, 
`mlockall(3p) <../man3/mlockall.3p.html>`__, 
`posix_spawn(3p) <../man3/posix_spawn.3p.html>`__, 
`pthread_exit(3p) <../man3/pthread_exit.3p.html>`__, 
`semop(3p) <../man3/semop.3p.html>`__, 
`shmat(3p) <../man3/shmat.3p.html>`__, 
`shmdt(3p) <../man3/shmdt.3p.html>`__, 
`wait(3p) <../man3/wait.3p.html>`__, 
`waitid(3p) <../man3/waitid.3p.html>`__

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
