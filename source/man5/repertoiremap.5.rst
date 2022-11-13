.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

repertoiremap(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   REPERTOIREMAP(5)            Linux User Manual           REPERTOIREMAP(5)

NAME
-------------------------------------------------

::

          repertoiremap - map symbolic character names to Unicode code
          points


---------------------------------------------------------------

::

          A repertoire map defines mappings between symbolic character
          names (mnemonics) and Unicode code points when compiling a locale
          with localedef(1).  Using a repertoire map is optional, it is
          needed only when symbolic names are used instead of now preferred
          Unicode code points.

      Syntax
          The repertoiremap file starts with a header that may consist of
          the following keywords:

          comment_char
                 is followed by a character that will be used as the
                 comment character for the rest of the file.  It defaults
                 to the number sign (#).

          escape_char
                 is followed by a character that should be used as the
                 escape character for the rest of the file to mark
                 characters that should be interpreted in a special way.
                 It defaults to the backslash (\).

          The mapping section starts with the keyword CHARIDS in the first
          column.

          The mapping lines have the following form:

          <symbolic-name> <code-point> comment
                 This defines exactly one mapping, comment being optional.

          The mapping section ends with the string END CHARIDS.


---------------------------------------------------

::

          /usr/share/i18n/repertoiremaps
                 Usual default repertoire map path.


-------------------------------------------------------------------

::

          POSIX.2.


---------------------------------------------------

::

          Repertoire maps are deprecated in favor of Unicode code points.


---------------------------------------------------------

::

          A mnemonic for the Euro sign can be defined as follows:

          <Eu> <U20AC> EURO SIGN


---------------------------------------------------------

::

          locale(1), localedef(1), charmap(5), locale(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2020-06-09               REPERTOIREMAP(5)

--------------

Pages that refer to this page:
`localedef(1) <../man1/localedef.1.html>`__

--------------

`Copyright and license for this manual
page <../man5/repertoiremap.5.license.html>`__

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
