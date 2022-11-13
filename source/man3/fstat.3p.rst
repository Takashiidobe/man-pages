.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fstat(3p) — Linux manual page
=============================

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

   FSTAT(3P)               POSIX Programmer's Manual              FSTAT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fstat — get file status


---------------------------------------------------------

::

          #include <sys/stat.h>

          int fstat(int fildes, struct stat *buf);


---------------------------------------------------------------

::

          The fstat() function shall obtain information about an open file
          associated with the file descriptor fildes, and shall write it to
          the area pointed to by buf.

          If fildes references a shared memory object, the implementation
          shall update in the stat structure pointed to by the buf argument
          the st_uid, st_gid, st_size, and st_mode fields, and only the
          S_IRUSR, S_IWUSR, S_IRGRP, S_IWGRP, S_IROTH, and S_IWOTH file
          permission bits need be valid.  The implementation may update
          other fields and flags.

          If fildes references a typed memory object, the implementation
          shall update in the stat structure pointed to by the buf argument
          the st_uid, st_gid, st_size, and st_mode fields, and only the
          S_IRUSR, S_IWUSR, S_IRGRP, S_IWGRP, S_IROTH, and S_IWOTH file
          permission bits need be valid. The implementation may update
          other fields and flags.

          The buf argument is a pointer to a stat structure, as defined in
          <sys/stat.h>, into which information is placed concerning the
          file.

          For all other file types defined in this volume of POSIX.1‐2017,
          the structure members st_mode, st_ino, st_dev, st_uid, st_gid,
          st_atim, st_ctim, and st_mtim shall have meaningful values and
          the value of the st_nlink member shall be set to the number of
          links to the file.

          An implementation that provides additional or alternative file
          access control mechanisms may, under implementation-defined
          conditions, cause fstat() to fail.

          The fstat() function shall update any time-related fields (as
          described in the Base Definitions volume of POSIX.1‐2017, Section
          4.9, File Times Update), before writing into the stat structure.


-----------------------------------------------------------------

::

          Upon successful completion, 0 shall be returned. Otherwise, -1
          shall be returned and errno set to indicate the error.


-----------------------------------------------------

::

          The fstat() function shall fail if:

          EBADF  The fildes argument is not a valid file descriptor.

          EIO    An I/O error occurred while reading from the file system.

          EOVERFLOW
                 The file size in bytes or the number of blocks allocated
                 to the file or the file serial number cannot be
                 represented correctly in the structure pointed to by buf.

          The fstat() function may fail if:

          EOVERFLOW
                 One of the values is too large to store into the structure
                 pointed to by the buf argument.

          The following sections are informative.


---------------------------------------------------------

::

      Obtaining File Status Information
          The following example shows how to obtain file status information
          for a file named /home/cnd/mod1.  The structure variable buffer
          is defined for the stat structure. The /home/cnd/mod1 file is
          opened with read/write privileges and is passed to the open file
          descriptor fildes.

              #include <sys/types.h>
              #include <sys/stat.h>
              #include <fcntl.h>

              struct stat buffer;
              int         status;
              ...
              fildes = open("/home/cnd/mod1", O_RDWR);
              status = fstat(fildes, &buffer);


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fstatat(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 4.9, File
          Times Update, sys_stat.h(0p), sys_types.h(0p)


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

   IEEE/The Open Group               2017                         FSTAT(3P)

--------------

Pages that refer to this page:
`sys_stat.h(0p) <../man0/sys_stat.h.0p.html>`__, 
`fstatat(3p) <../man3/fstatat.3p.html>`__, 
`posix_typed_mem_get_info(3p) <../man3/posix_typed_mem_get_info.3p.html>`__, 
`posix_typed_mem_open(3p) <../man3/posix_typed_mem_open.3p.html>`__, 
`utime(3p) <../man3/utime.3p.html>`__

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
