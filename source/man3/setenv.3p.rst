.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setenv(3p) — Linux manual page
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

   SETENV(3P)              POSIX Programmer's Manual             SETENV(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          setenv — add or change environment variable


---------------------------------------------------------

::

          #include <stdlib.h>

          int setenv(const char *envname, const char *envval, int overwrite);


---------------------------------------------------------------

::

          The setenv() function shall update or add a variable in the
          environment of the calling process. The envname argument points
          to a string containing the name of an environment variable to be
          added or altered. The environment variable shall be set to the
          value to which envval points. The function shall fail if envname
          points to a string which contains an '=' character. If the
          environment variable named by envname already exists and the
          value of overwrite is non-zero, the function shall return success
          and the environment shall be updated. If the environment variable
          named by envname already exists and the value of overwrite is
          zero, the function shall return success and the environment shall
          remain unchanged.

          The setenv() function shall update the list of pointers to which
          environ points.

          The strings described by envname and envval are copied by this
          function.

          The setenv() function need not be thread-safe.


-----------------------------------------------------------------

::

          Upon successful completion, zero shall be returned. Otherwise, -1
          shall be returned, errno set to indicate the error, and the
          environment shall be unchanged.


-----------------------------------------------------

::

          The setenv() function shall fail if:

          EINVAL The envname argument points to an empty string or points
                 to a string containing an '=' character.

          ENOMEM Insufficient memory was available to add a variable or its
                 value to the environment.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          See exec() for restrictions on changing the environment in multi-
          threaded applications.


-----------------------------------------------------------

::

          Unanticipated results may occur if setenv() changes the external
          variable environ.  In particular, if the optional envp argument
          to main() is present, it is not changed, and thus may point to an
          obsolete copy of the environment (as may any other copy of
          environ).  However, other than the aforementioned restriction,
          the standard developers intended that the traditional method of
          walking through the environment by way of the environ pointer
          must be supported.

          It was decided that setenv() should be required by this version
          because it addresses a piece of missing functionality, and does
          not impose a significant burden on the implementor.

          There was considerable debate as to whether the System V putenv()
          function or the BSD setenv() function should be required as a
          mandatory function. The setenv() function was chosen because it
          permitted the implementation of the unsetenv() function to delete
          environmental variables, without specifying an additional
          interface. The putenv() function is available as part of the XSI
          option.

          The standard developers considered requiring that setenv()
          indicate an error when a call to it would result in exceeding
          {ARG_MAX}.  The requirement was rejected since the condition
          might be temporary, with the application eventually reducing the
          environment size. The ultimate success or failure depends on the
          size at the time of a call to exec, which returns an indication
          of this error condition.

          See also the RATIONALE section in getenv(3p).


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          exec(1p), getenv(3p), putenv(3p), unsetenv(3p)

          The Base Definitions volume of POSIX.1‐2017, stdlib.h(0p),
          sys_types.h(0p), unistd.h(0p)


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

   IEEE/The Open Group               2017                        SETENV(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`getenv(3p) <../man3/getenv.3p.html>`__, 
`putenv(3p) <../man3/putenv.3p.html>`__, 
`unsetenv(3p) <../man3/unsetenv.3p.html>`__

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
