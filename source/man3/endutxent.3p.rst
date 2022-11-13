.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

endutxent(3p) — Linux manual page
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

   ENDUTXENT(3P)           POSIX Programmer's Manual          ENDUTXENT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          endutxent, getutxent, getutxid, getutxline, pututxline, setutxent
          — user accounting database functions


---------------------------------------------------------

::

          #include <utmpx.h>

          void endutxent(void);
          struct utmpx *getutxent(void);
          struct utmpx *getutxid(const struct utmpx *id);
          struct utmpx *getutxline(const struct utmpx *line);
          struct utmpx *pututxline(const struct utmpx *utmpx);
          void setutxent(void);


---------------------------------------------------------------

::

          These functions shall provide access to the user accounting
          database.

          The getutxent() function shall read the next entry from the user
          accounting database.  If the database is not already open, it
          shall open it. If it reaches the end of the database, it shall
          fail.

          The getutxid() function shall search forward from the current
          point in the database.  If the ut_type value of the utmpx
          structure pointed to by id is BOOT_TIME, OLD_TIME, or NEW_TIME,
          then it shall stop when it finds an entry with a matching ut_type
          value. If the ut_type value is INIT_PROCESS, LOGIN_PROCESS,
          USER_PROCESS, or DEAD_PROCESS, then it shall stop when it finds
          an entry whose type is one of these four and whose ut_id member
          matches the ut_id member of the utmpx structure pointed to by id.
          If the end of the database is reached without a match, getutxid()
          shall fail.

          The getutxline() function shall search forward from the current
          point in the database until it finds an entry of the type
          LOGIN_PROCESS or USER_PROCESS which also has a ut_line value
          matching that in the utmpx structure pointed to by line.  If the
          end of the database is reached without a match, getutxline()
          shall fail.

          The getutxid() or getutxline() function may cache data. For this
          reason, to use getutxline() to search for multiple occurrences,
          the application shall zero out the static data after each
          success, or getutxline() may return a pointer to the same utmpx
          structure.

          There is one exception to the rule about clearing the structure
          before further reads are done. The implicit read done by
          pututxline() (if it finds that it is not already at the correct
          place in the user accounting database) shall not modify the
          static structure returned by getutxent(), getutxid(), or
          getutxline(), if the application has modified this structure and
          passed the pointer back to pututxline().

          For all entries that match a request, the ut_type member
          indicates the type of the entry. Other members of the entry shall
          contain meaningful data based on the value of the ut_type member
          as follows:

   ┌───────────────┬─────────────────────────────────────────────────────────────────┐
   │ut_type Member │               Other Members with Meaningful Data                │
   ├───────────────┼─────────────────────────────────────────────────────────────────┤
   │EMPTY          │ No others                                                       │
   │BOOT_TIME      │ ut_tv                                                           │
   │OLD_TIME       │ ut_tv                                                           │
   │NEW_TIME       │ ut_tv                                                           │
   │USER_PROCESS   │ ut_id, ut_user (login name of the user), ut_line, ut_pid, ut_tv │
   │INIT_PROCESS   │ ut_id, ut_pid, ut_tv                                            │
   │LOGIN_PROCESS  │ ut_id, ut_user (implementation-defined name of the login        │
   │               │ process), ut_line, ut_pid, ut_tv                                │
   │DEAD_PROCESS   │ ut_id, ut_pid, ut_tv                                            │
   └───────────────┴─────────────────────────────────────────────────────────────────┘
          An implementation that provides extended security controls may
          impose implementation-defined restrictions on accessing the user
          accounting database. In particular, the system may deny the
          existence of some or all of the user accounting database entries
          associated with users other than the caller.

          If the process has appropriate privileges, the pututxline()
          function shall write out the structure into the user accounting
          database. It shall search for a record as if by getutxid() that
          satisfies the request. If this search succeeds, then the entry
          shall be replaced. Otherwise, a new entry shall be made at the
          end of the user accounting database.

          The endutxent() function shall close the user accounting
          database.

          The setutxent() function shall reset the input to the beginning
          of the database. This should be done before each search for a new
          entry if it is desired that the entire database be examined.

          These functions need not be thread-safe.


-----------------------------------------------------------------

::

          Upon successful completion, getutxent(), getutxid(), and
          getutxline() shall return a pointer to a utmpx structure
          containing a copy of the requested entry in the user accounting
          database. Otherwise, a null pointer shall be returned.

          The return value may point to a static area which is overwritten
          by a subsequent call to getutxid() or getutxline().

          Upon successful completion, pututxline() shall return a pointer
          to a utmpx structure containing a copy of the entry added to the
          user accounting database. Otherwise, a null pointer shall be
          returned.

          The endutxent() and setutxent() functions shall not return a
          value.


-----------------------------------------------------

::

          No errors are defined for the endutxent(), getutxent(),
          getutxid(), getutxline(), and setutxent() functions.

          The pututxline() function may fail if:

          EPERM  The process does not have appropriate privileges.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The sizes of the arrays in the structure can be found using the
          sizeof operator.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The Base Definitions volume of POSIX.1‐2017, utmpx.h(0p)


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

   IEEE/The Open Group               2017                     ENDUTXENT(3P)

--------------

Pages that refer to this page:
`utmpx.h(0p) <../man0/utmpx.h.0p.html>`__, 
`getutxent(3p) <../man3/getutxent.3p.html>`__, 
`pututxline(3p) <../man3/pututxline.3p.html>`__, 
`setutxent(3p) <../man3/setutxent.3p.html>`__

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
