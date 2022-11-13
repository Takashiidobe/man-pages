.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_fadvise(3p) — Linux manual page
=====================================

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

   POSIX_FADVISE(3P)       POSIX Programmer's Manual      POSIX_FADVISE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_fadvise — file advisory information (ADVANCED REALTIME)


---------------------------------------------------------

::

          #include <fcntl.h>

          int posix_fadvise(int fd, off_t offset, off_t len, int advice);


---------------------------------------------------------------

::

          The posix_fadvise() function shall advise the implementation on
          the expected behavior of the application with respect to the data
          in the file associated with the open file descriptor, fd,
          starting at offset and continuing for len bytes. The specified
          range need not currently exist in the file. If len is zero, all
          data following offset is specified. The implementation may use
          this information to optimize handling of the specified data. The
          posix_fadvise() function shall have no effect on the semantics of
          other operations on the specified data, although it may affect
          the performance of other operations.

          The advice to be applied to the data is specified by the advice
          parameter and may be one of the following values:

          POSIX_FADV_NORMAL
                Specifies that the application has no advice to give on its
                behavior with respect to the specified data. It is the
                default characteristic if no advice is given for an open
                file.

          POSIX_FADV_SEQUENTIAL
                Specifies that the application expects to access the
                specified data sequentially from lower offsets to higher
                offsets.

          POSIX_FADV_RANDOM
                Specifies that the application expects to access the
                specified data in a random order.

          POSIX_FADV_WILLNEED
                Specifies that the application expects to access the
                specified data in the near future.

          POSIX_FADV_DONTNEED
                Specifies that the application expects that it will not
                access the specified data in the near future.

          POSIX_FADV_NOREUSE
                Specifies that the application expects to access the
                specified data once and then not reuse it thereafter.

          These values are defined in <fcntl.h>.


-----------------------------------------------------------------

::

          Upon successful completion, posix_fadvise() shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The posix_fadvise() function shall fail if:

          EBADF  The fd argument is not a valid file descriptor.

          EINVAL The value of advice is invalid, or the value of len is
                 less than zero.

          ESPIPE The fd argument is associated with a pipe or FIFO.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The posix_fadvise() function is part of the Advisory Information
          option and need not be provided on all implementations.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          posix_madvise(3p)

          The Base Definitions volume of POSIX.1‐2017, fcntl.h(0p)


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

   IEEE/The Open Group               2017                 POSIX_FADVISE(3P)

--------------

Pages that refer to this page:
`fcntl.h(0p) <../man0/fcntl.h.0p.html>`__, 
`posix_madvise(3p) <../man3/posix_madvise.3p.html>`__

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
