.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getc_unlocked(3p) — Linux manual page
=====================================

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

   GETC_UNLOCKED(3P)       POSIX Programmer's Manual      GETC_UNLOCKED(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          getc_unlocked, getchar_unlocked, putc_unlocked, putchar_unlocked
          — stdio with explicit client locking


---------------------------------------------------------

::

          #include <stdio.h>

          int getc_unlocked(FILE *stream);
          int getchar_unlocked(void);
          int putc_unlocked(int c, FILE *stream);
          int putchar_unlocked(int c);


---------------------------------------------------------------

::

          Versions of the functions getc(), getchar(), putc(), and
          putchar() respectively named getc_unlocked(), getchar_unlocked(),
          putc_unlocked(), and putchar_unlocked() shall be provided which
          are functionally equivalent to the original versions, with the
          exception that they are not required to be implemented in a fully
          thread-safe manner. They shall be thread-safe when used within a
          scope protected by flockfile() (or ftrylockfile()) and
          funlockfile().  These functions can safely be used in a multi-
          threaded program if and only if they are called while the
          invoking thread owns the (FILE *) object, as is the case after a
          successful call to the flockfile() or ftrylockfile() functions.

          If getc_unlocked() or putc_unlocked() are implemented as macros
          they may evaluate stream more than once, so the stream argument
          should never be an expression with side-effects.


-----------------------------------------------------------------

::

          See getc(3p), getchar(3p), putc(3p), and putchar(3p).


-----------------------------------------------------

::

          See getc(3p), getchar(3p), putc(3p), and putchar(3p).

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Since they may be implemented as macros, getc_unlocked() and
          putc_unlocked() may treat incorrectly a stream argument with
          side-effects. In particular, getc_unlocked(*f++) and
          putc_unlocked(c,*f++) do not necessarily work as expected.
          Therefore, use of these functions in such situations should be
          preceded by the following statement as appropriate:

              #undef getc_unlocked
              #undef putc_unlocked


-----------------------------------------------------------

::

          Some I/O functions are typically implemented as macros for
          performance reasons (for example, putc() and getc()).  For
          safety, they need to be synchronized, but it is often too
          expensive to synchronize on every character. Nevertheless, it was
          felt that the safety concerns were more important; consequently,
          the getc(), getchar(), putc(), and putchar() functions are
          required to be thread-safe. However, unlocked versions are also
          provided with names that clearly indicate the unsafe nature of
          their operation but can be used to exploit their higher
          performance.  These unlocked versions can be safely used only
          within explicitly locked program regions, using exported locking
          primitives. In particular, a sequence such as:

              flockfile(fileptr);
              putc_unlocked('1', fileptr);
              putc_unlocked('\n', fileptr);
              fprintf(fileptr, "Line 2\n");
              funlockfile(fileptr);

          is permissible, and results in the text sequence:

              1
              Line 2

          being printed without being interspersed with output from other
          threads.

          It would be wrong to have the standard names such as getc(),
          putc(), and so on, map to the ``faster, but unsafe'' rather than
          the ``slower, but safe'' versions. In either case, you would
          still want to inspect all uses of getc(), putc(), and so on, by
          hand when converting existing code. Choosing the safe bindings as
          the default, at least, results in correct code and maintains the
          ``atomicity at the function'' invariant. To do otherwise would
          introduce gratuitous synchronization errors into converted code.
          Other routines that modify the stdio (FILE *) structures or
          buffers are also safely synchronized.

          Note that there is no need for functions of the form
          getc_locked(), putc_locked(), and so on, since this is the
          functionality of getc(), putc(), et al.  It would be
          inappropriate to use a feature test macro to switch a macro
          definition of getc() between getc_locked() and getc_unlocked(),
          since the ISO C standard requires an actual function to exist, a
          function whose behavior could not be changed by the feature test
          macro. Also, providing both the xxx_locked() and xxx_unlocked()
          forms leads to the confusion of whether the suffix describes the
          behavior of the function or the circumstances under which it
          should be used.

          Three additional routines, flockfile(), ftrylockfile(), and
          funlockfile() (which may be macros), are provided to allow the
          user to delineate a sequence of I/O statements that are executed
          synchronously.

          The ungetc() function is infrequently called relative to the
          other functions/macros so no unlocked variation is needed.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.5, Standard I/O Streams, flockfile(3p), getc(3p),
          getchar(3p), putc(3p), putchar(3p)

          The Base Definitions volume of POSIX.1‐2017, stdio.h(0p)


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

   IEEE/The Open Group               2017                 GETC_UNLOCKED(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`flockfile(3p) <../man3/flockfile.3p.html>`__, 
`getchar_unlocked(3p) <../man3/getchar_unlocked.3p.html>`__, 
`putchar_unlocked(3p) <../man3/putchar_unlocked.3p.html>`__, 
`putc_unlocked(3p) <../man3/putc_unlocked.3p.html>`__

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
