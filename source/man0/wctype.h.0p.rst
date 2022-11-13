.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wctype.h(0p) — Linux manual page
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

   wctype.h(0P)            POSIX Programmer's Manual           wctype.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          wctype.h — wide-character classification and mapping utilities


---------------------------------------------------------

::

          #include <wctype.h>


---------------------------------------------------------------

::

          Some of the functionality described on this reference page
          extends the ISO C standard. Applications shall define the
          appropriate feature test macro (see the System Interfaces volume
          of POSIX.1‐2017, Section 2.2, The Compilation Environment) to
          enable the visibility of these symbols in this header.

          The <wctype.h> header shall define the following types:

          wint_t      As described in <wchar.h>.

          wctrans_t   A scalar type that can hold values which represent
                      locale-specific character mappings.

          wctype_t    As described in <wchar.h>.

          The <wctype.h> header shall define the locale_t type as described
          in <locale.h>.

          The <wctype.h> header shall define the following macro:

          WEOF        As described in <wchar.h>.

          For all functions described in this header that accept an
          argument of type wint_t, the value is representable as a wchar_t
          or equals the value of WEOF. If this argument has any other
          value, the behavior is undefined.

          The behavior of these functions shall be affected by the LC_CTYPE
          category of the current locale.

          Inclusion of the <wctype.h> header may make visible all symbols
          from the headers <ctype.h>, <stdarg.h>, <stddef.h>, <stdio.h>,
          <stdlib.h>, <string.h>, <time.h>, and <wchar.h>.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided for use
          with ISO C standard compilers.

              int       iswalnum(wint_t);
              int       iswalnum_l(wint_t, locale_t);
              int       iswalpha(wint_t);
              int       iswalpha_l(wint_t, locale_t);
              int       iswblank(wint_t);
              int       iswblank_l(wint_t, locale_t);
              int       iswcntrl(wint_t);
              int       iswcntrl_l(wint_t, locale_t);
              int       iswctype(wint_t, wctype_t);
              int       iswctype_l(wint_t, wctype_t, locale_t);
              int       iswdigit(wint_t);
              int       iswdigit_l(wint_t, locale_t);
              int       iswgraph(wint_t);
              int       iswgraph_l(wint_t, locale_t);
              int       iswlower(wint_t);
              int       iswlower_l(wint_t, locale_t);
              int       iswprint(wint_t);
              int       iswprint_l(wint_t, locale_t);
              int       iswpunct(wint_t);
              int       iswpunct_l(wint_t, locale_t);
              int       iswspace(wint_t);
              int       iswspace_l(wint_t, locale_t);
              int       iswupper(wint_t);
              int       iswupper_l(wint_t, locale_t);
              int       iswxdigit(wint_t);
              int       iswxdigit_l(wint_t, locale_t);
              wint_t    towctrans(wint_t, wctrans_t);
              wint_t    towctrans_l(wint_t, wctrans_t, locale_t);
              wint_t    towlower(wint_t);
              wint_t    towlower_l(wint_t, locale_t);
              wint_t    towupper(wint_t);
              wint_t    towupper_l(wint_t, locale_t);
              wctrans_t wctrans(const char *);
              wctrans_t wctrans_l(const char *, locale_t);
              wctype_t  wctype(const char *);
              wctype_t  wctype_l(const char *, locale_t);

          The following sections are informative.


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

          ctype.h(0p), locale.h(0p), stdarg.h(0p), stddef.h(0p),
          stdio.h(0p), stdlib.h(0p), string.h(0p), time.h(0p), wchar.h(0p)

          The System Interfaces volume of POSIX.1‐2017, Section 2.2, The
          Compilation Environment, iswalnum(3p), iswalpha(3p),
          iswblank(3p), iswcntrl(3p), iswctype(3p), iswdigit(3p),
          iswgraph(3p), iswlower(3p), iswprint(3p), iswpunct(3p),
          iswspace(3p), iswupper(3p), iswxdigit(3p), setlocale(3p),
          towctrans(3p), towlower(3p), towupper(3p), wctrans(3p),
          wctype(3p)


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

   IEEE/The Open Group               2017                      wctype.h(0P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`iswalnum(3p) <../man3/iswalnum.3p.html>`__, 
`iswalpha(3p) <../man3/iswalpha.3p.html>`__, 
`iswblank(3p) <../man3/iswblank.3p.html>`__, 
`iswcntrl(3p) <../man3/iswcntrl.3p.html>`__, 
`iswctype(3p) <../man3/iswctype.3p.html>`__, 
`iswdigit(3p) <../man3/iswdigit.3p.html>`__, 
`iswgraph(3p) <../man3/iswgraph.3p.html>`__, 
`iswlower(3p) <../man3/iswlower.3p.html>`__, 
`iswprint(3p) <../man3/iswprint.3p.html>`__, 
`iswpunct(3p) <../man3/iswpunct.3p.html>`__, 
`iswspace(3p) <../man3/iswspace.3p.html>`__, 
`iswupper(3p) <../man3/iswupper.3p.html>`__, 
`iswxdigit(3p) <../man3/iswxdigit.3p.html>`__, 
`towctrans(3p) <../man3/towctrans.3p.html>`__, 
`towlower(3p) <../man3/towlower.3p.html>`__, 
`towupper(3p) <../man3/towupper.3p.html>`__, 
`wctrans(3p) <../man3/wctrans.3p.html>`__, 
`wctype(3p) <../man3/wctype.3p.html>`__

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
