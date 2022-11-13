.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

locale.h(0p) — Linux manual page
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

   locale.h(0P)            POSIX Programmer's Manual           locale.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          locale.h — category macros


---------------------------------------------------------

::

          #include <locale.h>


---------------------------------------------------------------

::

          Some of the functionality described on this reference page
          extends the ISO C standard. Applications shall define the
          appropriate feature test macro (see the System Interfaces volume
          of POSIX.1‐2017, Section 2.2, The Compilation Environment) to
          enable the visibility of these symbols in this header.

          The <locale.h> header shall define the lconv structure, which
          shall include at least the following members.  (See the
          definitions of LC_MONETARY in Section 7.3.3, LC_MONETARY and
          Section 7.3.4, LC_NUMERIC.)

              char    *currency_symbol
              char    *decimal_point
              char     frac_digits
              char    *grouping
              char    *int_curr_symbol
              char     int_frac_digits
              char     int_n_cs_precedes
              char     int_n_sep_by_space
              char     int_n_sign_posn
              char     int_p_cs_precedes
              char     int_p_sep_by_space
              char     int_p_sign_posn
              char    *mon_decimal_point
              char    *mon_grouping
              char    *mon_thousands_sep
              char    *negative_sign
              char     n_cs_precedes
              char     n_sep_by_space
              char     n_sign_posn
              char    *positive_sign
              char     p_cs_precedes
              char     p_sep_by_space
              char     p_sign_posn
              char    *thousands_sep

          The <locale.h> header shall define NULL (as described in
          <stddef.h>) and at least the following as macros:

          LC_ALL
          LC_COLLATE
          LC_CTYPE
          LC_MESSAGES
          LC_MONETARY
          LC_NUMERIC
          LC_TIME

          which shall expand to integer constant expressions with distinct
          values for use as the first argument to the setlocale() function.

          Additional macro definitions, beginning with the characters LC_
          and an uppercase letter, may also be specified by the
          implementation.

          The <locale.h> header shall contain at least the following macros
          representing bitmasks for use with the newlocale() function for
          each supported locale category: LC_COLLATE_MASK LC_CTYPE_MASK
          LC_MESSAGES_MASK LC_MONETARY_MASK LC_NUMERIC_MASK LC_TIME_MASK

          In addition, a macro to set the bits for all categories set shall
          be defined: LC_ALL_MASK

          The <locale.h> header shall define LC_GLOBAL_LOCALE, a special
          locale object descriptor used by the duplocale() and uselocale()
          functions.

          The <locale.h> header shall define the locale_t type,
          representing a locale object.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided for use
          with ISO C standard compilers.

              locale_t      duplocale(locale_t);
              void          freelocale(locale_t);
              struct lconv *localeconv(void);
              locale_t      newlocale(int, const char *, locale_t);
              char         *setlocale(int, const char *);
              locale_t      uselocale (locale_t);

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          It is suggested that each category macro name for use in
          setlocale() have a corresponding macro name ending in _MASK for
          use in newlocale().


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Chapter 8, Environment Variables, stddef.h(0p)

          The System Interfaces volume of POSIX.1‐2017, duplocale(3p),
          freelocale(3p), localeconv(3p), newlocale(3p), setlocale(3p),
          uselocale(3p)


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

   IEEE/The Open Group               2017                      locale.h(0P)

--------------

Pages that refer to this page:
`ctype.h(0p) <../man0/ctype.h.0p.html>`__, 
`langinfo.h(0p) <../man0/langinfo.h.0p.html>`__, 
`monetary.h(0p) <../man0/monetary.h.0p.html>`__, 
`string.h(0p) <../man0/string.h.0p.html>`__, 
`strings.h(0p) <../man0/strings.h.0p.html>`__, 
`time.h(0p) <../man0/time.h.0p.html>`__, 
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`wctype.h(0p) <../man0/wctype.h.0p.html>`__, 
`duplocale(3p) <../man3/duplocale.3p.html>`__, 
`freelocale(3p) <../man3/freelocale.3p.html>`__, 
`isalpha(3p) <../man3/isalpha.3p.html>`__, 
`isblank(3p) <../man3/isblank.3p.html>`__, 
`iscntrl(3p) <../man3/iscntrl.3p.html>`__, 
`isdigit(3p) <../man3/isdigit.3p.html>`__, 
`isgraph(3p) <../man3/isgraph.3p.html>`__, 
`islower(3p) <../man3/islower.3p.html>`__, 
`isprint(3p) <../man3/isprint.3p.html>`__, 
`ispunct(3p) <../man3/ispunct.3p.html>`__, 
`isspace(3p) <../man3/isspace.3p.html>`__, 
`isupper(3p) <../man3/isupper.3p.html>`__, 
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
`localeconv(3p) <../man3/localeconv.3p.html>`__, 
`newlocale(3p) <../man3/newlocale.3p.html>`__, 
`nl_langinfo(3p) <../man3/nl_langinfo.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__, 
`tolower(3p) <../man3/tolower.3p.html>`__, 
`toupper(3p) <../man3/toupper.3p.html>`__, 
`towlower(3p) <../man3/towlower.3p.html>`__, 
`towupper(3p) <../man3/towupper.3p.html>`__, 
`uselocale(3p) <../man3/uselocale.3p.html>`__

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
