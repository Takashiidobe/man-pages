.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setregid(3p) — Linux manual page
================================

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

   SETREGID(3P)            POSIX Programmer's Manual           SETREGID(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          setregid — set real and effective group IDs


---------------------------------------------------------

::

          #include <unistd.h>

          int setregid(gid_t rgid, gid_t egid);


---------------------------------------------------------------

::

          The setregid() function shall set the real and effective group
          IDs of the calling process.

          If rgid is -1, the real group ID shall not be changed; if egid is
          -1, the effective group ID shall not be changed.

          The real and effective group IDs may be set to different values
          in the same call.

          Only a process with appropriate privileges can set the real group
          ID and the effective group ID to any valid value.

          A non-privileged process can set either the real group ID to the
          saved set-group-ID from one of the exec family of functions, or
          the effective group ID to the saved set-group-ID or the real
          group ID.

          If the real group ID is being set (rgid is not -1), or the
          effective group ID is being set to a value not equal to the real
          group ID, then the saved set-group-ID of the current process
          shall be set equal to the new effective group ID.

          Any supplementary group IDs of the calling process remain
          unchanged.


-----------------------------------------------------------------

::

          Upon successful completion, 0 shall be returned. Otherwise, -1
          shall be returned and errno set to indicate the error, and
          neither of the group IDs are changed.


-----------------------------------------------------

::

          The setregid() function shall fail if:

          EINVAL The value of the rgid or egid argument is invalid or out-
                 of-range.

          EPERM  The process does not have appropriate privileges and a
                 change other than changing the real group ID to the saved
                 set-group-ID, or changing the effective group ID to the
                 real group ID or the saved set-group-ID, was requested.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          If a non-privileged set-group-ID process sets its effective group
          ID to its real group ID, it can only set its effective group ID
          back to the previous value if rgid was -1 in the setregid() call,
          since the saved-group-ID is not changed in that case. If rgid was
          equal to the real group ID in the setregid() call, then the saved
          set-group-ID will also have been changed to the real user ID.


-----------------------------------------------------------

::

          Earlier versions of this standard did not specify whether the
          saved set-group-ID was affected by setregid() calls. This version
          specifies common existing practice that constitutes an important
          security feature. The ability to set both the effective group ID
          and saved set-group-ID to be the same as the real group ID means
          that any security weakness in code that is executed after that
          point cannot result in malicious code being executed with the
          previous effective group ID. Privileged applications could
          already do this using just setgid(), but for non-privileged
          applications the only standard method available is to use this
          feature of setregid().


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          exec(1p), getegid(3p), geteuid(3p), getgid(3p), getuid(3p),
          setegid(3p), seteuid(3p), setgid(3p), setreuid(3p), setuid(3p)

          The Base Definitions volume of POSIX.1‐2017, unistd.h(0p)


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

   IEEE/The Open Group               2017                      SETREGID(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`getegid(3p) <../man3/getegid.3p.html>`__, 
`geteuid(3p) <../man3/geteuid.3p.html>`__, 
`getgid(3p) <../man3/getgid.3p.html>`__, 
`getuid(3p) <../man3/getuid.3p.html>`__, 
`setegid(3p) <../man3/setegid.3p.html>`__, 
`seteuid(3p) <../man3/seteuid.3p.html>`__, 
`setgid(3p) <../man3/setgid.3p.html>`__, 
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
