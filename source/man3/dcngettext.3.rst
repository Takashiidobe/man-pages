.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ngettext(3) — Linux manual page
===============================

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

   NGETTEXT(3)             Library Functions Manual             NGETTEXT(3)

NAME
-------------------------------------------------

::

          ngettext, dngettext, dcngettext - translate message and choose
          plural form


---------------------------------------------------------

::

          #include <libintl.h>

          char * ngettext (const char * msgid, const char * msgid_plural,
                           unsigned long int n);
          char * dngettext (const char * domainname,
                            const char * msgid, const char * msgid_plural,
                            unsigned long int n);
          char * dcngettext (const char * domainname,
                             const char * msgid, const char * msgid_plural,
                             unsigned long int n, int category);


---------------------------------------------------------------

::

          The ngettext, dngettext and dcngettext functions attempt to
          translate a text string into the user's native language, by
          looking up the appropriate plural form of the translation in a
          message catalog.

          Plural forms are grammatical variants depending on the a number.
          Some languages have two forms, called singular and plural. Other
          languages have three forms, called singular, dual and plural.
          There are also languages with four forms.

          The ngettext, dngettext and dcngettext functions work like the
          gettext, dgettext and dcgettext functions, respectively.
          Additionally, they choose the appropriate plural form, which
          depends on the number n and the language of the message catalog
          where the translation was found.

          In the "C" locale, or if none of the used catalogs contain a
          translation for msgid, the ngettext, dngettext and dcngettext
          functions return msgid if n == 1, or msgid_plural if n != 1.


-----------------------------------------------------------------

::

          If a translation was found in one of the specified catalogs, the
          appropriate plural form is converted to the locale's codeset and
          returned. The resulting string is statically allocated and must
          not be modified or freed. Otherwise msgid or msgid_plural is
          returned, as described above.


-----------------------------------------------------

::

          errno is not modified.


-------------------------------------------------

::

          The return type ought to be const char *, but is char * to avoid
          warnings in C code predating ANSI C.


---------------------------------------------------------

::

          gettext(3), dgettext(3), dcgettext(3)

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

   GNU gettext 0.20.1.124-32cf     May 2001                     NGETTEXT(3)

--------------

Pages that refer to this page:
`bindtextdomain(3) <../man3/bindtextdomain.3.html>`__, 
`bind_textdomain_codeset(3) <../man3/bind_textdomain_codeset.3.html>`__, 
`gettext(3) <../man3/gettext.3.html>`__, 
`textdomain(3) <../man3/textdomain.3.html>`__, 
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
