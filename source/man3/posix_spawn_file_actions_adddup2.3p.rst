.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_spawn_file_actions_adddup2(3p) — Linux manual page
========================================================

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

   POSIX_SPAWN_FILE_ACTIONS_ADDDUP2(3P)mmer'sSManualILE_ACTIONS_ADDDUP2(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_spawn_file_actions_adddup2 — add dup2 action to spawn file
          actions object (ADVANCED REALTIME)


---------------------------------------------------------

::

          #include <spawn.h>

          int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t
              *file_actions, int fildes, int newfildes);


---------------------------------------------------------------

::

          The posix_spawn_file_actions_adddup2() function shall add a
          dup2() action to the object referenced by file_actions that shall
          cause the file descriptor fildes to be duplicated as newfildes
          (as if dup2(fildes, newfildes) had been called) when a new
          process is spawned using this file actions object.

          A spawn file actions object is as defined in
          posix_spawn_file_actions_addclose(3p).


-----------------------------------------------------------------

::

          Upon successful completion, the
          posix_spawn_file_actions_adddup2() function shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The posix_spawn_file_actions_adddup2() function shall fail if:

          EBADF  The value specified by fildes or newfildes is negative or
                 greater than or equal to {OPEN_MAX}.

          ENOMEM Insufficient memory exists to add to the spawn file
                 actions object.

          The posix_spawn_file_actions_adddup2() function may fail if:

          EINVAL The value specified by file_actions is invalid.

          It shall not be considered an error for the fildes argument
          passed to the posix_spawn_file_actions_adddup2() function to
          specify a file descriptor for which the specified operation could
          not be performed at the time of the call. Any such error will be
          detected when the associated file actions object is later used
          during a posix_spawn() or posix_spawnp() operation.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The posix_spawn_file_actions_adddup2() function is part of the
          Spawn option and need not be provided on all implementations.

          Implementations may use file descriptors that must be inherited
          into child processes for the child process to remain conforming,
          such as for message catalog or tracing purposes. Therefore, an
          application that calls posix_spawn_file_actions_adddup2() with an
          arbitrary integer for newfildes risks non-conforming behavior,
          and this function can only portably be used to overwrite file
          descriptor values that the application has obtained through
          explicit actions, or for the three file descriptors corresponding
          to the standard file streams. In order to avoid a race condition
          of leaking an unintended file descriptor into a child process, an
          application should consider opening all file descriptors with the
          FD_CLOEXEC bit set unless the file descriptor is intended to be
          inherited across exec.


-----------------------------------------------------------

::

          Refer to the RATIONALE section in
          posix_spawn_file_actions_addclose(3p).


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          dup(3p), posix_spawn(3p), posix_spawn_file_actions_addclose(3p),
          posix_spawn_file_actions_destroy(3p)

          The Base Definitions volume of POSIX.1‐2017, spawn.h(0p)


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

   IEEE/The Open Group               201P7OSIX_SPAWN_FILE_ACTIONS_ADDDUP2(3P)

--------------

Pages that refer to this page:
`spawn.h(0p) <../man0/spawn.h.0p.html>`__, 
`posix_spawn(3p) <../man3/posix_spawn.3p.html>`__, 
`posix_spawn_file_actions_addclose(3p) <../man3/posix_spawn_file_actions_addclose.3p.html>`__

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
