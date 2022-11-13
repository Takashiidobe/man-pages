.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

endgrent(3p) — Linux manual page
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

   ENDGRENT(3P)            POSIX Programmer's Manual           ENDGRENT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          endgrent, getgrent, setgrent — group database entry functions


---------------------------------------------------------

::

          #include <grp.h>

          void endgrent(void);
          struct group *getgrent(void);
          void setgrent(void);


---------------------------------------------------------------

::

          The getgrent() function shall return a pointer to a structure
          containing the broken-out fields of an entry in the group
          database. If the group database is not already open, getgrent()
          shall open it and return a pointer to a group structure
          containing the first entry in the database. Thereafter, it shall
          return a pointer to a group structure containing the next group
          structure in the group database, so successive calls may be used
          to search the entire database.

          An implementation that provides extended security controls may
          impose further implementation-defined restrictions on accessing
          the group database. In particular, the system may deny the
          existence of some or all of the group database entries associated
          with groups other than those groups associated with the caller
          and may omit users other than the caller from the list of members
          of groups in database entries that are returned.

          The setgrent() function shall rewind the group database so that
          the next getgrent() call returns the first entry, allowing
          repeated searches.

          The endgrent() function shall close the group database.

          The setgrent() and endgrent() functions shall not change the
          setting of errno if successful.

          On error, the setgrent() and endgrent() functions shall set errno
          to indicate the error.

          Since no value is returned by the setgrent() and endgrent()
          functions, an application wishing to check for error situations
          should set errno to 0, then call the function, then check errno.

          These functions need not be thread-safe.


-----------------------------------------------------------------

::

          On successful completion, getgrent() shall return a pointer to a
          group structure. On end-of-file, getgrent() shall return a null
          pointer and shall not change the setting of errno.  On error,
          getgrent() shall return a null pointer and errno shall be set to
          indicate the error.

          The application shall not modify the structure to which the
          return value points, nor any storage areas pointed to by pointers
          within the structure. The returned pointer, and pointers within
          the structure, might be invalidated or the structure or the
          storage areas might be overwritten by a subsequent call to
          getgrgid(), getgrnam(), or getgrent().  The returned pointer, and
          pointers within the structure, might also be invalidated if the
          calling thread is terminated.


-----------------------------------------------------

::

          These functions may fail if:

          EINTR  A signal was caught during the operation.

          EIO    An I/O error has occurred.

          In addition, the getgrent() and setgrent() functions may fail if:

          EMFILE All file descriptors available to the process are
                 currently open.

          ENFILE The maximum allowable number of files is currently open in
                 the system.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          These functions are provided due to their historical usage.
          Applications should avoid dependencies on fields in the group
          database, whether the database is a single file, or where in the
          file system name space the database resides. Applications should
          use getgrnam() and getgrgid() whenever possible because it avoids
          these dependencies.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          endpwent(3p), getgrgid(3p), getgrnam(3p), getlogin(3p)

          The Base Definitions volume of POSIX.1‐2017, grp.h(0p)


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

   IEEE/The Open Group               2017                      ENDGRENT(3P)

--------------

Pages that refer to this page: `grp.h(0p) <../man0/grp.h.0p.html>`__, 
`endpwent(3p) <../man3/endpwent.3p.html>`__, 
`getgrent(3p) <../man3/getgrent.3p.html>`__, 
`getgrgid(3p) <../man3/getgrgid.3p.html>`__, 
`getgrnam(3p) <../man3/getgrnam.3p.html>`__, 
`setgrent(3p) <../man3/setgrent.3p.html>`__

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
