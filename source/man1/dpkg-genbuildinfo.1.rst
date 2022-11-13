.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-genbuildinfo(1) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dpkg-genbuildinfo(1)           dpkg suite           dpkg-genbuildinfo(1)

NAME
-------------------------------------------------

::

          dpkg-genbuildinfo - generate Debian .buildinfo files


---------------------------------------------------------

::

          dpkg-genbuildinfo [option...]


---------------------------------------------------------------

::

          dpkg-genbuildinfo reads information from an unpacked and built
          Debian source tree and from the files it has generated and
          generates a Debian control file describing the build environment
          and the build artifacts (.buildinfo file).

          This command was introduced in dpkg 1.18.11.


-------------------------------------------------------

::

          --build=type
                 Specifies the build type from a comma-separated list of
                 components.

                 The allowed values are:

                 any    Generate build information including unqualified
                        build dependencies (Build-Depends) and architecture
                        specific build dependencies (Build-Depends-Arch).

                 all    Generate build information including unqualified
                        build dependencies (Build-Depends) and architecture
                        independent build dependencies
                        (Build-Depends-Indep).

                 source Effectively ignored; generate build information
                        with just the unqualified build dependencies
                        (Build-Depends).

                 binary Generate build information with all three types of
                        build dependencies.  This is an alias for any,all.

                 full   Generate build information with all three types of
                        build dependencies.  This is an alias for
                        any,all,source, and the same as the default case
                        when no build option is specified.

          -ccontrolfile
                 Specifies the main source control file to read information
                 from. The default is debian/control.

          -lchangelog-file
                 Specifies the changelog file to read information from. The
                 default is debian/changelog.

          -ffiles-list-file
                 Specifies where is the list of files that have been
                 produced by the build, rather than using debian/files.

          -Fchangelog-format
                 Specifies the format of the changelog. See
                 dpkg-parsechangelog(1) for information about alternative
                 formats.

          -O[filename]
                 Print the buildinfo file to standard output (or filename
                 if specified) rather than to dir/source-name_binary-
                 version_arch.buildinfo (where dir is .. by default or
                 upload-files-dir if -u was used).

          -uupload-files-dir
                 Look for the files to be uploaded in upload-files-dir
                 rather than ..  (dpkg-genbuildinfo needs to find these
                 files so that it can include their sizes and checksums in
                 the .buildinfo file).

          --always-include-kernel
                 By default, the Build-Kernel-Version field will not be
                 written out.

                 Specify this option (since dpkg 1.19.0) to always write a
                 Build-Kernel-Version field when generating the .buildinfo.

          --always-include-path
                 By default, the Build-Path field will only be written if
                 the current directory starts with a whitelisted pattern.

                 On Debian and derivatives the pattern matches on /build/
                 at the start of the pathname.

                 Specify this option to always write a Build-Path field
                 when generating the .buildinfo.

          --admindir=dir
                 Change the location of the dpkg database. The default
                 location is /var/lib/dpkg.

          -q     dpkg-genbuildinfo might produce informative messages on
                 standard error.  -q suppresses these messages.

          -?, --help
                 Show the usage message and exit.

          --version
                 Show the version and exit.


---------------------------------------------------------------

::

          DEB_BUILD_OPTIONS
                 This variable can be used to enable or disable various
                 features that affect the information included in the
                 .buildinfo file, via the buildinfo option (since dpkg
                 1.18.19).  This option contains a comma-separated list of
                 features, prefixed with the ‘+’ or ‘-’ modifiers, to
                 denote whether to enable or disable them.  The special
                 feature “all” can be used to enable or disable all other
                 features.  The feature “path” controls whether to
                 unconditionally include the Build-Path field.

          DPKG_COLORS
                 Sets the color mode (since dpkg 1.18.5).  The currently
                 accepted values are: auto (default), always and never.

          DPKG_NLS
                 If set, it will be used to decide whether to activate
                 Native Language Support, also known as
                 internationalization (or i18n) support (since dpkg
                 1.19.0).  The accepted values are: 0 and 1 (default).


---------------------------------------------------

::

          debian/files
                 The list of generated files.  dpkg-genbuildinfo reads the
                 data here when producing a .buildinfo file.


---------------------------------------------------------

::

          deb-buildinfo(5).

COLOPHON
---------------------------------------------------------

::

          This page is part of the dpkg (Debian Package Manager) project.
          Information about the project can be found at 
          ⟨https://wiki.debian.org/Teams/Dpkg/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://bugs.debian.org/cgi-bin/pkgreport.cgi?src=dpkg⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨https://salsa.debian.org/dpkg-team/dpkg.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-06-17.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   1.19.6-2-g6e42d5               2019-03-25           dpkg-genbuildinfo(1)

--------------

Pages that refer to this page:
`dpkg-buildpackage(1) <../man1/dpkg-buildpackage.1.html>`__, 
`deb-buildinfo(5) <../man5/deb-buildinfo.5.html>`__

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
