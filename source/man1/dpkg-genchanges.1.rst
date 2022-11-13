.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-genchanges(1) — Linux manual page
======================================

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

   dpkg-genchanges(1)             dpkg suite             dpkg-genchanges(1)

NAME
-------------------------------------------------

::

          dpkg-genchanges - generate Debian .changes files


---------------------------------------------------------

::

          dpkg-genchanges [option...]


---------------------------------------------------------------

::

          dpkg-genchanges reads information from an unpacked and built
          Debian source tree and from the files it has generated and
          generates a Debian upload control file (.changes file).


-------------------------------------------------------

::

          --build=type
                 Specifies the build type from a comma-separated list of
                 components (since dpkg 1.18.5).

                 The allowed values are:

                 source Upload the source package.

                 any    Upload the architecture specific binary packages.

                 all    Upload the architecture independent binary
                        packages.

                 binary Upload the architecture specific and independent
                        binary packages.  This is an alias for any,all.

                 full   Upload everything.  This is alias for
                        source,any,all, and the same as the default case
                        when no build option is specified.

          -g     Equivalent to --build=source,all (since dpkg 1.17.11).

          -G     Equivalent to --build=source,any (since dpkg 1.17.11).

          -b     Equivalent to --build=binary or --build=any,all.

          -B     Equivalent to --build=any.

          -A     Equivalent to --build=all.

          -S     Equivalent to --build=source.

          The -sx options control whether the original source archive is
          included in the upload if any source is being generated (i.e.  -b
          or -B haven't been used).

          -si    By default, or if specified, the original source will be
                 included only if the upstream version number (the version
                 without epoch and without Debian revision) differs from
                 the upstream version number of the previous changelog
                 entry.

          -sa    Forces the inclusion of the original source.

          -sd    Forces the exclusion of the original source and includes
                 only the diff.

          -vversion
                 Causes changelog information from all versions strictly
                 later than version to be used.

          -Cchanges-description
                 Read the description of the changes from the file changes-
                 description rather than using the information from the
                 source tree's changelog file.

          -mmaintainer-address
                 Use maintainer-address as the name and email address of
                 the maintainer for this package, rather than using the
                 information from the source tree's control file.

          -emaintainer-address
                 Use maintainer-address as the name and email address of
                 the maintainer for this upload, rather than using the
                 information from the source tree's changelog.

          -Vname=value
                 Set an output substitution variable.  See deb-substvars(5)
                 for a discussion of output substitution.

          -Tsubstvars-file
                 Read substitution variables in substvars-file; the default
                 is debian/substvars.  No variable substitution is done on
                 any of the fields that are output, except for the contents
                 extracted from each binary package Description field
                 (since dpkg 1.19.0), however the special variable Format
                 will override the field of the same name.  This option can
                 be used multiple times to read substitution variables from
                 multiple files (since dpkg 1.15.6).

          -Dfield=value
                 Override or add an output control file field.

          -Ufield
                 Remove an output control file field.

          -ccontrolfile
                 Specifies the main source control file to read information
                 from. The default is debian/control.

          -lchangelog-file
                 Specifies the changelog file to read information from. The
                 default is debian/changelog.

          -ffiles-list-file
                 Read the list of files to be uploaded here, rather than
                 using debian/files.

          -Fchangelog-format
                 Specifies the format of the changelog. See
                 dpkg-parsechangelog(1) for information about alternative
                 formats.

          -uupload-files-dir
                 Look for the files to be uploaded in upload-files-dir
                 rather than ..  (dpkg-genchanges needs to find these files
                 so that it can include their sizes and checksums in the
                 .changes file).

          -q     Usually dpkg-genchanges will produce informative messages
                 on standard error, for example about how many of the
                 package's source files are being uploaded.  -q suppresses
                 these messages.

          -O[filename]
                 Print the changes file to standard output (the default) or
                 to filename if specified (since dpkg 1.18.5).

          -?, --help
                 Show the usage message and exit.

          --version
                 Show the version and exit.


---------------------------------------------------------------

::

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
                 The list of generated files which are part of the upload
                 being prepared.  dpkg-genchanges reads the data here when
                 producing a .changes file.


---------------------------------------------------------

::

          deb-substvars(5), deb-src-control(5), deb-src-files(5),
          deb-changelog(5), deb-changes(5).

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

   1.19.6-2-g6e42d5               2019-03-25             dpkg-genchanges(1)

--------------

Pages that refer to this page:
`dpkg-buildpackage(1) <../man1/dpkg-buildpackage.1.html>`__, 
`deb-src-files(5) <../man5/deb-src-files.5.html>`__, 
`deb-substvars(5) <../man5/deb-substvars.5.html>`__

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
