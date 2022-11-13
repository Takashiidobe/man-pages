.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

realloc(3p) — Linux manual page
===============================

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

   REALLOC(3P)             POSIX Programmer's Manual            REALLOC(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          realloc — memory reallocator


---------------------------------------------------------

::

          #include <stdlib.h>

          void *realloc(void *ptr, size_t size);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The realloc() function shall deallocate the old object pointed to
          by ptr and return a pointer to a new object that has the size
          specified by size.  The contents of the new object shall be the
          same as that of the old object prior to deallocation, up to the
          lesser of the new and old sizes. Any bytes in the new object
          beyond the size of the old object have indeterminate values. If
          the size of the space requested is zero, the behavior shall be
          implementation-defined: either a null pointer is returned, or the
          behavior shall be as if the size were some non-zero value, except
          that the behavior is undefined if the returned pointer is used to
          access an object. If the space cannot be allocated, the object
          shall remain unchanged.

          If ptr is a null pointer, realloc() shall be equivalent to
          malloc() for the specified size.

          If ptr does not match a pointer returned earlier by calloc(),
          malloc(), or realloc() or if the space has previously been
          deallocated by a call to free() or realloc(), the behavior is
          undefined.

          The order and contiguity of storage allocated by successive calls
          to realloc() is unspecified. The pointer returned if the
          allocation succeeds shall be suitably aligned so that it may be
          assigned to a pointer to any type of object and then used to
          access such an object in the space allocated (until the space is
          explicitly freed or reallocated). Each such allocation shall
          yield a pointer to an object disjoint from any other object. The
          pointer returned shall point to the start (lowest byte address)
          of the allocated space. If the space cannot be allocated, a null
          pointer shall be returned.


-----------------------------------------------------------------

::

          Upon successful completion, realloc() shall return a pointer to
          the (possibly moved) allocated space. If size is 0, either:

           *  A null pointer shall be returned and, if ptr is not a null
              pointer, errno shall be set to an implementation-defined
              value.

           *  A pointer to the allocated space shall be returned, and the
              memory object pointed to by ptr shall be freed. The
              application shall ensure that the pointer is not used to
              access an object.

          If there is not enough available memory, realloc() shall return a
          null pointer and set errno to [ENOMEM].  If realloc() returns a
          null pointer and errno has been set to [ENOMEM], the memory
          referenced by ptr shall not be changed.


-----------------------------------------------------

::

          The realloc() function shall fail if:

          ENOMEM Insufficient memory is available.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The description of realloc() has been modified from previous
          versions of this standard to align with the ISO/IEC 9899:1999
          standard. Previous versions explicitly permitted a call to
          realloc(p, 0) to free the space pointed to by p and return a null
          pointer. While this behavior could be interpreted as permitted by
          this version of the standard, the C language committee have
          indicated that this interpretation is incorrect. Applications
          should assume that if realloc() returns a null pointer, the space
          pointed to by p has not been freed. Since this could lead to
          double-frees, implementations should also set errno if a null
          pointer actually indicates a failure, and applications should
          only free the space if errno was changed.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          This standard defers to the ISO C standard. While that standard
          currently has language that might permit realloc(p, 0), where p
          is not a null pointer, to free p while still returning a null
          pointer, the committee responsible for that standard is
          considering clarifying the language to explicitly prohibit that
          alternative.


---------------------------------------------------------

::

          calloc(3p), free(3p), malloc(3p)

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

   IEEE/The Open Group               2017                       REALLOC(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`calloc(3p) <../man3/calloc.3p.html>`__, 
`free(3p) <../man3/free.3p.html>`__, 
`getdelim(3p) <../man3/getdelim.3p.html>`__, 
`malloc(3) <../man3/malloc.3.html>`__, 
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
