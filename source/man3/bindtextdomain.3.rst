.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bindtextdomain(3) — Linux manual page
=====================================

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

   BINDTEXTDOMAIN(3)       Library Functions Manual       BINDTEXTDOMAIN(3)

NAME
-------------------------------------------------

::

          bindtextdomain - set directory containing message catalogs


---------------------------------------------------------

::

          #include <libintl.h>

          char * bindtextdomain (const char * domainname, const char * dirname);


---------------------------------------------------------------

::

          The bindtextdomain function sets the base directory of the
          hierarchy containing message catalogs for a given message domain.

          A message domain is a set of translatable msgid messages.
          Usually, every software package has its own message domain. The
          need for calling bindtextdomain arises because packages are not
          always installed with the same prefix as the <libintl.h> header
          and the libc/libintl libraries.

          Message catalogs will be expected at the pathnames
          dirname/locale/category/domainname.mo, where locale is a locale
          name and category is a locale facet such as LC_MESSAGES.

          domainname must be a non-empty string.

          If dirname is not NULL, the base directory for message catalogs
          belonging to domain domainname is set to dirname. The function
          makes copies of the argument strings as needed. If the program
          wishes to call the chdir function, it is important that dirname
          be an absolute pathname; otherwise it cannot be guaranteed that
          the message catalogs will be found.

          If dirname is NULL, the function returns the previously set base
          directory for domain domainname.


-----------------------------------------------------------------

::

          If successful, the bindtextdomain function returns the current
          base directory for domain domainname, after possibly changing it.
          The resulting string is valid until the next bindtextdomain call
          for the same domainname and must not be modified or freed. If a
          memory allocation failure occurs, it sets errno to ENOMEM and
          returns NULL.


-----------------------------------------------------

::

          The following error can occur, among others:

          ENOMEM Not enough memory available.


-------------------------------------------------

::

          The return type ought to be const char *, but is char * to avoid
          warnings in C code predating ANSI C.


---------------------------------------------------------

::

          gettext(3), dgettext(3), dcgettext(3), ngettext(3), dngettext(3),
          dcngettext(3), textdomain(3), realpath(3)

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

   GNU gettext 0.20.1.124-32cf     May 2001               BINDTEXTDOMAIN(3)

--------------

Pages that refer to this page: `gettext(3) <../man3/gettext.3.html>`__, 
`textdomain(3) <../man3/textdomain.3.html>`__

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
