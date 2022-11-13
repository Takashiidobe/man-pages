.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iconv_open(3p) — Linux manual page
==================================

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

   ICONV_OPEN(3P)          POSIX Programmer's Manual         ICONV_OPEN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          iconv_open — codeset conversion allocation function


---------------------------------------------------------

::

          #include <iconv.h>

          iconv_t iconv_open(const char *tocode, const char *fromcode);


---------------------------------------------------------------

::

          The iconv_open() function shall return a conversion descriptor
          that describes a conversion from the codeset specified by the
          string pointed to by the fromcode argument to the codeset
          specified by the string pointed to by the tocode argument. For
          state-dependent encodings, the conversion descriptor shall be in
          a codeset-dependent initial shift state, ready for immediate use
          with iconv().

          Settings of fromcode and tocode and their permitted combinations
          are implementation-defined.

          A conversion descriptor shall remain valid until it is closed by
          iconv_close() or an implicit close.

          If a file descriptor is used to implement conversion descriptors,
          the FD_CLOEXEC flag shall be set; see <fcntl.h>.


-----------------------------------------------------------------

::

          Upon successful completion, iconv_open() shall return a
          conversion descriptor for use on subsequent calls to iconv().
          Otherwise, iconv_open() shall return (iconv_t)-1 and set errno to
          indicate the error.


-----------------------------------------------------

::

          The iconv_open() function may fail if:

          EMFILE All file descriptors available to the process are
                 currently open.

          ENFILE Too many files are currently open in the system.

          ENOMEM Insufficient storage space is available.

          EINVAL The conversion specified by fromcode and tocode is not
                 supported by the implementation.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Some implementations of iconv_open() use malloc() to allocate
          space for internal buffer areas. The iconv_open() function may
          fail if there is insufficient storage space to accommodate these
          buffers.

          Conforming applications must assume that conversion descriptors
          are not valid after a call to one of the exec functions.

          Application developers should consult the system documentation to
          determine the supported codesets and their naming schemes.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          iconv(3p), iconv_close(3p)

          The Base Definitions volume of POSIX.1‐2017, fcntl.h(0p),
          iconv.h(0p)


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

   IEEE/The Open Group               2017                    ICONV_OPEN(3P)

--------------

Pages that refer to this page:
`iconv.h(0p) <../man0/iconv.h.0p.html>`__, 
`iconv(3p) <../man3/iconv.3p.html>`__, 
`iconv_close(3p) <../man3/iconv_close.3p.html>`__

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
