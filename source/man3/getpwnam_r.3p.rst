.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getpwnam(3p) — Linux manual page
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

   GETPWNAM(3P)            POSIX Programmer's Manual           GETPWNAM(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          getpwnam, getpwnam_r — search user database for a name


---------------------------------------------------------

::

          #include <pwd.h>

          struct passwd *getpwnam(const char *name);
          int getpwnam_r(const char *name, struct passwd *pwd, char *buffer,
              size_t bufsize, struct passwd **result);


---------------------------------------------------------------

::

          The getpwnam() function shall search the user database for an
          entry with a matching name.

          The getpwnam() function need not be thread-safe.

          Applications wishing to check for error situations should set
          errno to 0 before calling getpwnam().  If getpwnam() returns a
          null pointer and errno is non-zero, an error occurred.

          The getpwnam_r() function shall update the passwd structure
          pointed to by pwd and store a pointer to that structure at the
          location pointed to by result.  The structure shall contain an
          entry from the user database with a matching name.  Storage
          referenced by the structure is allocated from the memory provided
          with the buffer parameter, which is bufsize bytes in size. A call
          to sysconf(_SC_GETPW_R_SIZE_MAX) returns either -1 without
          changing errno or an initial value suggested for the size of this
          buffer.  A null pointer shall be returned at the location pointed
          to by result on error or if the requested entry is not found.


-----------------------------------------------------------------

::

          The getpwnam() function shall return a pointer to a struct passwd
          with the structure as defined in <pwd.h> with a matching entry if
          found. A null pointer shall be returned if the requested entry is
          not found, or an error occurs. If the requested entry was not
          found, errno shall not be changed. On error, errno shall be set
          to indicate the error.

          The application shall not modify the structure to which the
          return value points, nor any storage areas pointed to by pointers
          within the structure. The returned pointer, and pointers within
          the structure, might be invalidated or the structure or the
          storage areas might be overwritten by a subsequent call to
          getpwent(), getpwnam(), or getpwuid().  The returned pointer, and
          pointers within the structure, might also be invalidated if the
          calling thread is terminated.

          The getpwnam_r() function shall return zero on success or if the
          requested entry was not found and no error has occurred. If an
          error has occurred, an error number shall be returned to indicate
          the error.


-----------------------------------------------------

::

          These functions may fail if:

          EIO    An I/O error has occurred.

          EINTR  A signal was caught during getpwnam().

          EMFILE All file descriptors available to the process are
                 currently open.

          ENFILE The maximum allowable number of files is currently open in
                 the system.

          The getpwnam_r() function may fail if:

          ERANGE Insufficient storage was supplied via buffer and bufsize
                 to contain the data to be referenced by the resulting
                 passwd structure.

          The following sections are informative.


---------------------------------------------------------

::

          Note that sysconf(_SC_GETPW_R_SIZE_MAX) may return -1 if there is
          no hard limit on the size of the buffer needed to store all the
          groups returned. This example shows how an application can
          allocate a buffer of sufficient size to work with getpwnam_r().

              long int initlen = sysconf(_SC_GETPW_R_SIZE_MAX);
              size_t len;
              if (initlen == -1)
                  /* Default initial length. */
                  len = 1024;
              else
                  len = (size_t) initlen;
              struct passwd result;
              struct passwd *resultp;
              char *buffer = malloc(len);
              if (buffer == NULL)
                  ...handle error...
              int e;
              while ((e = getpwnam_r("someuser", &result, buffer, len, &resultp))
                      == ERANGE)
                  {
                  size_t newlen = 2 * len;
                  if (newlen < len)
                      ...handle error...
                  len = newlen;
                  char *newbuffer = realloc(buffer, len);
                  if (newbuffer == NULL)
                      ...handle error...
                  buffer = newbuffer;
                  }
              if (e != 0)
                  ...handle error...
              free (buffer);

      Getting an Entry for the Login Name
          The following example uses the getlogin() function to return the
          name of the user who logged in; this information is passed to the
          getpwnam() function to get the user database entry for that user.

              #include <sys/types.h>
              #include <pwd.h>
              #include <unistd.h>
              #include <stdio.h>
              #include <stdlib.h>
              ...
              char *lgn;
              struct passwd *pw;
              ...
              if ((lgn = getlogin()) == NULL || (pw = getpwnam(lgn)) == NULL) {
                  fprintf(stderr, "Get of user information failed.\n"); exit(1);
              }
              ...


---------------------------------------------------------------------------

::

          Three names associated with the current process can be
          determined: getpwuid(geteuid()) returns the name associated with
          the effective user ID of the process; getlogin() returns the name
          associated with the current login activity; and
          getpwuid(getuid()) returns the name associated with the real user
          ID of the process.

          The getpwnam_r() function is thread-safe and returns values in a
          user-supplied buffer instead of possibly using a static data area
          that may be overwritten by each call.

          Portable applications should take into account that it is usual
          for an implementation to return -1 from sysconf() indicating that
          there is no maximum for _SC_GETPW_R_SIZE_MAX.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          getpwuid(3p), sysconf(3p)

          The Base Definitions volume of POSIX.1‐2017, pwd.h(0p),
          sys_types.h(0p)


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

   IEEE/The Open Group               2017                      GETPWNAM(3P)

--------------

Pages that refer to this page: `pwd.h(0p) <../man0/pwd.h.0p.html>`__, 
`endpwent(3p) <../man3/endpwent.3p.html>`__, 
`getlogin(3p) <../man3/getlogin.3p.html>`__, 
`getpwuid(3p) <../man3/getpwuid.3p.html>`__

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
