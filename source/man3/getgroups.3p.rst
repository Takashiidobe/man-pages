.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getgroups(3p) — Linux manual page
=================================

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

   GETGROUPS(3P)           POSIX Programmer's Manual          GETGROUPS(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          getgroups — get supplementary group IDs


---------------------------------------------------------

::

          #include <unistd.h>

          int getgroups(int gidsetsize, gid_t grouplist[]);


---------------------------------------------------------------

::

          The getgroups() function shall fill in the array grouplist with
          the current supplementary group IDs of the calling process. It is
          implementation-defined whether getgroups() also returns the
          effective group ID in the grouplist array.

          The gidsetsize argument specifies the number of elements in the
          array grouplist.  The actual number of group IDs stored in the
          array shall be returned.  The values of array entries with
          indices greater than or equal to the value returned are
          undefined.

          If gidsetsize is 0, getgroups() shall return the number of group
          IDs that it would otherwise return without modifying the array
          pointed to by grouplist.

          If the effective group ID of the process is returned with the
          supplementary group IDs, the value returned shall always be
          greater than or equal to one and less than or equal to the value
          of {NGROUPS_MAX}+1.


-----------------------------------------------------------------

::

          Upon successful completion, the number of supplementary group IDs
          shall be returned. A return value of -1 indicates failure and
          errno shall be set to indicate the error.


-----------------------------------------------------

::

          The getgroups() function shall fail if:

          EINVAL The gidsetsize argument is non-zero and less than the
                 number of group IDs that would have been returned.

          The following sections are informative.


---------------------------------------------------------

::

      Getting the Supplementary Group IDs of the Calling Process
          The following example places the current supplementary group IDs
          of the calling process into the group array.

              #include <sys/types.h>
              #include <unistd.h>
              ...
              gid_t *group;
              int nogroups;
              long ngroups_max;

              ngroups_max = sysconf(_SC_NGROUPS_MAX) + 1;
              group = (gid_t *)malloc(ngroups_max *sizeof(gid_t));

              ngroups = getgroups(ngroups_max, group);


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The related function setgroups() is a privileged operation and
          therefore is not covered by this volume of POSIX.1‐2017.

          As implied by the definition of supplementary groups, the
          effective group ID may appear in the array returned by
          getgroups() or it may be returned only by getegid().  Duplication
          may exist, but the application needs to call getegid() to be sure
          of getting all of the information. Various implementation
          variations and administrative sequences cause the set of groups
          appearing in the result of getgroups() to vary in order and as to
          whether the effective group ID is included, even when the set of
          groups is the same (in the mathematical sense of ``set''). (The
          history of a process and its parents could affect the details of
          the result.)

          Application developers should note that {NGROUPS_MAX} is not
          necessarily a constant on all implementations.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          getegid(3p), setgid(3p)

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

   IEEE/The Open Group               2017                     GETGROUPS(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`id(1p) <../man1/id.1p.html>`__,  `open(3p) <../man3/open.3p.html>`__

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
