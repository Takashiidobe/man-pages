.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setuid(3p) — Linux manual page
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

   SETUID(3P)              POSIX Programmer's Manual             SETUID(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          setuid — set user ID


---------------------------------------------------------

::

          #include <unistd.h>

          int setuid(uid_t uid);


---------------------------------------------------------------

::

          If the process has appropriate privileges, setuid() shall set the
          real user ID, effective user ID, and the saved set-user-ID of the
          calling process to uid.

          If the process does not have appropriate privileges, but uid is
          equal to the real user ID or the saved set-user-ID, setuid()
          shall set the effective user ID to uid; the real user ID and
          saved set-user-ID shall remain unchanged.

          The setuid() function shall not affect the supplementary group
          list in any way.


-----------------------------------------------------------------

::

          Upon successful completion, 0 shall be returned. Otherwise, -1
          shall be returned and errno set to indicate the error.


-----------------------------------------------------

::

          The setuid() function shall fail, return -1, and set errno to the
          corresponding value if one or more of the following are true:

          EINVAL The value of the uid argument is invalid and not supported
                 by the implementation.

          EPERM  The process does not have appropriate privileges and uid
                 does not match the real user ID or the saved set-user-ID.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The various behaviors of the setuid() and setgid() functions when
          called by non-privileged processes reflect the behavior of
          different historical implementations. For portability, it is
          recommended that new non-privileged applications use the
          seteuid() and setegid() functions instead.

          The saved set-user-ID capability allows a program to regain the
          effective user ID established at the last exec call. Similarly,
          the saved set-group-ID capability allows a program to regain the
          effective group ID established at the last exec call. These
          capabilities are derived from System V. Without them, a program
          might have to run as superuser in order to perform the same
          functions, because superuser can write on the user's files. This
          is a problem because such a program can write on any user's
          files, and so must be carefully written to emulate the
          permissions of the calling process properly. In System V, these
          capabilities have traditionally been implemented only via the
          setuid() and setgid() functions for non-privileged processes. The
          fact that the behavior of those functions was different for
          privileged processes made them difficult to use. The POSIX.1‐1990
          standard defined the setuid() function to behave differently for
          privileged and unprivileged users.  When the caller had
          appropriate privileges, the function set the real user ID,
          effective user ID, and saved set-user ID of the calling process
          on implementations that supported it. When the caller did not
          have appropriate privileges, the function set only the effective
          user ID, subject to permission checks. The former use is
          generally needed for utilities like login and su, which are not
          conforming applications and thus outside the scope of
          POSIX.1‐2008. These utilities wish to change the user ID
          irrevocably to a new value, generally that of an unprivileged
          user. The latter use is needed for conforming applications that
          are installed with the set-user-ID bit and need to perform
          operations using the real user ID.

          POSIX.1‐2008 augments the latter functionality with a mandatory
          feature named _POSIX_SAVED_IDS. This feature permits a set-user-
          ID application to switch its effective user ID back and forth
          between the values of its exec-time real user ID and effective
          user ID. Unfortunately, the POSIX.1‐1990 standard did not permit
          a conforming application using this feature to work properly when
          it happened to be executed with (implementation-defined)
          appropriate privileges. Furthermore, the application did not even
          have a means to tell whether it had this privilege. Since the
          saved set-user-ID feature is quite desirable for applications, as
          evidenced by the fact that NIST required it in FIPS 151‐2, it has
          been mandated by POSIX.1‐2008. However, there are implementors
          who have been reluctant to support it given the limitation
          described above.

          The 4.3BSD system handles the problem by supporting separate
          functions: setuid() (which always sets both the real and
          effective user IDs, like setuid() in POSIX.1‐2008 for privileged
          users), and seteuid() (which always sets just the effective user
          ID, like setuid() in POSIX.1‐2008 for non-privileged users). This
          separation of functionality into distinct functions seems
          desirable. 4.3BSD does not support the saved set-user-ID feature.
          It supports similar functionality of switching the effective user
          ID back and forth via setreuid(), which permits reversing the
          real and effective user IDs. This model seems less desirable than
          the saved set-user-ID because the real user ID changes as a side-
          effect. The current 4.4BSD includes saved effective IDs and uses
          them for seteuid() and setegid() as described above. The
          setreuid() and setregid() functions will be deprecated or
          removed.

          The solution here is:

           *  Require that all implementations support the functionality of
              the saved set-user-ID, which is set by the exec functions and
              by privileged calls to setuid().

           *  Add the seteuid() and setegid() functions as portable
              alternatives to setuid() and setgid() for non-privileged and
              privileged processes.

          Historical systems have provided two mechanisms for a set-user-ID
          process to change its effective user ID to be the same as its
          real user ID in such a way that it could return to the original
          effective user ID: the use of the setuid() function in the
          presence of a saved set-user-ID, or the use of the BSD setreuid()
          function, which was able to swap the real and effective user IDs.
          The changes included in POSIX.1‐2008 provide a new mechanism
          using seteuid() in conjunction with a saved set-user-ID. Thus,
          all implementations with the new seteuid() mechanism will have a
          saved set-user-ID for each process, and most of the behavior
          controlled by _POSIX_SAVED_IDS has been changed to agree with the
          case where the option was defined. The kill() function is an
          exception. Implementors of the new seteuid() mechanism will
          generally be required to maintain compatibility with the older
          mechanisms previously supported by their systems. However,
          compatibility with this use of setreuid() and with the
          _POSIX_SAVED_IDS behavior of kill() is unfortunately complicated.
          If an implementation with a saved set-user-ID allows a process to
          use setreuid() to swap its real and effective user IDs, but were
          to leave the saved set-user-ID unmodified, the process would then
          have an effective user ID equal to the original real user ID, and
          both real and saved set-user-ID would be equal to the original
          effective user ID. In that state, the real user would be unable
          to kill the process, even though the effective user ID of the
          process matches that of the real user, if the kill() behavior of
          _POSIX_SAVED_IDS was used. This is obviously not acceptable. The
          alternative choice, which is used in at least one implementation,
          is to change the saved set-user-ID to the effective user ID
          during most calls to setreuid().  The standard developers
          considered that alternative to be less correct than the retention
          of the old behavior of kill() in such systems. Current conforming
          applications shall accommodate either behavior from kill(), and
          there appears to be no strong reason for kill() to check the
          saved set-user-ID rather than the effective user ID.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          exec(1p), getegid(3p), geteuid(3p), getgid(3p), getuid(3p),
          setegid(3p), seteuid(3p), setgid(3p), setregid(3p), setreuid(3p)

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

   IEEE/The Open Group               2017                        SETUID(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`getegid(3p) <../man3/getegid.3p.html>`__, 
`geteuid(3p) <../man3/geteuid.3p.html>`__, 
`getgid(3p) <../man3/getgid.3p.html>`__, 
`getuid(3p) <../man3/getuid.3p.html>`__, 
`posix_spawn(3p) <../man3/posix_spawn.3p.html>`__, 
`setegid(3p) <../man3/setegid.3p.html>`__, 
`seteuid(3p) <../man3/seteuid.3p.html>`__, 
`setgid(3p) <../man3/setgid.3p.html>`__, 
`setregid(3p) <../man3/setregid.3p.html>`__, 
`setreuid(3p) <../man3/setreuid.3p.html>`__

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
