.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pkgdata(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PKGDATA(1)                  ICU 70.0.1 Manual                 PKGDATA(1)

NAME
-------------------------------------------------

::

          pkgdata - package data for use by ICU


---------------------------------------------------------

::

          pkgdata [ -h, -?, --help ] [ -v, --verbose ] [ -c, --copyright |
          -C, --comment comment ] [ -m, --mode mode ] -p, --name name -O,
          --bldopt options [ -e, --entrypoint name ] [ -r, --revision
          version ] [ -F, --rebuild ] [ -I, --install ] [ -s, --sourcedir
          source ] [ -d, --destdir destination ] [ -T, --tempdir directory
          ] [ file ...  ]


---------------------------------------------------------------

::

          pkgdata takes a set of data files and packages them for use by
          ICU or applications that use ICU. The typical reason to package
          files using pkgdata is to make their distribution easier and
          their loading by ICU faster and less consuming of limited system
          resources such as file descriptors.  Packaged data also allow
          applications to be distributed with fewer resource files, or even
          with none at all if they link against the packaged data directly.

          pkgdata supports a few different methods of packaging data that
          serve different purposes.

          The default packaging mode is common, or archive.  In this mode,
          the different data files are bundled together as an architecture-
          dependent file that can later be memory mapped for use by ICU.
          Data packaged using this mode will be looked up under the ICU
          data directory. Such packaging is easy to use for applications
          resource bundles, for example, as long as the application can
          install the packaged file in the ICU data directory.

          Another packaging mode is the dll, or library, mode, where the
          data files are compiled into a shared library. ICU used to be
          able to dynamically load these shared libraries, but as of ICU
          2.0, such support has been removed. This mode is still useful for
          two main purposes: to build ICU itself, as the ICU data is
          packaged as a shared library by default; and to build resource
          bundles that are linked to the application that uses them. Such
          resource bundles can then be placed anywhere where the system's
          dynamic linker will be looking for shared libraries, instead of
          being forced to live inside the ICU data directory.

          The static packaging mode is similar to the shared library one
          except that it produces a static library.

          Finally, pkgdata supports a files mode which simply copies the
          data files instead of packaging them as a single file or library.
          This mode is mainly intended to provide support for building ICU
          before it is packaged as separate small packages for distribution
          with operating systems such as Debian GNU/Linux for example.
          Please refer to the packaging documentation in the ICU source
          distribution for further information on the use of this mode.

          pkgdata builds, packages, installs, or cleans the appropriate
          data based on the options given without the need to call GNU make
          anymore.


-------------------------------------------------------

::

          -h, -?, --help
                 Print help about usage and exit.

          -v, --verbose
                 Display extra informative messages during execution.

          -c, --copyright
                 Include a copyright notice in the binary data.

          -C, --comment comment
                 Includes the specified comment in the resulting data
                 instead of the ICU copyright notice.

          -m, --mode mode
                 Set the packaging mode to be used by pkgdata.  The
                 different modes and their meaning are explained in the
                 DESCRIPTION section above. The valid mode names are common
                 (or archive), dll (or library), and files.

          -O, --bldopt options
                 Specify options for the builder. The builder is used
                 internally by pkgdata to generate the correct packaged
                 file. Such options include, but are not limited to,
                 setting variables used by make(1) during the build of the
                 packaged file. Note: If icu-config is available, then this
                 option is not needed.

          -p, --name name
                 Set the packaged file name to name.  This name is also
                 used as the default entry point name after having been
                 turned into a valid C identifier.

          -e, --entrypoint name
                 Set the data entry point (used for linking against the
                 data in a shared library form) to name.  The default entry
                 point name is the name set by the -n, --name option.

          -r, --revision version
                 Enable versioning of the shared library produced in dll,
                 or library, mode. The version number has the format
                 major.minor.patchlevel and all parts except for major are
                 optional. If only major is supplied then the version is
                 assumed to be major.0 for versioning purposes.

          -F, --rebuild
                 Force the rebuilding of all data and their repackaging.

          -I, --install
                 Install the packaged file (or all the files in the files
                 mode). If the variable DESTDIR is set it will be used for
                 installation.

          -s, --sourcedir source
                 Set the source directory to source.  The default source
                 directory is the current directory.

          -d, --destdir destination
                 Set the destination directory to destination.  The default
                 destination directory is the current directory.

          -T, --tempdir directory
                 Set the directory used to generate temporary files to
                 directory.  The default temporary directory is the same as
                 the destination directory as set by the -d, --destdir
                 option.


-------------------------------------------------------

::

          Steven Loomis
          Yves Arrouye


-------------------------------------------------------

::

          70.0.1


-----------------------------------------------------------

::

          Copyright (C) 2000-2009 IBM, Inc. and others.

COLOPHON
---------------------------------------------------------

::

          This page is part of the ICU (International Components for
          Unicode) project.  Information about the project can be found at
          ⟨http://site.icu-project.org/home⟩.  If you have a bug report for
          this manual page, see ⟨http://site.icu-project.org/bugs⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨https://github.com/unicode-org/icu⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   ICU MANPAGE                  6 February 2009                  PKGDATA(1)

--------------

Pages that refer to this page:
`gencnval(1) <../man1/gencnval.1.html>`__, 
`genrb(1) <../man1/genrb.1.html>`__, 
`makeconv(1) <../man1/makeconv.1.html>`__, 
`icupkg(8) <../man8/icupkg.8.html>`__

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
