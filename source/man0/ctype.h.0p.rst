.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ctype.h(0p) — Linux manual page
===============================

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

   ctype.h(0P)             POSIX Programmer's Manual            ctype.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          ctype.h — character types


---------------------------------------------------------

::

          #include <ctype.h>


---------------------------------------------------------------

::

          Some of the functionality described on this reference page
          extends the ISO C standard. Applications shall define the
          appropriate feature test macro (see the System Interfaces volume
          of POSIX.1‐2017, Section 2.2, The Compilation Environment) to
          enable the visibility of these symbols in this header.

          The <ctype.h> header shall define the locale_t type as described
          in <locale.h>, representing a locale object.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided for use
          with ISO C standard compilers.

              int   isalnum(int);
              int   isalnum_l(int, locale_t);
              int   isalpha(int);
              int   isalpha_l(int, locale_t);
              int   isascii(int);
              int   isblank(int);
              int   isblank_l(int, locale_t);
              int   iscntrl(int);
              int   iscntrl_l(int, locale_t);
              int   isdigit(int);
              int   isdigit_l(int, locale_t);
              int   isgraph(int);
              int   isgraph_l(int, locale_t);
              int   islower(int);
              int   islower_l(int, locale_t);
              int   isprint(int);
              int   isprint_l(int, locale_t);
              int   ispunct(int);
              int   ispunct_l(int, locale_t);
              int   isspace(int);
              int   isspace_l(int, locale_t);
              int   isupper(int);
              int   isupper_l(int, locale_t);
              int   isxdigit(int);
              int   isxdigit_l(int, locale_t);
              int   toascii(int);
              int   tolower(int);
              int   tolower_l(int, locale_t);
              int   toupper(int);
              int   toupper_l(int, locale_t);

          The <ctype.h> header shall define the following as macros:

              int   _toupper(int);
              int   _tolower(int);

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

          locale.h(0p)

          The System Interfaces volume of POSIX.1‐2017, Section 2.2, The
          Compilation Environment, isalnum(3p), isalpha(3p), isascii(3p),
          isblank(3p), iscntrl(3p), isdigit(3p), isgraph(3p), islower(3p),
          isprint(3p), ispunct(3p), isspace(3p), isupper(3p), isxdigit(3p),
          mblen(3p), mbstowcs(3p), mbtowc(3p), setlocale(3p), toascii(3p),
          tolower(3p), _tolower(3p), toupper(3p), _toupper(3p),
          wcstombs(3p), wctomb(3p)


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

   IEEE/The Open Group               2017                       ctype.h(0P)

--------------

Pages that refer to this page:
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`wctype.h(0p) <../man0/wctype.h.0p.html>`__, 
`isalnum(3p) <../man3/isalnum.3p.html>`__, 
`isalpha(3p) <../man3/isalpha.3p.html>`__, 
`isascii(3p) <../man3/isascii.3p.html>`__, 
`isblank(3p) <../man3/isblank.3p.html>`__, 
`iscntrl(3p) <../man3/iscntrl.3p.html>`__, 
`isdigit(3p) <../man3/isdigit.3p.html>`__, 
`isgraph(3p) <../man3/isgraph.3p.html>`__, 
`islower(3p) <../man3/islower.3p.html>`__, 
`isprint(3p) <../man3/isprint.3p.html>`__, 
`ispunct(3p) <../man3/ispunct.3p.html>`__, 
`isspace(3p) <../man3/isspace.3p.html>`__, 
`isupper(3p) <../man3/isupper.3p.html>`__, 
`isxdigit(3p) <../man3/isxdigit.3p.html>`__, 
`toascii(3p) <../man3/toascii.3p.html>`__, 
`tolower(3p) <../man3/tolower.3p.html>`__, 
`\_tolower(3p) <../man3/_tolower.3p.html>`__, 
`toupper(3p) <../man3/toupper.3p.html>`__, 
`\_toupper(3p) <../man3/_toupper.3p.html>`__

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
