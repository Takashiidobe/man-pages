.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcre-config(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `REVISION <#REVISION>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCRE-CONFIG(1)           General Commands Manual          PCRE-CONFIG(1)

NAME
-------------------------------------------------

::

          pcre-config - program to return PCRE configuration


---------------------------------------------------------

::


          pcre-config [--prefix] [--exec-prefix] [--version] [--libs]
                      [--libs16] [--libs32] [--libs-cpp] [--libs-posix]
                      [--cflags] [--cflags-posix]


---------------------------------------------------------------

::


          pcre-config returns the configuration of the installed PCRE
          libraries and the options required to compile a program to use
          them. Some of the options apply only to the 8-bit, or 16-bit, or
          32-bit libraries, respectively, and are not available if only one
          of those libraries has been built. If an unavailable option is
          encountered, the "usage" information is output.


-------------------------------------------------------

::


          --prefix
                 Writes the directory prefix used in the PCRE installation
                 for architecture independent files (/usr on many systems,
                 /usr/local on some systems) to the standard output.

          --exec-prefix
                 Writes the directory prefix used in the PCRE installation
                 for architecture dependent files (normally the same as
                 --prefix) to the standard output.

          --version
                 Writes the version number of the installed PCRE libraries
                 to the standard output.

          --libs Writes to the standard output the command line options
                 required to link with the 8-bit PCRE library (-lpcre on
                 many systems).

          --libs16
                 Writes to the standard output the command line options
                 required to link with the 16-bit PCRE library (-lpcre16 on
                 many systems).

          --libs32
                 Writes to the standard output the command line options
                 required to link with the 32-bit PCRE library (-lpcre32 on
                 many systems).

          --libs-cpp
                 Writes to the standard output the command line options
                 required to link with PCRE's C++ wrapper library
                 (-lpcrecpp -lpcre on many systems).

          --libs-posix
                 Writes to the standard output the command line options
                 required to link with PCRE's POSIX API wrapper library
                 (-lpcreposix -lpcre on many systems).

          --cflags
                 Writes to the standard output the command line options
                 required to compile files that use PCRE (this may include
                 some -I options, but is blank on many systems).

          --cflags-posix
                 Writes to the standard output the command line options
                 required to compile files that use PCRE's POSIX API
                 wrapper library (this may include some -I options, but is
                 blank on many systems).


---------------------------------------------------------

::


          pcre(3)


-----------------------------------------------------

::


          This manual page was originally written by Mark Baker for the
          Debian GNU/Linux system. It has been subsequently revised as a
          generic PCRE man page.


---------------------------------------------------------

::


          Last updated: 24 June 2012

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCRE (Perl Compatible Regular
          Expressions) project.  Information about the project can be found
          at ⟨http://www.pcre.org/⟩.  If you have a bug report for this
          manual page, see
          ⟨http://bugs.exim.org/enter_bug.cgi?product=PCRE⟩.  This page was
          obtained from the tarball pcre-8.45.tar.gz fetched from
          ⟨ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   PCRE 8.30                    01 January 2012              PCRE-CONFIG(1)

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
