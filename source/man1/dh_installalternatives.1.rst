.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_installalternatives(1) — Linux manual page
=============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_INSTALLALTERNATIVES(1)       Debhelper      DH_INSTALLALTERNATIVES(1)

NAME
-------------------------------------------------

::

          dh_installalternatives - install declarative alternative rules


---------------------------------------------------------

::

          dh_installalternatives [debhelper options]


---------------------------------------------------------------

::

          dh_installalternatives is a debhelper program that is responsible
          for parsing the declarative alternatives format and insert the
          relevant maintscripts snippets to interface with
          update-alternatives(1)


---------------------------------------------------

::

          debian/package.alternatives
              An example of the format:

                  Name: editor
                  Link: /usr/bin/editor
                  Alternative: /usr/bin/vim.basic
                  Dependents:
                    /usr/share/man/man1/editor.1.gz editor.1.gz /usr/share/man/man1/vim.1.gz
                    /usr/share/man/fr/man1/editor.1.gz editor.fr.1.gz /usr/share/man/fr/man1/vim.1.gz
                    /usr/share/man/it/man1/editor.1.gz editor.it.1.gz /usr/share/man/it/man1/vim.1.gz
                    /usr/share/man/pl/man1/editor.1.gz editor.pl.1.gz /usr/share/man/pl/man1/vim.1.gz
                    /usr/share/man/ru/man1/editor.1.gz editor.ru.1.gz /usr/share/man/ru/man1/vim.1.gz
                  Priority: 50

              The fields Link, Name, Alternative, and Priority are
              mandatory and correspond to the update-alternatives(1)
              --install parameters link, name, path, and priority
              respectively.

              The Dependents field is optional and consists of one or more
              lines. Each non-empty line must contain exactly 3 space
              separated values that match (in order) the values passed to
              the --slave parameter for update-alternatives(1).


-------------------------------------------------------

::

          -n, --no-scripts
              Do not modify postinst/postrm/prerm scripts.


---------------------------------------------------------

::

          debhelper(7)

          This program is a part of debhelper.

COLOPHON
---------------------------------------------------------

::

          This page is part of the debhelper (helper programs for
          debian/rules) project.  Information about the project can be
          found at [unknown -- if you know, please contact man-
          pages@man7.org] If you have a bug report for this manual page,
          send it to submit@bugs.debian.org.  This page was obtained from
          the project's upstream Git repository
          ⟨https://salsa.debian.org/debian/debhelper.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   13.2.1                         2020-08-12      DH_INSTALLALTERNATIVES(1)

--------------

Pages that refer to this page:
`debhelper(7) <../man7/debhelper.7.html>`__

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
