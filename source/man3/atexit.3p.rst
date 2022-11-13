.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

atexit(3p) — Linux manual page
==============================

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

   ATEXIT(3P)              POSIX Programmer's Manual             ATEXIT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          atexit — register a function to run at process termination


---------------------------------------------------------

::

          #include <stdlib.h>

          int atexit(void (*func)(void));


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The atexit() function shall register the function pointed to by
          func, to be called without arguments at normal program
          termination. At normal program termination, all functions
          registered by the atexit() function shall be called, in the
          reverse order of their registration, except that a function is
          called after any previously registered functions that had already
          been called at the time it was registered.  Normal termination
          occurs either by a call to exit() or a return from main().

          At least 32 functions can be registered with atexit().

          After a successful call to any of the exec functions, any
          functions previously registered by atexit() shall no longer be
          registered.


-----------------------------------------------------------------

::

          Upon successful completion, atexit() shall return 0; otherwise,
          it shall return a non-zero value.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The functions registered by a call to atexit() must return to
          ensure that all registered functions are called.

          The application should call sysconf() to obtain the value of
          {ATEXIT_MAX}, the number of functions that can be registered.
          There is no way for an application to tell how many functions
          have already been registered with atexit().

          Since the behavior is undefined if the exit() function is called
          more than once, portable applications calling atexit() must
          ensure that the exit() function is not called at normal process
          termination when all functions registered by the atexit()
          function are called.

          All functions registered by the atexit() function are called at
          normal process termination, which occurs by a call to the exit()
          function or a return from main() or on the last thread
          termination, when the behavior is as if the implementation called
          exit() with a zero argument at thread termination time.

          If, at normal process termination, a function registered by the
          atexit() function is called and a portable application needs to
          stop further exit() processing, it must call the _exit() function
          or the _Exit() function or one of the functions which cause
          abnormal process termination.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          exec(1p), exit(3p), sysconf(3p)

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

   IEEE/The Open Group               2017                        ATEXIT(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`exit(3p) <../man3/exit.3p.html>`__, 
`\_Exit(3p) <../man3/_Exit.3p.html>`__, 
`fclose(3p) <../man3/fclose.3p.html>`__, 
`pthread_atfork(3p) <../man3/pthread_atfork.3p.html>`__

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
