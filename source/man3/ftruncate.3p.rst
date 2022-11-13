.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ftruncate(3p) — Linux manual page
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

   FTRUNCATE(3P)           POSIX Programmer's Manual          FTRUNCATE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          ftruncate — truncate a file to a specified length


---------------------------------------------------------

::

          #include <unistd.h>

          int ftruncate(int fildes, off_t length);


---------------------------------------------------------------

::

          If fildes is not a valid file descriptor open for writing, the
          ftruncate() function shall fail.

          If fildes refers to a regular file, the ftruncate() function
          shall cause the size of the file to be truncated to length.  If
          the size of the file previously exceeded length, the extra data
          shall no longer be available to reads on the file. If the file
          previously was smaller than this size, ftruncate() shall increase
          the size of the file. If the file size is increased, the extended
          area shall appear as if it were zero-filled. The value of the
          seek pointer shall not be modified by a call to ftruncate().

          Upon successful completion, if fildes refers to a regular file,
          ftruncate() shall mark for update the last data modification and
          last file status change timestamps of the file and the S_ISUID
          and S_ISGID bits of the file mode may be cleared. If the
          ftruncate() function is unsuccessful, the file is unaffected.

          If the request would cause the file size to exceed the soft file
          size limit for the process, the request shall fail and the
          implementation shall generate the SIGXFSZ signal for the thread.

          If fildes refers to a directory, ftruncate() shall fail.

          If fildes refers to any other file type, except a shared memory
          object, the result is unspecified.

          If fildes refers to a shared memory object, ftruncate() shall set
          the size of the shared memory object to length.

          If the effect of ftruncate() is to decrease the size of a memory
          mapped file or a shared memory object and whole pages beyond the
          new end were previously mapped, then the whole pages beyond the
          new end shall be discarded.

          References to discarded pages shall result in the generation of a
          SIGBUS signal.

          If the effect of ftruncate() is to increase the size of a memory
          object, it is unspecified whether the contents of any mapped
          pages between the old end-of-file and the new are flushed to the
          underlying object.


-----------------------------------------------------------------

::

          Upon successful completion, ftruncate() shall return 0;
          otherwise, -1 shall be returned and errno set to indicate the
          error.


-----------------------------------------------------

::

          The ftruncate() function shall fail if:

          EINTR  A signal was caught during execution.

          EINVAL The length argument was less than 0.

          EFBIG or EINVAL
                 The length argument was greater than the maximum file
                 size.

          EFBIG  The file is a regular file and length is greater than the
                 offset maximum established in the open file description
                 associated with fildes.

          EIO    An I/O error occurred while reading from or writing to a
                 file system.

          EBADF or EINVAL
                 The fildes argument is not a file descriptor open for
                 writing.

          The following sections are informative.


---------------------------------------------------------

::

          None.


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

          open(3p), truncate(3p)

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

   IEEE/The Open Group               2017                     FTRUNCATE(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`posix_fallocate(3p) <../man3/posix_fallocate.3p.html>`__, 
`posix_typed_mem_open(3p) <../man3/posix_typed_mem_open.3p.html>`__

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
