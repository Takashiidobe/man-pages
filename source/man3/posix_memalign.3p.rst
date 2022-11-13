.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_memalign(3p) — Linux manual page
======================================

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

   POSIX_MEMALIGN(3P)      POSIX Programmer's Manual     POSIX_MEMALIGN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_memalign — aligned memory allocation (ADVANCED REALTIME)


---------------------------------------------------------

::

          #include <stdlib.h>

          int posix_memalign(void **memptr, size_t alignment, size_t size);


---------------------------------------------------------------

::

          The posix_memalign() function shall allocate size bytes aligned
          on a boundary specified by alignment, and shall return a pointer
          to the allocated memory in memptr.  The value of alignment shall
          be a power of two multiple of sizeof(void *).

          Upon successful completion, the value pointed to by memptr shall
          be a multiple of alignment.

          If the size of the space requested is 0, the behavior is
          implementation-defined: either a null pointer shall be returned
          in memptr, or the behavior shall be as if the size were some non-
          zero value, except that the behavior is undefined if the the
          value returned in memptr is used to access an object.

          The free() function shall deallocate memory that has previously
          been allocated by posix_memalign().


-----------------------------------------------------------------

::

          Upon successful completion, posix_memalign() shall return zero;
          otherwise, an error number shall be returned to indicate the
          error and the contents of memptr shall either be left unmodified
          or be set to a null pointer.

          If size is 0, either:

           *  posix_memalign() shall not attempt to allocate any space, in
              which case either an implementation-defined error number
              shall be returned, or zero shall be returned with a null
              pointer returned in memptr, or

           *  posix_memalign() shall attempt to allocate some space and, if
              the allocation succeeds, zero shall be returned and a pointer
              to the allocated space shall be returned in memptr.  The
              application shall ensure that the pointer is not used to
              access an object.


-----------------------------------------------------

::

          The posix_memalign() function shall fail if:

          EINVAL The value of the alignment parameter is not a power of two
                 multiple of sizeof(void *).

          ENOMEM There is insufficient memory available with the requested
                 alignment.

          The following sections are informative.


---------------------------------------------------------

::

          The following example shows how applications can obtain
          consistent behavior on error by setting *memptr to be a null
          pointer before calling posix_memalign().

              void *ptr = NULL;
              ...
              //do some work, which might goto error
              if (posix_memalign(&ptr, align, size))
                  goto error;

              //do some more work, which might goto error
              ...
              error:
                  free(ptr);
                  //more cleanup;


---------------------------------------------------------------------------

::

          The posix_memalign() function is part of the Advisory Information
          option and need not be provided on all implementations.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          free(3p), malloc(3p)

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

   IEEE/The Open Group               2017                POSIX_MEMALIGN(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`free(3p) <../man3/free.3p.html>`__, 
`malloc(3p) <../man3/malloc.3p.html>`__

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
