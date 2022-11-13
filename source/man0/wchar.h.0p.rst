.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wchar.h(0p) — Linux manual page
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

   wchar.h(0P)             POSIX Programmer's Manual            wchar.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          wchar.h — wide-character handling


---------------------------------------------------------

::

          #include <wchar.h>


---------------------------------------------------------------

::

          Some of the functionality described on this reference page
          extends the ISO C standard. Applications shall define the
          appropriate feature test macro (see the System Interfaces volume
          of POSIX.1‐2017, Section 2.2, The Compilation Environment) to
          enable the visibility of these symbols in this header.

          The <wchar.h> header shall define the following types:

          FILE        As described in <stdio.h>.

          locale_t    As described in <locale.h>.

          mbstate_t   An object type other than an array type that can hold
                      the conversion state information necessary to convert
                      between sequences of (possibly multi-byte) characters
                      and wide characters.  If a codeset is being used such
                      that an mbstate_t needs to preserve more than two
                      levels of reserved state, the results are
                      unspecified.

          size_t      As described in <stddef.h>.

          va_list     As described in <stdarg.h>.

          wchar_t     As described in <stddef.h>.

          wctype_t    A scalar type of a data object that can hold values
                      which represent locale-specific character
                      classification.

          wint_t      An integer type capable of storing any valid value of
                      wchar_t or WEOF.

          The tag tm shall be declared as naming an incomplete structure
          type, the contents of which are described in the <time.h> header.

          The implementation shall support one or more programming
          environments in which the width of wint_t is no greater than the
          width of type long.  The names of these programming environments
          can be obtained using the confstr() function or the getconf
          utility.

          The <wchar.h> header shall define the following macros:

          WCHAR_MAX   As described in <stdint.h>.

          WCHAR_MIN   As described in <stdint.h>.

          WEOF        Constant expression of type wint_t that is returned
                      by several WP functions to indicate end-of-file.

          NULL        As described in <stddef.h>.

          Inclusion of the <wchar.h> header may make visible all symbols
          from the headers <ctype.h>, <string.h>, <stdarg.h>, <stddef.h>,
          <stdio.h>, <stdlib.h>, and <time.h>.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided for use
          with ISO C standard compilers. Arguments to functions in this
          list can point to arrays containing wchar_t values that do not
          correspond to members of the character set of the current locale.
          Such values shall be processed according to the specified
          semantics, unless otherwise stated.

              wint_t        btowc(int);
              wint_t        fgetwc(FILE *);
              wchar_t      *fgetws(wchar_t *restrict, int, FILE *restrict);
              wint_t        fputwc(wchar_t, FILE *);
              int           fputws(const wchar_t *restrict, FILE *restrict);
              int           fwide(FILE *, int);
              int           fwprintf(FILE *restrict, const wchar_t *restrict, ...);
              int           fwscanf(FILE *restrict, const wchar_t *restrict, ...);
              wint_t        getwc(FILE *);
              wint_t        getwchar(void);
              int           iswalnum(wint_t);
              int           iswalpha(wint_t);
              int           iswcntrl(wint_t);
              int           iswctype(wint_t, wctype_t);
              int           iswdigit(wint_t);
              int           iswgraph(wint_t);
              int           iswlower(wint_t);
              int           iswprint(wint_t);
              int           iswpunct(wint_t);
              int           iswspace(wint_t);
              int           iswupper(wint_t);
              int           iswxdigit(wint_t);
              size_t        mbrlen(const char *restrict, size_t, mbstate_t *restrict);
              size_t        mbrtowc(wchar_t *restrict, const char *restrict, size_t,
                                mbstate_t *restrict);
              int           mbsinit(const mbstate_t *);
              size_t        mbsnrtowcs(wchar_t *restrict, const char **restrict,
                                size_t, size_t, mbstate_t *restrict);
              size_t        mbsrtowcs(wchar_t *restrict, const char **restrict, size_t,
                                mbstate_t *restrict);
              FILE         *open_wmemstream(wchar_t **, size_t *);
              wint_t        putwc(wchar_t, FILE *);
              wint_t        putwchar(wchar_t);
              int           swprintf(wchar_t *restrict, size_t,
                                const wchar_t *restrict, ...);
              int           swscanf(const wchar_t *restrict,
                                const wchar_t *restrict, ...);
              wint_t        towlower(wint_t);
              wint_t        towupper(wint_t);
              wint_t        ungetwc(wint_t, FILE *);
              int           vfwprintf(FILE *restrict, const wchar_t *restrict, va_list);
              int           vfwscanf(FILE *restrict, const wchar_t *restrict, va_list);
              int           vswprintf(wchar_t *restrict, size_t,
                                const wchar_t *restrict, va_list);
              int           vswscanf(const wchar_t *restrict, const wchar_t *restrict,
                                va_list);
              int           vwprintf(const wchar_t *restrict, va_list);
              int           vwscanf(const wchar_t *restrict, va_list);
              wchar_t      *wcpcpy(wchar_t *restrict, const wchar_t *restrict);
              wchar_t      *wcpncpy(wchar_t *restrict, const wchar_t *restrict, size_t);
              size_t        wcrtomb(char *restrict, wchar_t, mbstate_t *restrict);
              int           wcscasecmp(const wchar_t *, const wchar_t *);
              int           wcscasecmp_l(const wchar_t *, const wchar_t *, locale_t);
              wchar_t      *wcscat(wchar_t *restrict, const wchar_t *restrict);
              wchar_t      *wcschr(const wchar_t *, wchar_t);
              int           wcscmp(const wchar_t *, const wchar_t *);
              int           wcscoll(const wchar_t *, const wchar_t *);
              int           wcscoll_l(const wchar_t *, const wchar_t *, locale_t);
              wchar_t      *wcscpy(wchar_t *restrict, const wchar_t *restrict);
              size_t        wcscspn(const wchar_t *, const wchar_t *);
              wchar_t      *wcsdup(const wchar_t *);
              size_t        wcsftime(wchar_t *restrict, size_t,
                                const wchar_t *restrict, const struct tm *restrict);
              size_t        wcslen(const wchar_t *);
              int           wcsncasecmp(const wchar_t *, const wchar_t *, size_t);
              int           wcsncasecmp_l(const wchar_t *, const wchar_t *, size_t,
                                locale_t);
              wchar_t      *wcsncat(wchar_t *restrict, const wchar_t *restrict, size_t);
              int           wcsncmp(const wchar_t *, const wchar_t *, size_t);
              wchar_t      *wcsncpy(wchar_t *restrict, const wchar_t *restrict, size_t);
              size_t        wcsnlen(const wchar_t *, size_t);
              size_t        wcsnrtombs(char *restrict, const wchar_t **restrict, size_t,
                                size_t, mbstate_t *restrict);
              wchar_t      *wcspbrk(const wchar_t *, const wchar_t *);
              wchar_t      *wcsrchr(const wchar_t *, wchar_t);
              size_t        wcsrtombs(char *restrict, const wchar_t **restrict,
                                size_t, mbstate_t *restrict);
              size_t        wcsspn(const wchar_t *, const wchar_t *);
              wchar_t      *wcsstr(const wchar_t *restrict, const wchar_t *restrict);
              double        wcstod(const wchar_t *restrict, wchar_t **restrict);
              float         wcstof(const wchar_t *restrict, wchar_t **restrict);
              wchar_t      *wcstok(wchar_t *restrict, const wchar_t *restrict,
                                wchar_t **restrict);
              long          wcstol(const wchar_t *restrict, wchar_t **restrict, int);
              long double   wcstold(const wchar_t *restrict, wchar_t **restrict);
              long long     wcstoll(const wchar_t *restrict, wchar_t **restrict, int);
              unsigned long wcstoul(const wchar_t *restrict, wchar_t **restrict, int);
              unsigned long long
                            wcstoull(const wchar_t *restrict, wchar_t **restrict, int);
              int           wcswidth(const wchar_t *, size_t);
              size_t        wcsxfrm(wchar_t *restrict, const wchar_t *restrict, size_t);
              size_t        wcsxfrm_l(wchar_t *restrict, const wchar_t *restrict,
                                size_t, locale_t);
              int           wctob(wint_t);
              wctype_t      wctype(const char *);
              int           wcwidth(wchar_t);
              wchar_t      *wmemchr(const wchar_t *, wchar_t, size_t);
              int           wmemcmp(const wchar_t *, const wchar_t *, size_t);
              wchar_t      *wmemcpy(wchar_t *restrict, const wchar_t *restrict, size_t);
              wchar_t      *wmemmove(wchar_t *, const wchar_t *, size_t);
              wchar_t      *wmemset(wchar_t *, wchar_t, size_t);
              int           wprintf(const wchar_t *restrict, ...);
              int           wscanf(const wchar_t *restrict, ...);

          The following sections are informative.


