.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nl_langinfo(3p) — Linux manual page
===================================

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

   NL_LANGINFO(3P)         POSIX Programmer's Manual        NL_LANGINFO(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          nl_langinfo, nl_langinfo_l — language information


---------------------------------------------------------

::

          #include <langinfo.h>

          char *nl_langinfo(nl_item item);
          char *nl_langinfo_l(nl_item item, locale_t locale);


---------------------------------------------------------------

::

          The nl_langinfo() and nl_langinfo_l() functions shall return a
          pointer to a string containing information relevant to the
          particular language or cultural area defined in the current
          locale, or in the locale represented by locale, respectively (see
          <langinfo.h>).  The manifest constant names and values of item
          are defined in <langinfo.h>.  For example:

              nl_langinfo(ABDAY_1)

          would return a pointer to the string "Dom" if the identified
          language was Portuguese, and "Sun" if the identified language was
          English.

              nl_langinfo_l(ABDAY_1, loc)

          would return a pointer to the string "Dom" if the identified
          language of the locale represented by loc was Portuguese, and
          "Sun" if the identified language of the locale represented by loc
          was English.

          The nl_langinfo() function need not be thread-safe.

          The behavior is undefined if the locale argument to
          nl_langinfo_l() is the special locale object LC_GLOBAL_LOCALE or
          is not a valid locale object handle.


-----------------------------------------------------------------

::

          In a locale where langinfo data is not defined, these functions
          shall return a pointer to the corresponding string in the POSIX
          locale. In all locales, these functions shall return a pointer to
          an empty string if item contains an invalid setting.

          The application shall not modify the string returned. The pointer
          returned by nl_langinfo() might be invalidated or the string
          content might be overwritten by a subsequent call to
          nl_langinfo() in any thread or to nl_langinfo_l() in the same
          thread or the initial thread, by subsequent calls to setlocale()
          with a category corresponding to the category of item (see
          <langinfo.h>) or the category LC_ALL, or by subsequent calls to
          uselocale() which change the category corresponding to the
          category of item.  The pointer returned by nl_langinfo_l() might
          be invalidated or the string content might be overwritten by a
          subsequent call to nl_langinfo_l() in the same thread or to
          nl_langinfo() in any thread, or by subsequent calls to
          freelocale() or newlocale() which free or modify the locale
          object that was passed to nl_langinfo_l().  The returned pointer
          and the string content might also be invalidated if the calling
          thread is terminated.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

      Getting Date and Time Formatting Information
          The following example returns a pointer to a string containing
          date and time formatting information, as defined in the LC_TIME
          category of the current locale.

              #include <time.h>
              #include <langinfo.h>
              ...
              strftime(datestring, sizeof(datestring), nl_langinfo(D_T_FMT), tm);
              ...


---------------------------------------------------------------------------

::

          The array pointed to by the return value should not be modified
          by the program, but may be modified by further calls to these
          functions.


-----------------------------------------------------------

::

          The possible interactions between internal data used by
          nl_langinfo() and nl_langinfo_l() are complicated by the fact
          that nl_langinfo_l() must be thread-safe but nl_langinfo() need
          not be. The various implementation choices are:

           1. nl_langinfo_l() and nl_langinfo() use separate buffers, or at
              least one of them does not use an internal string buffer. In
              this case there are no interactions.

           2. nl_langinfo_l() and nl_langinfo() share an internal per-
              thread buffer. There can be interactions, but only in the
              same thread.

           3. nl_langinfo_l() uses an internal per-thread buffer, and
              nl_langinfo() uses (in all threads) the same buffer that
              nl_langinfo_l() uses in the initial thread. There can be
              interactions, but only when nl_langinfo_l() is called in the
              initial thread.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          setlocale(3p), uselocale(3p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 7, Locale,
          langinfo.h(0p), locale.h(0p), nl_types.h(0p)


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

   IEEE/The Open Group               2017                   NL_LANGINFO(3P)

--------------

Pages that refer to this page:
`langinfo.h(0p) <../man0/langinfo.h.0p.html>`__, 
`nl_types.h(0p) <../man0/nl_types.h.0p.html>`__, 
`localeconv(3p) <../man3/localeconv.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__

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
