.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stddef.h(0p) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   stddef.h(0P)            POSIX Programmer's Manual           stddef.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          stddef.h — standard type definitions


---------------------------------------------------------

::

          #include <stddef.h>


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The <stddef.h> header shall define the following macros:

          NULL      Null pointer constant.  The macro shall expand to an
                    integer constant expression with the value 0 cast to
                    type void *.

          offsetof(type, member-designator)
                    Integer constant expression of type size_t, the value
                    of which is the offset in bytes to the structure member
                    (member-designator), from the beginning of its
                    structure (type).

          The <stddef.h> header shall define the following types:

          ptrdiff_t Signed integer type of the result of subtracting two
                    pointers.

          wchar_t   Integer type whose range of values can represent
                    distinct codes for all members of the largest extended
                    character set specified among the supported locales;
                    the null character shall have the code value zero. Each
                    member of the basic character set shall have a code
                    value equal to its value when used as the lone
                    character in an integer character constant if an
                    implementation does not define
                    __STDC_MB_MIGHT_NEQ_WC__.

          size_t    Unsigned integer type of the result of the sizeof
                    operator.

          The implementation shall support one or more programming
          environments in which the widths of ptrdiff_t, size_t, and
          wchar_t are no greater than the width of type long.  The names of
          these programming environments can be obtained using the
          confstr() function or the getconf utility.

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The ISO C standard does not require the NULL macro to include the
          cast to type void * and specifies that the NULL macro be
          implementation-defined. POSIX.1‐2008 requires the cast and
          therefore need not be implementation-defined.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          sys_types.h(0p), wchar.h(0p)

          The System Interfaces volume of POSIX.1‐2017, confstr(3p)

          The Shell and Utilities volume of POSIX.1‐2017, getconf(1p)


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

   IEEE/The Open Group               2017                      stddef.h(0P)

--------------

Pages that refer to this page:
`inttypes.h(0p) <../man0/inttypes.h.0p.html>`__, 
`locale.h(0p) <../man0/locale.h.0p.html>`__, 
`math.h(0p) <../man0/math.h.0p.html>`__, 
`monetary.h(0p) <../man0/monetary.h.0p.html>`__, 
`ndbm.h(0p) <../man0/ndbm.h.0p.html>`__, 
`stdint.h(0p) <../man0/stdint.h.0p.html>`__, 
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`string.h(0p) <../man0/string.h.0p.html>`__, 
`time.h(0p) <../man0/time.h.0p.html>`__, 
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`wctype.h(0p) <../man0/wctype.h.0p.html>`__, 
`wordexp.h(0p) <../man0/wordexp.h.0p.html>`__, 
`wcstoimax(3p) <../man3/wcstoimax.3p.html>`__

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
