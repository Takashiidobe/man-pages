.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setlocale(3p) — Linux manual page
=================================

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

   SETLOCALE(3P)           POSIX Programmer's Manual          SETLOCALE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          setlocale — set program locale


---------------------------------------------------------

::

          #include <locale.h>

          char *setlocale(int category, const char *locale);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The setlocale() function selects the appropriate piece of the
          global locale, as specified by the category and locale arguments,
          and can be used to change or query the entire global locale or
          portions thereof. The value LC_ALL for category names the entire
          global locale; other values for category name only a part of the
          global locale:

          LC_COLLATE  Affects the behavior of regular expressions and the
                      collation functions.

          LC_CTYPE    Affects the behavior of regular expressions,
                      character classification, character conversion
                      functions, and wide-character functions.

          LC_MESSAGES Affects the affirmative and negative response
                      expressions returned by nl_langinfo() and the way
                      message catalogs are located. It may also affect the
                      behavior of functions that return or write message
                      strings.

          LC_MONETARY Affects the behavior of functions that handle
                      monetary values.

          LC_NUMERIC  Affects the behavior of functions that handle numeric
                      values.

          LC_TIME     Affects the behavior of the time conversion
                      functions.

          The locale argument is a pointer to a character string containing
          the required setting of category.  The contents of this string
          are implementation-defined. In addition, the following preset
          values of locale are defined for all settings of category:

          "POSIX"     Specifies the minimal environment for C-language
                      translation called the POSIX locale. The POSIX locale
                      is the default global locale at entry to main().

          "C"         Equivalent to "POSIX".

          ""          Specifies an implementation-defined native
                      environment.  The determination of the name of the
                      new locale for the specified category depends on the
                      value of the associated environment variables, LC_*
                      and LANG; see the Base Definitions volume of
                      POSIX.1‐2017, Chapter 7, Locale and Chapter 8,
                      Environment Variables.

          A null pointer
                      Directs setlocale() to query the current global
                      locale setting and return the name of the locale if
                      category is not LC_ALL, or a string which encodes the
                      locale name(s) for all of the individual categories
                      if category is LC_ALL.

          Setting all of the categories of the global locale is similar to
          successively setting each individual category of the global
          locale, except that all error checking is done before any actions
          are performed. To set all the categories of the global locale,
          setlocale() can be invoked as:

              setlocale(LC_ALL, "");

          In this case, setlocale() shall first verify that the values of
          all the environment variables it needs according to the
          precedence rules (described in the Base Definitions volume of
          POSIX.1‐2017, Chapter 8, Environment Variables) indicate
          supported locales. If the value of any of these environment
          variable searches yields a locale that is not supported (and non-
          null), setlocale() shall return a null pointer and the global
          locale shall not be changed. If all environment variables name
          supported locales, setlocale() shall proceed as if it had been
          called for each category, using the appropriate value from the
          associated environment variable or from the implementation-
          defined default if there is no such value.

          The global locale established using setlocale() shall only be
          used in threads for which no current locale has been set using
          uselocale() or whose current locale has been set to the global
          locale using uselocale(LC_GLOBAL_LOCALE).

          The implementation shall behave as if no function defined in this
          volume of POSIX.1‐2017 calls setlocale().

          The setlocale() function need not be thread-safe.


-----------------------------------------------------------------

::

          Upon successful completion, setlocale() shall return the string
          associated with the specified category for the new locale.
          Otherwise, setlocale() shall return a null pointer and the global
          locale shall not be changed.

          A null pointer for locale shall cause setlocale() to return a
          pointer to the string associated with the specified category for
          the current global locale. The global locale shall not be
          changed.

          The string returned by setlocale() is such that a subsequent call
          with that string and its associated category shall restore that
          part of the global locale. The application shall not modify the
          string returned.  The returned string pointer might be
          invalidated or the string content might be overwritten by a
          subsequent call to setlocale().  The returned pointer might also
          be invalidated if the calling thread is terminated.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The following code illustrates how a program can initialize the
          international environment for one language, while selectively
          modifying the global locale such that regular expressions and
          string operations can be applied to text recorded in a different
          language:

              setlocale(LC_ALL, "De");
              setlocale(LC_COLLATE, "Fr@dict");

          Internationalized programs can initiate language operation
          according to environment variable settings (see the Base
          Definitions volume of POSIX.1‐2017, Section 8.2,
          Internationalization Variables) by calling setlocale() as
          follows:

              setlocale(LC_ALL, "");

          Changing the setting of LC_MESSAGES has no effect on catalogs
          that have already been opened by calls to catopen().

          In order to make use of different locale settings while multiple
          threads are running, applications should use uselocale() in
          preference to setlocale().


-----------------------------------------------------------

