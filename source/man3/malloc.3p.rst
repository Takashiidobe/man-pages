.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

malloc(3p) — Linux manual page
==============================

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

   MALLOC(3P)              POSIX Programmer's Manual             MALLOC(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          malloc — a memory allocator


---------------------------------------------------------

::

          #include <stdlib.h>

          void *malloc(size_t size);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The malloc() function shall allocate unused space for an object
          whose size in bytes is specified by size and whose value is
          unspecified.

          The order and contiguity of storage allocated by successive calls
          to malloc() is unspecified. The pointer returned if the
          allocation succeeds shall be suitably aligned so that it may be
          assigned to a pointer to any type of object and then used to
          access such an object in the space allocated (until the space is
          explicitly freed or reallocated). Each such allocation shall
          yield a pointer to an object disjoint from any other object. The
          pointer returned points to the start (lowest byte address) of the
          allocated space. If the space cannot be allocated, a null pointer
          shall be returned. If the size of the space requested is 0, the
          behavior is implementation-defined: either a null pointer shall
          be returned, or the behavior shall be as if the size were some
          non-zero value, except that the behavior is undefined if the
          returned pointer is used to access an object.


-----------------------------------------------------------------

::

          Upon successful completion with size not equal to 0, malloc()
          shall return a pointer to the allocated space. If size is 0,
          either:

           *  A null pointer shall be returned and errno may be set to an
              implementation-defined value, or

           *  A pointer to the allocated space shall be returned. The
              application shall ensure that the pointer is not used to
              access an object.

          Otherwise, it shall return a null pointer and set errno to
          indicate the error.


-----------------------------------------------------

::

          The malloc() function shall fail if:

          ENOMEM Insufficient storage space is available.

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

          calloc(3p), free(3p), getrlimit(3p), posix_memalign(3p),
          realloc(3p)

          The Base Definitions volume of POSIX.1‐2017, stdlib.h(0p)


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

   IEEE/The Open Group               2017                        MALLOC(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`calloc(3p) <../man3/calloc.3p.html>`__, 
`fmemopen(3p) <../man3/fmemopen.3p.html>`__, 
`free(3p) <../man3/free.3p.html>`__, 
`getcwd(3p) <../man3/getcwd.3p.html>`__, 
`getdelim(3p) <../man3/getdelim.3p.html>`__, 
`getrlimit(3p) <../man3/getrlimit.3p.html>`__, 
`hcreate(3p) <../man3/hcreate.3p.html>`__, 
`posix_memalign(3p) <../man3/posix_memalign.3p.html>`__, 
`putenv(3p) <../man3/putenv.3p.html>`__, 
`realloc(3p) <../man3/realloc.3p.html>`__

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
