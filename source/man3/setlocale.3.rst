.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setlocale(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETLOCALE(3)            Linux Programmer's Manual           SETLOCALE(3)

NAME
-------------------------------------------------

::

          setlocale - set the current locale


---------------------------------------------------------

::

          #include <locale.h>

          char *setlocale(int category, const char *locale);


---------------------------------------------------------------

::

          The setlocale() function is used to set or query the program's
          current locale.

          If locale is not NULL, the program's current locale is modified
          according to the arguments.  The argument category determines
          which parts of the program's current locale should be modified.

          Category            Governs
          LC_ALL              All of the locale
          LC_ADDRESS          Formatting of addresses and geography-related
                              items (*)
          LC_COLLATE          String collation
          LC_CTYPE            Character classification
          LC_IDENTIFICATION   Metadata describing the locale (*)
          LC_MEASUREMENT      Settings related to measurements (metric
                              versus US customary) (*)
          LC_MESSAGES         Localizable natural-language messages
          LC_MONETARY         Formatting of monetary values
          LC_NAME             Formatting of salutations for persons (*)
          LC_NUMERIC          Formatting of nonmonetary numeric values
          LC_PAPER            Settings related to the standard paper size
                              (*)
          LC_TELEPHONE        Formats to be used with telephone services
                              (*)
          LC_TIME             Formatting of date and time values

          The categories marked with an asterisk in the above table are GNU
          extensions.  For further information on these locale categories,
          see locale(7).

          The argument locale is a pointer to a character string containing
          the required setting of category.  Such a string is either a
          well-known constant like "C" or "da_DK" (see below), or an opaque
          string that was returned by another call of setlocale().

          If locale is an empty string, "", each part of the locale that
          should be modified is set according to the environment variables.
          The details are implementation-dependent.  For glibc, first
          (regardless of category), the environment variable LC_ALL is
          inspected, next the environment variable with the same name as
          the category (see the table above), and finally the environment
          variable LANG.  The first existing environment variable is used.
          If its value is not a valid locale specification, the locale is
          unchanged, and setlocale() returns NULL.

          The locale "C" or "POSIX" is a portable locale; it exists on all
          conforming systems.

          A locale name is typically of the form
          language[_territory][.codeset][@modifier], where language is an
          ISO 639 language code, territory is an ISO 3166 country code, and
          codeset is a character set or encoding identifier like ISO-8859-1
          or UTF-8.  For a list of all supported locales, try "locale -a"
          (see locale(1)).

          If locale is NULL, the current locale is only queried, not
          modified.

          On startup of the main program, the portable "C" locale is
          selected as default.  A program may be made portable to all
          locales by calling:

              setlocale(LC_ALL, "");

          after program initialization, and then:

          • using the values returned from a localeconv(3) call for locale-
            dependent information;

          • using the multibyte and wide character functions for text
            processing if MB_CUR_MAX > 1;

          • using strcoll(3) and strxfrm(3) to compare strings; and

          • using wcscoll(3) and wcsxfrm(3) to compare wide-character
            strings.


-----------------------------------------------------------------

::

          A successful call to setlocale() returns an opaque string that
          corresponds to the locale set.  This string may be allocated in
          static storage.  The string returned is such that a subsequent
          call with that string and its associated category will restore
          that part of the process's locale.  The return value is NULL if
          the request cannot be honored.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────┬───────────────┬────────────────────────────┐
          │Interface          │ Attribute     │ Value                      │
          ├───────────────────┼───────────────┼────────────────────────────┤
          │setlocale()        │ Thread safety │ MT-Unsafe const:locale env │
          └───────────────────┴───────────────┴────────────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99.

          The C standards specify only the categories LC_ALL, LC_COLLATE,
          LC_CTYPE, LC_MONETARY, LC_NUMERIC, and LC_TIME.  POSIX.1 adds
          LC_MESSAGES.  The remaining categories are GNU extensions.


---------------------------------------------------------

::

          locale(1), localedef(1), isalpha(3), localeconv(3),
          nl_langinfo(3), rpmatch(3), strcoll(3), strftime(3), charsets(7),
          locale(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   SETLOCALE(3)

--------------

Pages that refer to this page: `apropos(1) <../man1/apropos.1.html>`__, 
`flatpak-config(1) <../man1/flatpak-config.1.html>`__, 
`groffer(1) <../man1/groffer.1.html>`__, 
`localedef(1) <../man1/localedef.1.html>`__, 
`man(1) <../man1/man.1.html>`__, 
`whatis(1) <../man1/whatis.1.html>`__, 
`catgets(3) <../man3/catgets.3.html>`__, 
`catopen(3) <../man3/catopen.3.html>`__, 
`duplocale(3) <../man3/duplocale.3.html>`__, 
`ecvt(3) <../man3/ecvt.3.html>`__, 
`getdate(3) <../man3/getdate.3.html>`__, 
`gettext(3) <../man3/gettext.3.html>`__, 
`isalpha(3) <../man3/isalpha.3.html>`__, 
`localeconv(3) <../man3/localeconv.3.html>`__, 
`newlocale(3) <../man3/newlocale.3.html>`__, 
`nl_langinfo(3) <../man3/nl_langinfo.3.html>`__, 
`printf(3) <../man3/printf.3.html>`__, 
`rpmatch(3) <../man3/rpmatch.3.html>`__, 
`scanf(3) <../man3/scanf.3.html>`__, 
`strcoll(3) <../man3/strcoll.3.html>`__, 
`strfmon(3) <../man3/strfmon.3.html>`__, 
`strftime(3) <../man3/strftime.3.html>`__, 
`strptime(3) <../man3/strptime.3.html>`__, 
`strxfrm(3) <../man3/strxfrm.3.html>`__, 
`toupper(3) <../man3/toupper.3.html>`__, 
`uselocale(3) <../man3/uselocale.3.html>`__, 
`locale(5) <../man5/locale.5.html>`__, 
`locale(7) <../man7/locale.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`unicode(7) <../man7/unicode.7.html>`__, 
`utf-8(7) <../man7/utf-8.7.html>`__,  `lsof(8) <../man8/lsof.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/setlocale.3.license.html>`__

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
