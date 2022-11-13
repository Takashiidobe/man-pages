.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

endpwent(3p) — Linux manual page
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

   ENDPWENT(3P)            POSIX Programmer's Manual           ENDPWENT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          endpwent, getpwent, setpwent — user database functions


---------------------------------------------------------

::

          #include <pwd.h>

          void endpwent(void);
          struct passwd *getpwent(void);
          void setpwent(void);


---------------------------------------------------------------

::

          These functions shall retrieve information about users.

          The getpwent() function shall return a pointer to a structure
          containing the broken-out fields of an entry in the user
          database. Each entry in the user database contains a passwd
          structure. If the user database is not already open, getpwent()
          shall open it and return a pointer to a passwd structure
          containing the first entry in the database. Thereafter, it shall
          return a pointer to a passwd structure containing the next entry
          in the user database. Successive calls can be used to search the
          entire user database.

          If an end-of-file or an error is encountered on reading,
          getpwent() shall return a null pointer.

          An implementation that provides extended security controls may
          impose further implementation-defined restrictions on accessing
          the user database. In particular, the system may deny the
          existence of some or all of the user database entries associated
          with users other than the caller.

          The setpwent() function shall rewind the user database so that
          the next getpwent() call returns the first entry, allowing
          repeated searches.

          The endpwent() function shall close the user database.

          The setpwent() and endpwent() functions shall not change the
          setting of errno if successful.

          On error, the setpwent() and endpwent() functions shall set errno
          to indicate the error.

          Since no value is returned by the setpwent() and endpwent()
          functions, an application wishing to check for error situations
          should set errno to 0, then call the function, then check errno.

          These functions need not be thread-safe.


-----------------------------------------------------------------

::

          On successful completion, getpwent() shall return a pointer to a
          passwd structure. On end-of-file, getpwent() shall return a null
          pointer and shall not change the setting of errno.  On error,
          getpwent() shall return a null pointer and errno shall be set to
          indicate the error.

          The application shall not modify the structure to which the
          return value points, nor any storage areas pointed to by pointers
          within the structure. The returned pointer, and pointers within
          the structure, might be invalidated or the structure or the
          storage areas might be overwritten by a subsequent call to
          getpwuid(), getpwnam(), or getpwent().  The returned pointer, and
          pointers within the structure, might also be invalidated if the
          calling thread is terminated.


-----------------------------------------------------

::

          These functions may fail if:

          EINTR  A signal was caught during the operation.

          EIO    An I/O error has occurred.

          In addition, getpwent() and setpwent() may fail if:

          EMFILE All file descriptors available to the process are
                 currently open.

          ENFILE The maximum allowable number of files is currently open in
                 the system.

          The following sections are informative.


---------------------------------------------------------

::

      Searching the User Database
          The following example uses the getpwent() function to get
          successive entries in the user database, returning a pointer to a
          passwd structure that contains information about each user. The
          call to endpwent() closes the user database and cleans up.

              #include <pwd.h>
              #include <stdio.h>

              void printname(uid_t uid)
              {
                  struct passwd *pwd;

                  setpwent();
                  while((pwd = getpwent()) != NULL) {
                      if (pwd->pw_uid == uid) {
                          printf("name=%s\n",pwd->pw_name);
                          break;
                      }
                  }
                  endpwent();
              }


---------------------------------------------------------------------------

::

          These functions are provided due to their historical usage.
          Applications should avoid dependencies on fields in the password
          database, whether the database is a single file, or where in the
          file system name space the database resides. Applications should
          use getpwuid() whenever possible because it avoids these
          dependencies.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          endgrent(3p), getlogin(3p), getpwnam(3p), getpwuid(3p)

          The Base Definitions volume of POSIX.1‐2017, pwd.h(0p)


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

   IEEE/The Open Group               2017                      ENDPWENT(3P)

--------------

Pages that refer to this page: `pwd.h(0p) <../man0/pwd.h.0p.html>`__, 
`endgrent(3p) <../man3/endgrent.3p.html>`__, 
`getpwent(3p) <../man3/getpwent.3p.html>`__, 
`setpwent(3p) <../man3/setpwent.3p.html>`__

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