---------------------------------------------------------------------------

::

          The iswblank() function was a late addition to the ISO C standard
          and was introduced at the same time as the ISO C standard
          introduced <wctype.h>, which contains all of the isw*()
          functions. The Open Group Base Specifications had previously
          aligned with the MSE working draft and had introduced the rest of
          the isw*() functions into <wchar.h>.  For backwards-
          compatibility, the original set of isw*() functions, without
          iswblank(), are permitted (as part of the XSI option) in
          <wchar.h>.  For maximum portability, applications should include
          <wctype.h> in order to obtain declarations for the isw*()
          functions. This compatibility has been made obsolescent.


-----------------------------------------------------------

::

          In the ISO C standard, the symbols referenced as XSI extensions
          are in <wctype.h>.  Their presence here is thus an extension.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          ctype.h(0p), locale.h(0p), stdarg.h(0p), stddef.h(0p),
          stdint.h(0p), stdio.h(0p), stdlib.h(0p), string.h(0p),
          time.h(0p), wctype.h(0p)

          The System Interfaces volume of POSIX.1‐2017, Section 2.2, The
          Compilation Environment, btowc(3p), confstr(3p), fgetwc(3p),
          fgetws(3p), fputwc(3p), fputws(3p), fwide(3p), fwprintf(3p),
          fwscanf(3p), getwc(3p), getwchar(3p), iswalnum(3p), iswalpha(3p),
          iswcntrl(3p), iswctype(3p), iswdigit(3p), iswgraph(3p),
          iswlower(3p), iswprint(3p), iswpunct(3p), iswspace(3p),
          iswupper(3p), iswxdigit(3p), mbrlen(3p), mbrtowc(3p),
          mbsinit(3p), mbsrtowcs(3p), open_memstream(3p), putwc(3p),
          putwchar(3p), towlower(3p), towupper(3p), ungetwc(3p),
          vfwprintf(3p), vfwscanf(3p), wcrtomb(3p), wcscasecmp(3p),
          wcscat(3p), wcschr(3p), wcscmp(3p), wcscoll(3p), wcscpy(3p),
          wcscspn(3p), wcsdup(3p), wcsftime(3p), wcslen(3p), wcsncat(3p),
          wcsncmp(3p), wcsncpy(3p), wcspbrk(3p), wcsrchr(3p),
          wcsrtombs(3p), wcsspn(3p), wcsstr(3p), wcstod(3p), wcstok(3p),
          wcstol(3p), wcstoul(3p), wcswidth(3p), wcsxfrm(3p), wctob(3p),
          wctype(3p), wcwidth(3p), wmemchr(3p), wmemcmp(3p), wmemcpy(3p),
          wmemmove(3p), wmemset(3p)

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

   IEEE/The Open Group               2017                       wchar.h(0P)

