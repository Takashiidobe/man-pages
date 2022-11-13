.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

confstr(3p) — Linux manual page
===============================

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

   CONFSTR(3P)             POSIX Programmer's Manual            CONFSTR(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          confstr — get configurable variables


---------------------------------------------------------

::

          #include <unistd.h>

          size_t confstr(int name, char *buf, size_t len);


---------------------------------------------------------------

::

          The confstr() function shall return configuration-defined string
          values. Its use and purpose are similar to sysconf(), but it is
          used where string values rather than numeric values are returned.

          The name argument represents the system variable to be queried.
          The implementation shall support the following name values,
          defined in <unistd.h>.  It may support others:

          _CS_PATH
          _CS_POSIX_V7_ILP32_OFF32_CFLAGS
          _CS_POSIX_V7_ILP32_OFF32_LDFLAGS
          _CS_POSIX_V7_ILP32_OFF32_LIBS
          _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS
          _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS
          _CS_POSIX_V7_ILP32_OFFBIG_LIBS
          _CS_POSIX_V7_LP64_OFF64_CFLAGS
          _CS_POSIX_V7_LP64_OFF64_LDFLAGS
          _CS_POSIX_V7_LP64_OFF64_LIBS
          _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS
          _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS
          _CS_POSIX_V7_LPBIG_OFFBIG_LIBS
          _CS_POSIX_V7_THREADS_CFLAGS
          _CS_POSIX_V7_THREADS_LDFLAGS
          _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS
          _CS_V7_ENV
          _CS_POSIX_V6_ILP32_OFF32_CFLAGS
          _CS_POSIX_V6_ILP32_OFF32_LDFLAGS
          _CS_POSIX_V6_ILP32_OFF32_LIBS
          _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS
          _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS
          _CS_POSIX_V6_ILP32_OFFBIG_LIBS
          _CS_POSIX_V6_LP64_OFF64_CFLAGS
          _CS_POSIX_V6_LP64_OFF64_LDFLAGS
          _CS_POSIX_V6_LP64_OFF64_LIBS
          _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS
          _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS
          _CS_POSIX_V6_LPBIG_OFFBIG_LIBS
          _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS
          _CS_V6_ENV

          If len is not 0, and if name has a configuration-defined value,
          confstr() shall copy that value into the len-byte buffer pointed
          to by buf.  If the string to be returned is longer than len
          bytes, including the terminating null, then confstr() shall
          truncate the string to len-1 bytes and null-terminate the result.
          The application can detect that the string was truncated by
          comparing the value returned by confstr() with len.

          If len is 0 and buf is a null pointer, then confstr() shall still
          return the integer value as defined below, but shall not return a
          string. If len is 0 but buf is not a null pointer, the result is
          unspecified.

          After a call to:

              confstr(_CS_V7_ENV, buf, sizeof(buf))

          the string stored in buf shall contain a <space>-separated list
          of the variable=value environment variable pairs an
          implementation requires as part of specifying a conforming
          environment, as described in the implementations' conformance
          documentation.

          If the implementation supports the POSIX shell option, the string
          stored in buf after a call to:

              confstr(_CS_PATH, buf, sizeof(buf))

          can be used as a value of the PATH environment variable that
          accesses all of the standard utilities of POSIX.1‐2008, that are
          provided in a manner accessible via the exec family of functions,
          if the return value is less than or equal to sizeof(buf).


-----------------------------------------------------------------

::

          If name has a configuration-defined value, confstr() shall return
          the size of buffer that would be needed to hold the entire
          configuration-defined value including the terminating null. If
          this return value is greater than len, the string returned in buf
          is truncated.

          If name is invalid, confstr() shall return 0 and set errno to
          indicate the error.

          If name does not have a configuration-defined value, confstr()
          shall return 0 and leave errno unchanged.


-----------------------------------------------------

::

          The confstr() function shall fail if:

          EINVAL The value of the name argument is invalid.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          An application can distinguish between an invalid name parameter
          value and one that corresponds to a configurable variable that
          has no configuration-defined value by checking if errno is
          modified. This mirrors the behavior of sysconf().

          The original need for this function was to provide a way of
          finding the configuration-defined default value for the
          environment variable PATH.  Since PATH can be modified by the
          user to include directories that could contain utilities
          replacing the standard utilities in the Shell and Utilities
          volume of POSIX.1‐2017, applications need a way to determine the
          system-supplied PATH environment variable value that contains the
          correct search path for the standard utilities.

          An application could use:

              confstr(name, (char *)NULL, (size_t)0)

          to find out how big a buffer is needed for the string value; use
          malloc() to allocate a buffer to hold the string; and call
          confstr() again to get the string. Alternately, it could allocate
          a fixed, static buffer that is big enough to hold most answers
          (perhaps 512 or 1024 bytes), but then use malloc() to allocate a
          larger buffer if it finds that this is too small.


-----------------------------------------------------------

::

          Application developers can normally determine any configuration
          variable by means of reading from the stream opened by a call to:

              popen("command -p getconf variable", "r");

          The confstr() function with a name argument of _CS_PATH returns a
          string that can be used as a PATH environment variable setting
          that will reference the standard shell and utilities as described
          in the Shell and Utilities volume of POSIX.1‐2017.

          The confstr() function copies the returned string into a buffer
          supplied by the application instead of returning a pointer to a
          string. This allows a cleaner function in some implementations
          (such as those with lightweight threads) and resolves questions
          about when the application must copy the string returned.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          exec(1p), fpathconf(3p), sysconf(3p)

          The Base Definitions volume of POSIX.1‐2017, unistd.h(0p)

          The Shell and Utilities volume of POSIX.1‐2017, c99(1p)


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

   IEEE/The Open Group               2017                       CONFSTR(3P)

--------------

Pages that refer to this page: `poll.h(0p) <../man0/poll.h.0p.html>`__, 
`stddef.h(0p) <../man0/stddef.h.0p.html>`__, 
`sys_types.h(0p) <../man0/sys_types.h.0p.html>`__, 
`termios.h(0p) <../man0/termios.h.0p.html>`__, 
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`getconf(1p) <../man1/getconf.1p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`fpathconf(3p) <../man3/fpathconf.3p.html>`__, 
`sysconf(3p) <../man3/sysconf.3p.html>`__

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