::

          References to the international environment or locale in the
          following text relate to the global locale for the process. This
          can be overridden for individual threads using uselocale().

          The ISO C standard defines a collection of functions to support
          internationalization.  One of the most significant aspects of
          these functions is a facility to set and query the international
          environment.  The international environment is a repository of
          information that affects the behavior of certain functionality,
          namely:

           1. Character handling

           2. Collating

           3. Date/time formatting

           4. Numeric editing

           5. Monetary formatting

           6. Messaging

          The setlocale() function provides the application developer with
          the ability to set all or portions, called categories, of the
          international environment.  These categories correspond to the
          areas of functionality mentioned above. The syntax for
          setlocale() is as follows:

              char *setlocale(int category, const char *locale);

          where category is the name of one of following categories,
          namely:

                 LC_COLLATE LC_CTYPE LC_MESSAGES LC_MONETARY LC_NUMERIC
                 LC_TIME

          In addition, a special value called LC_ALL directs setlocale() to
          set all categories.

          There are two primary uses of setlocale():

           1. Querying the international environment to find out what it is
              set to

           2. Setting the international environment, or locale, to a
              specific value

          The behavior of setlocale() in these two areas is described
          below. Since it is difficult to describe the behavior in words,
          examples are used to illustrate the behavior of specific uses.

          To query the international environment, setlocale() is invoked
          with a specific category and the null pointer as the locale. The
          null pointer is a special directive to setlocale() that tells it
          to query rather than set the international environment.  The
          following syntax is used to query the name of the international
          environment:

              setlocale({LC_ALL, LC_COLLATE, LC_CTYPE, LC_MESSAGES, LC_MONETARY, \
                  LC_NUMERIC, LC_TIME},(char *) NULL);

          The setlocale() function shall return the string corresponding to
          the current international environment. This value may be used by
          a subsequent call to setlocale() to reset the international
          environment to this value. However, it should be noted that the
          return value from setlocale() may be a pointer to a static area
          within the function and is not guaranteed to remain unchanged
          (that is, it may be modified by a subsequent call to
          setlocale()).  Therefore, if the purpose of calling setlocale()
          is to save the value of the current international environment so
          it can be changed and reset later, the return value should be
          copied to an array of char in the calling program.

          There are three ways to set the international environment with
          setlocale():

          setlocale(category, string)
                This usage sets a specific category in the international
                environment to a specific value corresponding to the value
                of the string.  A specific example is provided below:

                    setlocale(LC_ALL, "fr_FR.ISO-8859-1");

                In this example, all categories of the international
                environment are set to the locale corresponding to the
                string "fr_FR.ISO-8859-1", or to the French language as
                spoken in France using the ISO/IEC 8859‐1:1998 standard
                codeset.

                If the string does not correspond to a valid locale,
                setlocale() shall return a null pointer and the
                international environment is not changed. Otherwise,
                setlocale() shall return the name of the locale just set.

          setlocale(category, "C")
                The ISO C standard states that one locale must exist on all
                conforming implementations. The name of the locale is C and
                corresponds to a minimal international environment needed
                to support the C programming language.

          setlocale(category, "")
                This sets a specific category to an implementation-defined
                default.  This corresponds to the value of the environment
                variables.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          catopen(3p), exec(1p), fprintf(3p), fscanf(3p), isalnum(3p),
          isalpha(3p), isblank(3p), iscntrl(3p), isdigit(3p), isgraph(3p),
          islower(3p), isprint(3p), ispunct(3p), isspace(3p), isupper(3p),
          iswalnum(3p), iswalpha(3p), iswblank(3p), iswcntrl(3p),
          iswctype(3p), iswdigit(3p), iswgraph(3p), iswlower(3p),
          iswprint(3p), iswpunct(3p), iswspace(3p), iswupper(3p),
          iswxdigit(3p), isxdigit(3p), localeconv(3p), mblen(3p),
          mbstowcs(3p), mbtowc(3p), newlocale(3p), nl_langinfo(3p),
          perror(3p), psiginfo(3p), strcoll(3p), strerror(3p), strfmon(3p),
          strsignal(3p), strtod(3p), strxfrm(3p), tolower(3p), toupper(3p),
          towlower(3p), towupper(3p), uselocale(3p), wcscoll(3p),
          wcstod(3p), wcstombs(3p), wcsxfrm(3p), wctomb(3p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 7, Locale,
          Chapter 8, Environment Variables, langinfo.h(0p), locale.h(0p)


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

   IEEE/The Open Group               2017                     SETLOCALE(3P)

--------------

Pages that refer to this page:
`ctype.h(0p) <../man0/ctype.h.0p.html>`__, 
`locale.h(0p) <../man0/locale.h.0p.html>`__, 
`wctype.h(0p) <../man0/wctype.h.0p.html>`__, 
`awk(1p) <../man1/awk.1p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`fprintf(3p) <../man3/fprintf.3p.html>`__, 
`fscanf(3p) <../man3/fscanf.3p.html>`__, 
`fwprintf(3p) <../man3/fwprintf.3p.html>`__, 
`fwscanf(3p) <../man3/fwscanf.3p.html>`__, 
`getdate(3p) <../man3/getdate.3p.html>`__, 
`isalnum(3p) <../man3/isalnum.3p.html>`__, 
`isalpha(3p) <../man3/isalpha.3p.html>`__, 
`isblank(3p) <../man3/isblank.3p.html>`__, 
`iscntrl(3p) <../man3/iscntrl.3p.html>`__, 
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
`nl_langinfo(3p) <../man3/nl_langinfo.3p.html>`__, 
`strsignal(3p) <../man3/strsignal.3p.html>`__, 
`strtod(3p) <../man3/strtod.3p.html>`__, 
`tolower(3p) <../man3/tolower.3p.html>`__, 
`toupper(3p) <../man3/toupper.3p.html>`__, 
`towlower(3p) <../man3/towlower.3p.html>`__, 
`towupper(3p) <../man3/towupper.3p.html>`__, 
`uselocale(3p) <../man3/uselocale.3p.html>`__, 
`wcstod(3p) <../man3/wcstod.3p.html>`__

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
