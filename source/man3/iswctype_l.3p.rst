.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iswctype(3p) — Linux manual page
================================

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

   ISWCTYPE(3P)            POSIX Programmer's Manual           ISWCTYPE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          iswctype, iswctype_l — test character for a specified class


---------------------------------------------------------

::

          #include <wctype.h>

          int iswctype(wint_t wc, wctype_t charclass);
          int iswctype_l(wint_t wc, wctype_t charclass,
              locale_t locale);


---------------------------------------------------------------

::

          For iswctype(): The functionality described on this reference
          page is aligned with the ISO C standard. Any conflict between the
          requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The iswctype() and iswctype_l() functions shall determine whether
          the wide-character code wc has the character class charclass,
          returning true or false. The iswctype() and iswctype_l()
          functions are defined on WEOF and wide-character codes
          corresponding to the valid character encodings in the current
          locale, or in the locale represented by locale, respectively. If
          the wc argument is not in the domain of the function, the result
          is undefined.  If the value of charclass is invalid (that is, not
          obtained by a call to wctype() or charclass is invalidated by a
          subsequent call to setlocale() that has affected category
          LC_CTYPE) the result is unspecified.

          The behavior is undefined if the locale argument to iswctype_l()
          is the special locale object LC_GLOBAL_LOCALE or is not a valid
          locale object handle.


-----------------------------------------------------------------

::

          The iswctype() and iswctype_l() functions shall return non-zero
          (true) if and only if wc has the property described by charclass.
          If charclass is (wctype_t)0, these functions shall return 0.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

      Testing for a Valid Character
              #include <wctype.h>
              ...
              int yes_or_no;
              wint_t wc;
              wctype_t valid_class;
              ...
              if ((valid_class=wctype("vowel")) == (wctype_t)0)
                  /* Invalid character class. */
              yes_or_no=iswctype(wc,valid_class);


---------------------------------------------------------------------------

::

          The twelve strings "alnum", "alpha", "blank", "cntrl", "digit",
          "graph", "lower", "print", "punct", "space", "upper", and
          "xdigit" are reserved for the standard character classes. In the
          table below, the functions in the left column are equivalent to
          the functions in the right column.

              iswalnum(wc)            iswctype(wc, wctype("alnum"))
              iswalnum_l(wc, locale)  iswctype_l(wc, wctype("alnum"), locale)
              iswalpha(wc)            iswctype(wc, wctype("alpha"))
              iswalpha_l(wc, locale)  iswctype_l(wc, wctype("alpha"), locale)
              iswblank(wc)            iswctype(wc, wctype("blank"))
              iswblank_l(wc, locale)  iswctype_l(wc, wctype("blank"), locale)
              iswcntrl(wc)            iswctype(wc, wctype("cntrl"))
              iswcntrl_l(wc, locale)  iswctype_l(wc, wctype("cntrl"), locale)
              iswdigit(wc)            iswctype(wc, wctype("digit"))
              iswdigit_l(wc, locale)  iswctype_l(wc, wctype("digit"), locale)
              iswgraph(wc)            iswctype(wc, wctype("graph"))
              iswgraph_l(wc, locale)  iswctype_l(wc, wctype("graph"), locale)
              iswlower(wc)            iswctype(wc, wctype("lower"))
              iswlower_l(wc, locale)  iswctype_l(wc, wctype("lower"), locale)
              iswprint(wc)            iswctype(wc, wctype("print"))
              iswprint_l(wc, locale)  iswctype_l(wc, wctype("print"), locale)
              iswpunct(wc)            iswctype(wc, wctype("punct"))
              iswpunct_l(wc, locale)  iswctype_l(wc, wctype("punct"), locale)
              iswspace(wc)            iswctype(wc, wctype("space"))
              iswspace_l(wc, locale)  iswctype_l(wc, wctype("space"), locale)
              iswupper(wc)            iswctype(wc, wctype("upper"))
              iswupper_l(wc, locale)  iswctype_l(wc, wctype("upper"), locale)
              iswxdigit(wc)           iswctype(wc, wctype("xdigit"))
              iswxdigit_l(wc, locale) iswctype_l(wc, wctype("xdigit"), locale)


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          iswalnum(3p), iswalpha(3p), iswcntrl(3p), iswdigit(3p),
          iswgraph(3p), iswlower(3p), iswprint(3p), iswpunct(3p),
          iswspace(3p), iswupper(3p), iswxdigit(3p), setlocale(3p),
          uselocale(3p), wctype(3p)

          The Base Definitions volume of POSIX.1‐2017, locale.h(0p),
          wctype.h(0p)


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

   IEEE/The Open Group               2017                      ISWCTYPE(3P)

--------------

Pages that refer to this page:
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`wctype.h(0p) <../man0/wctype.h.0p.html>`__, 
`iswalnum(3p) <../man3/iswalnum.3p.html>`__, 
`iswalpha(3p) <../man3/iswalpha.3p.html>`__, 
`iswblank(3p) <../man3/iswblank.3p.html>`__, 
`iswcntrl(3p) <../man3/iswcntrl.3p.html>`__, 
`iswdigit(3p) <../man3/iswdigit.3p.html>`__, 
`iswgraph(3p) <../man3/iswgraph.3p.html>`__, 
`iswlower(3p) <../man3/iswlower.3p.html>`__, 
`iswprint(3p) <../man3/iswprint.3p.html>`__, 
`iswpunct(3p) <../man3/iswpunct.3p.html>`__, 
`iswspace(3p) <../man3/iswspace.3p.html>`__, 
`iswupper(3p) <../man3/iswupper.3p.html>`__, 
`iswxdigit(3p) <../man3/iswxdigit.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__, 
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