--------------

Pages that refer to this page:
`float.h(0p) <../man0/float.h.0p.html>`__, 
`stddef.h(0p) <../man0/stddef.h.0p.html>`__, 
`stdint.h(0p) <../man0/stdint.h.0p.html>`__, 
`wctype.h(0p) <../man0/wctype.h.0p.html>`__, 
`btowc(3p) <../man3/btowc.3p.html>`__, 
`fgetwc(3p) <../man3/fgetwc.3p.html>`__, 
`fgetws(3p) <../man3/fgetws.3p.html>`__, 
`fprintf(3p) <../man3/fprintf.3p.html>`__, 
`fputwc(3p) <../man3/fputwc.3p.html>`__, 
`fputws(3p) <../man3/fputws.3p.html>`__, 
`fscanf(3p) <../man3/fscanf.3p.html>`__, 
`fwide(3p) <../man3/fwide.3p.html>`__, 
`fwprintf(3p) <../man3/fwprintf.3p.html>`__, 
`fwscanf(3p) <../man3/fwscanf.3p.html>`__, 
`getwc(3p) <../man3/getwc.3p.html>`__, 
`getwchar(3p) <../man3/getwchar.3p.html>`__, 
`mbrlen(3p) <../man3/mbrlen.3p.html>`__, 
`mbrtowc(3p) <../man3/mbrtowc.3p.html>`__, 
`mbsinit(3p) <../man3/mbsinit.3p.html>`__, 
`mbsrtowcs(3p) <../man3/mbsrtowcs.3p.html>`__, 
`open_memstream(3p) <../man3/open_memstream.3p.html>`__, 
`putwc(3p) <../man3/putwc.3p.html>`__, 
`putwchar(3p) <../man3/putwchar.3p.html>`__, 
`ungetwc(3p) <../man3/ungetwc.3p.html>`__, 
`vfwprintf(3p) <../man3/vfwprintf.3p.html>`__, 
`vfwscanf(3p) <../man3/vfwscanf.3p.html>`__, 
`wcrtomb(3p) <../man3/wcrtomb.3p.html>`__, 
`wcscasecmp(3p) <../man3/wcscasecmp.3p.html>`__, 
`wcscat(3p) <../man3/wcscat.3p.html>`__, 
`wcschr(3p) <../man3/wcschr.3p.html>`__, 
`wcscmp(3p) <../man3/wcscmp.3p.html>`__, 
`wcscoll(3p) <../man3/wcscoll.3p.html>`__, 
`wcscpy(3p) <../man3/wcscpy.3p.html>`__, 
`wcscspn(3p) <../man3/wcscspn.3p.html>`__, 
`wcsdup(3p) <../man3/wcsdup.3p.html>`__, 
`wcsftime(3p) <../man3/wcsftime.3p.html>`__, 
`wcslen(3p) <../man3/wcslen.3p.html>`__, 
`wcsncat(3p) <../man3/wcsncat.3p.html>`__, 
`wcsncmp(3p) <../man3/wcsncmp.3p.html>`__, 
`wcsncpy(3p) <../man3/wcsncpy.3p.html>`__, 
`wcspbrk(3p) <../man3/wcspbrk.3p.html>`__, 
`wcsrchr(3p) <../man3/wcsrchr.3p.html>`__, 
`wcsrtombs(3p) <../man3/wcsrtombs.3p.html>`__, 
`wcsspn(3p) <../man3/wcsspn.3p.html>`__, 
`wcsstr(3p) <../man3/wcsstr.3p.html>`__, 
`wcstod(3p) <../man3/wcstod.3p.html>`__, 
`wcstok(3p) <../man3/wcstok.3p.html>`__, 
`wcstol(3p) <../man3/wcstol.3p.html>`__, 
`wcstoul(3p) <../man3/wcstoul.3p.html>`__, 
`wcswidth(3p) <../man3/wcswidth.3p.html>`__, 
`wcsxfrm(3p) <../man3/wcsxfrm.3p.html>`__, 
`wctob(3p) <../man3/wctob.3p.html>`__, 
`wcwidth(3p) <../man3/wcwidth.3p.html>`__, 
`wmemchr(3p) <../man3/wmemchr.3p.html>`__, 
`wmemcmp(3p) <../man3/wmemcmp.3p.html>`__, 
`wmemcpy(3p) <../man3/wmemcpy.3p.html>`__, 
`wmemmove(3p) <../man3/wmemmove.3p.html>`__, 
`wmemset(3p) <../man3/wmemset.3p.html>`__

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
