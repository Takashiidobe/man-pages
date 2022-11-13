.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

putenv(3p) — Linux manual page
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

   PUTENV(3P)              POSIX Programmer's Manual             PUTENV(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          putenv — change or add a value to an environment


---------------------------------------------------------

::

          #include <stdlib.h>

          int putenv(char *string);


---------------------------------------------------------------

::

          The putenv() function shall use the string argument to set
          environment variable values. The string argument should point to
          a string of the form "name=value".  The putenv() function shall
          make the value of the environment variable name equal to value by
          altering an existing variable or creating a new one. In either
          case, the string pointed to by string shall become part of the
          environment, so altering the string shall change the environment.

          The putenv() function need not be thread-safe.


-----------------------------------------------------------------

::

          Upon successful completion, putenv() shall return 0; otherwise,
          it shall return a non-zero value and set errno to indicate the
          error.


-----------------------------------------------------

::

          The putenv() function may fail if:

          ENOMEM Insufficient memory was available.

          The following sections are informative.


---------------------------------------------------------

::

      Changing the Value of an Environment Variable
          The following example changes the value of the HOME environment
          variable to the value /usr/home.

              #include <stdlib.h>
              ...
              static char *var = "HOME=/usr/home";
              int ret;

              ret = putenv(var);


---------------------------------------------------------------------------

::

          The putenv() function manipulates the environment pointed to by
          environ, and can be used in conjunction with getenv().

          See exec() for restrictions on changing the environment in multi-
          threaded applications.

          This routine may use malloc() to enlarge the environment.

          A potential error is to call putenv() with an automatic variable
          as the argument, then return from the calling function while
          string is still part of the environment.

          Although the space used by string is no longer used once a new
          string which defines name is passed to putenv(), if any thread in
          the application has used getenv() to retrieve a pointer to this
          variable, it should not be freed by calling free().  If the
          changed environment variable is one known by the system (such as
          the locale environment variables) the application should never
          free the buffer used by earlier calls to putenv() for the same
          variable.

          The setenv() function is preferred over this function. One reason
          is that putenv() is optional and therefore less portable. Another
          is that using putenv() can slow down environment searches, as
          explained in the RATIONALE section for getenv(3p).


-----------------------------------------------------------

::

          Refer to the RATIONALE section in setenv(3p).


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          exec(1p), free(3p), getenv(3p), malloc(3p), setenv(3p)

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

   IEEE/The Open Group               2017                        PUTENV(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`getenv(3p) <../man3/getenv.3p.html>`__, 
`setenv(3p) <../man3/setenv.3p.html>`__

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
