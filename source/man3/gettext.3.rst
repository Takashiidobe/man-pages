.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gettext(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETTEXT(3)              Library Functions Manual              GETTEXT(3)

NAME
-------------------------------------------------

::

          gettext, dgettext, dcgettext - translate message


---------------------------------------------------------

::

          #include <libintl.h>

          char * gettext (const char * msgid);
          char * dgettext (const char * domainname, const char * msgid);
          char * dcgettext (const char * domainname, const char * msgid,
                            int category);


---------------------------------------------------------------

::

          The gettext, dgettext and dcgettext functions attempt to
          translate a text string into the user's native language, by
          looking up the translation in a message catalog.

          The msgid argument identifies the message to be translated. By
          convention, it is the English version of the message, with non-
          ASCII characters replaced by ASCII approximations. This choice
          allows the translators to work with message catalogs, called PO
          files, that contain both the English and the translated versions
          of each message, and can be installed using the msgfmt utility.

          A message domain is a set of translatable msgid messages.
          Usually, every software package has its own message domain. The
          domain name is used to determine the message catalog where the
          translation is looked up; it must be a non-empty string. For the
          gettext function, it is specified through a preceding textdomain
          call. For the dgettext and dcgettext functions, it is passed as
          the domainname argument; if this argument is NULL, the domain
          name specified through a preceding textdomain call is used
          instead.

          Translation lookup operates in the context of the current locale.
          For the gettext and dgettext functions, the LC_MESSAGES locale
          facet is used. It is determined by a preceding call to the
          setlocale function. setlocale(LC_ALL,"") initializes the
          LC_MESSAGES locale based on the first nonempty value of the three
          environment variables LC_ALL, LC_MESSAGES, LANG; see
          setlocale(3). For the dcgettext function, the locale facet is
          determined by the category argument, which should be one of the
          LC_xxx constants defined in the <locale.h> header, excluding
          LC_ALL. In both cases, the functions also use the LC_CTYPE locale
          facet in order to convert the translated message from the
          translator's codeset to the current locale's codeset, unless
          overridden by a prior call to the bind_textdomain_codeset
          function.

          The message catalog used by the functions is at the pathname
          dirname/locale/category/domainname.mo. Here dirname is the
          directory specified through bindtextdomain. Its default is system
          and configuration dependent; typically it is prefix/share/locale,
          where prefix is the installation prefix of the package. locale is
          the name of the current locale facet; the GNU implementation also
          tries generalizations, such as the language name without the
          territory name. category is LC_MESSAGES for the gettext and
          dgettext functions, or the argument passed to the dcgettext
          function.

          If the LANGUAGE environment variable is set to a nonempty value,
          and the locale is not the "C" locale, the value of LANGUAGE is
          assumed to contain a colon separated list of locale names. The
          functions will attempt to look up a translation of msgid in each
          of the locales in turn. This is a GNU extension.

          In the "C" locale, or if none of the used catalogs contain a
          translation for msgid, the gettext, dgettext and dcgettext
          functions return msgid.


-----------------------------------------------------------------

::

          If a translation was found in one of the specified catalogs, it
          is converted to the locale's codeset and returned. The resulting
          string is statically allocated and must not be modified or freed.
          Otherwise msgid is returned.


-----------------------------------------------------

::

          errno is not modified.


-------------------------------------------------

::

          The return type ought to be const char *, but is char * to avoid
          warnings in C code predating ANSI C.

          When an empty string is used for msgid, the functions may return
          a nonempty string.


---------------------------------------------------------

::

          ngettext(3), dngettext(3), dcngettext(3), setlocale(3),
          textdomain(3), bindtextdomain(3), bind_textdomain_codeset(3),
          msgfmt(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the gettext (message translation) project.
          Information about the project can be found at 
          ⟨http://www.gnu.org/software/gettext/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://savannah.gnu.org/projects/gettext/⟩.  This page was
          obtained from the tarball gettext-0.21.tar.gz fetched from
          ⟨https://ftp.gnu.org/gnu/gettext/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   GNU gettext 0.20.1.124-32cf     May 2001                      GETTEXT(3)

--------------

Pages that refer to this page:
`bindtextdomain(3) <../man3/bindtextdomain.3.html>`__, 
`bind_textdomain_codeset(3) <../man3/bind_textdomain_codeset.3.html>`__, 
`ngettext(3) <../man3/ngettext.3.html>`__, 
`textdomain(3) <../man3/textdomain.3.html>`__, 
`wprintf(3) <../man3/wprintf.3.html>`__, 
`environ(7) <../man7/environ.7.html>`__, 
`locale(7) <../man7/locale.7.html>`__

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
