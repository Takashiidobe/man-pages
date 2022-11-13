.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

miniunzip(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   miniunzip(1)             General Commands Manual            miniunzip(1)

NAME
-------------------------------------------------

::

          miniunzip - uncompress and examine ZIP archives


---------------------------------------------------------

::

          miniunzip [-exvlo] zipfile [ files_to_extract ] [-d tempdir]


---------------------------------------------------------------

::

          minizip is a simple tool which allows the extraction of
          compressed file archives in the ZIP format used by the MS-DOS
          utility PKZIP.  It was written as a demonstration of the zlib(3)
          library and therefore lack many of the features of the unzip(1)
          program.


-------------------------------------------------------

::

          A number of options are supported.  With the exception of
          -d tempdir these must be supplied before any other arguments and
          are:

          -l , --v
                 List the files in the archive without extracting them.

          -o     Overwrite files without prompting for confirmation.

          -x     Extract files (default).

          The zipfile argument is the name of the archive to process. The
          next argument can be used to specify a single file to extract
          from the archive.

          Lastly, the following option can be specified at the end of the
          command-line:

          -d tempdir
                 Extract the archive in the directory tempdir rather than
                 the current directory.


---------------------------------------------------------

::

          minizip(1), zlib(3), unzip(1).


-----------------------------------------------------

::

          This program was written by Gilles Vollant.  This manual page was
          written by Mark Brown <broonie@sirena.org.uk>. The -d tempdir
          option was added by Dirk Eddelbuettel <edd@debian.org>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the nmap (a network scanner) project.
          Information about the project can be found at ⟨http://nmap.org/⟩.
          If you have a bug report for this manual page, send it to
          dev@nmap.org.  This page was obtained from the project's upstream
          Git mirror of the Subversion repository
          ⟨https://github.com/nmap/nmap⟩ on 2021-08-27.  (At that time, the
          date of the most recent commit that was found in the repository
          was 2021-08-25.)  If you discover any rendering problems in this
          HTML version of the page, or you believe there is a better or
          more up-to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

                                  Nov 7, 2001                  miniunzip(1)

--------------

Pages that refer to this page: `minizip(1) <../man1/minizip.1.html>`__

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
