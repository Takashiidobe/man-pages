.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iconvconfig(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ICONVCONFIG(8)         Linux System Administration        ICONVCONFIG(8)

NAME
-------------------------------------------------

::

          iconvconfig - create iconv module configuration cache


---------------------------------------------------------

::

          iconvconfig [options] [directory]...


---------------------------------------------------------------

::

          The iconv(3) function internally uses gconv modules to convert to
          and from a character set.  A configuration file is used to
          determine the needed modules for a conversion.  Loading and
          parsing such a configuration file would slow down programs that
          use iconv(3), so a caching mechanism is employed.

          The iconvconfig program reads iconv module configuration files
          and writes a fast-loading gconv module configuration cache file.

          In addition to the system provided gconv modules, the user can
          specify custom gconv module directories with the environment
          variable GCONV_PATH.  However, iconv module configuration caching
          is used only when the environment variable GCONV_PATH is not set.


-------------------------------------------------------

::

          --nostdlib
                 Do not search the system default gconv directory, only the
                 directories provided on the command line.

          -o outputfile, --output=outputfile
                 Use outputfile for output instead of the system default
                 cache location.

          --prefix=pathname
                 Set the prefix to be prepended to the system pathnames.
                 See FILES, below.  By default, the prefix is empty.
                 Setting the prefix to foo, the gconv module configuration
                 would be read from foo/usr/lib/gconv/gconv-modules and the
                 cache would be written to
                 foo/usr/lib/gconv/gconv-modules.cache.

          -?, --help
                 Print a usage summary and exit.

          --usage
                 Print a short usage summary and exit.

          -V, --version
                 Print the version number, license, and disclaimer of
                 warranty for iconv.


---------------------------------------------------------------

::

          Zero on success, nonzero on errors.


---------------------------------------------------

::

          /usr/lib/gconv
                 Usual default gconv module path.

          /usr/lib/gconv/gconv-modules
                 Usual system default gconv module configuration file.

          /usr/lib/gconv/gconv-modules.cache
                 Usual system gconv module configuration cache.

          Depending on the architecture, the above files may instead be
          located at directories with the path prefix /usr/lib64.


---------------------------------------------------------

::

          iconv(1), iconv(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-08-27                 ICONVCONFIG(8)

--------------

Pages that refer to this page: `iconv(1) <../man1/iconv.1.html>`__, 
`iconv(3) <../man3/iconv.3.html>`__

--------------

`Copyright and license for this manual
page <../man8/iconvconfig.8.license.html>`__

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
