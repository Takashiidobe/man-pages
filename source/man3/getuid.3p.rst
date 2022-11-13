.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getuid(3p) — Linux manual page
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

   GETUID(3P)              POSIX Programmer's Manual             GETUID(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          getuid — get a real user ID


---------------------------------------------------------

::

          #include <unistd.h>

          uid_t getuid(void);


---------------------------------------------------------------

::

          The getuid() function shall return the real user ID of the
          calling process.  The getuid() function shall not modify errno.


-----------------------------------------------------------------

::

          The getuid() function shall always be successful and no return
          value is reserved to indicate the error.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

      Setting the Effective User ID to the Real User ID
          The following example sets the effective user ID of the calling
          process to the real user ID.

              #include <unistd.h>
              ...
              seteuid(getuid());


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          In a conforming environment, getuid() will always succeed. It is
          possible for implementations to provide an extension where a
          process in a non-conforming environment will not be associated
          with a user or group ID. It is recommended that such
          implementations return (uid_t)-1 and set errno to indicate such
          an environment; doing so does not violate this standard, since
          such an environment is already an extension.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          getegid(3p), geteuid(3p), getgid(3p), setegid(3p), seteuid(3p),
          setgid(3p), setregid(3p), setreuid(3p), setuid(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_types.h(0p),
          unistd.h(0p)


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

   IEEE/The Open Group               2017                        GETUID(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`id(1p) <../man1/id.1p.html>`__, 
`getegid(3p) <../man3/getegid.3p.html>`__, 
`geteuid(3p) <../man3/geteuid.3p.html>`__, 
`getgid(3p) <../man3/getgid.3p.html>`__, 
`getlogin(3p) <../man3/getlogin.3p.html>`__, 
`getpwuid(3p) <../man3/getpwuid.3p.html>`__, 
`setegid(3p) <../man3/setegid.3p.html>`__, 
`seteuid(3p) <../man3/seteuid.3p.html>`__, 
`setgid(3p) <../man3/setgid.3p.html>`__, 
`setregid(3p) <../man3/setregid.3p.html>`__, 
`setreuid(3p) <../man3/setreuid.3p.html>`__, 
`setuid(3p) <../man3/setuid.3p.html>`__

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
