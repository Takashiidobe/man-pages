.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

locale(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOCALE(1)                   Linux User Manual                  LOCALE(1)

NAME
-------------------------------------------------

::

          locale - get locale-specific information


---------------------------------------------------------

::

          locale [option]
          locale [option] -a
          locale [option] -m
          locale [option] name...


---------------------------------------------------------------

::

          The locale command displays information about the current locale,
          or all locales, on standard output.

          When invoked without arguments, locale displays the current
          locale settings for each locale category (see locale(5)), based
          on the settings of the environment variables that control the
          locale (see locale(7)).  Values for variables set in the
          environment are printed without double quotes, implied values are
          printed with double quotes.

          If either the -a or the -m option (or one of their long-format
          equivalents) is specified, the behavior is as follows:

          -a, --all-locales
                 Display a list of all available locales.  The -v option
                 causes the LC_IDENTIFICATION metadata about each locale to
                 be included in the output.

          -m, --charmaps
                 Display the available charmaps (character set description
                 files).  To display the current character set for the
                 locale, use locale -c charmap.

          The locale command can also be provided with one or more
          arguments, which are the names of locale keywords (for example,
          date_fmt, ctype-class-names, yesexpr, or decimal_point) or locale
          categories (for example, LC_CTYPE or LC_TIME).  For each
          argument, the following is displayed:

          *  For a locale keyword, the value of that keyword to be
             displayed.

          *  For a locale category, the values of all keywords in that
             category are displayed.

          When arguments are supplied, the following options are
          meaningful:

          -c, --category-name
                 For a category name argument, write the name of the locale
                 category on a separate line preceding the list of keyword
                 values for that category.

                 For a keyword name argument, write the name of the locale
                 category for this keyword on a separate line preceding the
                 keyword value.

                 This option improves readability when multiple name
                 arguments are specified.  It can be combined with the -k
                 option.

          -k, --keyword-name
                 For each keyword whose value is being displayed, include
                 also the name of that keyword, so that the output has the
                 format:

                     keyword="value"

          The locale command also knows about the following options:

          -v, --verbose
                 Display additional information for some command-line
                 option and argument combinations.

          -?, --help
                 Display a summary of command-line options and arguments
                 and exit.

          --usage
                 Display a short usage message and exit.

          -V, --version
                 Display the program version and exit.


---------------------------------------------------

::

          /usr/lib/locale/locale-archive
                 Usual default locale archive location.

          /usr/share/i18n/locales
                 Usual default path for locale definition files.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          $ locale
          LANG=en_US.UTF-8
          LC_CTYPE="en_US.UTF-8"
          LC_NUMERIC="en_US.UTF-8"
          LC_TIME="en_US.UTF-8"
          LC_COLLATE="en_US.UTF-8"
          LC_MONETARY="en_US.UTF-8"
          LC_MESSAGES="en_US.UTF-8"
          LC_PAPER="en_US.UTF-8"
          LC_NAME="en_US.UTF-8"
          LC_ADDRESS="en_US.UTF-8"
          LC_TELEPHONE="en_US.UTF-8"
          LC_MEASUREMENT="en_US.UTF-8"
          LC_IDENTIFICATION="en_US.UTF-8"
          LC_ALL=

          $ locale date_fmt
          %a %b %e %H:%M:%S %Z %Y

          $ locale -k date_fmt
          date_fmt="%a %b %e %H:%M:%S %Z %Y"

          $ locale -ck date_fmt
          LC_TIME
          date_fmt="%a %b %e %H:%M:%S %Z %Y"

          $ locale LC_TELEPHONE
          +%c (%a) %l
          (%a) %l
          11
          1
          UTF-8

          $ locale -k LC_TELEPHONE
          tel_int_fmt="+%c (%a) %l"
          tel_dom_fmt="(%a) %l"
          int_select="11"
          int_prefix="1"
          telephone-codeset="UTF-8"

          The following example compiles a custom locale from the ./wrk
          directory with the localedef(1) utility under the $HOME/.locale
          directory, then tests the result with the date(1) command, and
          then sets the environment variables LOCPATH and LANG in the shell
          profile file so that the custom locale will be used in the
          subsequent user sessions:

          $ mkdir -p $HOME/.locale
          $ I18NPATH=./wrk/ localedef -f UTF-8 -i fi_SE $HOME/.locale/fi_SE.UTF-8
          $ LOCPATH=$HOME/.locale LC_ALL=fi_SE.UTF-8 date
          $ echo "export LOCPATH=\$HOME/.locale" >> $HOME/.bashrc
          $ echo "export LANG=fi_SE.UTF-8" >> $HOME/.bashrc


---------------------------------------------------------

::

          localedef(1), charmap(5), locale(5), locale(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      LOCALE(1)

--------------

Pages that refer to this page: `iconv(1) <../man1/iconv.1.html>`__, 
`localedef(1) <../man1/localedef.1.html>`__, 
`nroff(1) <../man1/nroff.1.html>`__, 
`localeconv(3) <../man3/localeconv.3.html>`__, 
`newlocale(3) <../man3/newlocale.3.html>`__, 
`nl_langinfo(3) <../man3/nl_langinfo.3.html>`__, 
`setlocale(3) <../man3/setlocale.3.html>`__, 
`sysconf(3) <../man3/sysconf.3.html>`__, 
`uselocale(3) <../man3/uselocale.3.html>`__, 
`charmap(5) <../man5/charmap.5.html>`__, 
`locale(5) <../man5/locale.5.html>`__, 
`repertoiremap(5) <../man5/repertoiremap.5.html>`__, 
`locale(7) <../man7/locale.7.html>`__, 
`unicode(7) <../man7/unicode.7.html>`__, 
`utf-8(7) <../man7/utf-8.7.html>`__

--------------

`Copyright and license for this manual
page <../man1/locale.1.license.html>`__

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
