.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

zsoelim(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ZSOELIM(1)                 Manual pager utils                 ZSOELIM(1)

NAME
-------------------------------------------------

::

          zsoelim - satisfy .so requests in roff input


---------------------------------------------------------

::

          zsoelim [-CVh] [file ...]


---------------------------------------------------------------

::

          zsoelim parses file arguments, or if none are specified, its
          standard input for lines of the form:

          .so <filename>

          These requests are replaced by the contents of the filename
          specified.  If the request cannot be met, zsoelim looks for
          filename.ext where .ext can be one of .gz, .Z or .z.  Other
          extension types may be supported depending upon compile time
          options.  If the request can be met by a compressed file, this
          file is decompressed using an appropriate decompressor and its
          output is used to satisfy the request.

          Traditionally, soelim programs were used to allow roff
          preprocessors to be able to preprocess the files referred to by
          the requests.  This particular version was written to circumvent
          problems created by support for compressed manual pages.


-------------------------------------------------------

::

          -C, --compatible
                 This flag is available for compatibility with other soelim
                 programs.  Its use is to enable .so requests followed by
                 something other than whitespace.  As this is already the
                 default behaviour, it is ignored.

          -h, --help
                 Print a help message and exit.

          -V, --version
                 Display version information.


---------------------------------------------------------

::

          groff(1), man(1), nroff(1), troff(1)


-----------------------------------------------------

::

          Wilf. (G.Wilford@ee.surrey.ac.uk).
          Fabrizio Polacco (fpolacco@debian.org).
          Colin Watson (cjwatson@debian.org).


-------------------------------------------------

::

          https://savannah.nongnu.org/bugs/?group=man-db

COLOPHON
---------------------------------------------------------

::

          This page is part of the man-db (manual pager suite) project.
          Information about the project can be found at 
          ⟨http://www.nongnu.org/man-db/⟩.  If you have a bug report for
          this manual page, send it to man-db-devel@nongnu.org.  This page
          was obtained from the project's upstream Git repository
          ⟨https://git.savannah.gnu.org/r/man-db.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-07-11.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   2.9.4                          2021-02-08                     ZSOELIM(1)

--------------

Pages that refer to this page: `man(1) <../man1/man.1.html>`__

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
