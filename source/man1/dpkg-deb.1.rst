.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-deb(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dpkg-deb(1)                    dpkg suite                    dpkg-deb(1)

NAME
-------------------------------------------------

::

          dpkg-deb - Debian package archive (.deb) manipulation tool


---------------------------------------------------------

::

          dpkg-deb [option...] command


---------------------------------------------------------------

::

          dpkg-deb packs, unpacks and provides information about Debian
          archives.

          Use dpkg to install and remove packages from your system.

          You can also invoke dpkg-deb by calling dpkg with whatever
          options you want to pass to dpkg-deb. dpkg will spot that you
          wanted dpkg-deb and run it for you.

          For most commands taking an input archive argument, the archive
          can be read from standard input if the archive name is given as a
          single minus character («-»); otherwise lack of support will be
          documented in their respective command description.


---------------------------------------------------------

::

          -b, --build binary-directory [archive|directory]
                 Creates a debian archive from the filesystem tree stored
                 in binary-directory. binary-directory must have a DEBIAN
                 subdirectory, which contains the control information files
                 such as the control file itself. This directory will not
                 appear in the binary package's filesystem archive, but
                 instead the files in it will be put in the binary
                 package's control information area.

                 Unless you specify --nocheck, dpkg-deb will read
                 DEBIAN/control and parse it. It will check the file for
                 syntax errors and other problems, and display the name of
                 the binary package being built.  dpkg-deb will also check
                 the permissions of the maintainer scripts and other files
                 found in the DEBIAN control information directory.

                 If no archive is specified then dpkg-deb will write the
                 package into the file binary-directory.deb.

                 If the archive to be created already exists it will be
                 overwritten.

                 If the second argument is a directory then dpkg-deb will
                 write to the file directory/package_version_arch.deb.
                 When a target directory is specified, rather than a file,
                 the --nocheck option may not be used (since dpkg-deb needs
                 to read and parse the package control file to determine
                 which filename to use).

          -I, --info archive [control-file-name...]
                 Provides information about a binary package archive.

                 If no control-file-names are specified then it will print
                 a summary of the contents of the package as well as its
                 control file.

                 If any control-file-names are specified then dpkg-deb will
                 print them in the order they were specified; if any of the
                 components weren't present it will print an error message
                 to stderr about each one and exit with status 2.

          -W, --show archive
                 Provides information about a binary package archive in the
                 format specified by the --showformat argument. The default
                 format displays the package's name and version on one
                 line, separated by a tabulator.

          -f, --field archive [control-field-name...]
                 Extracts control file information from a binary package
                 archive.

                 If no control-field-names are specified then it will print
                 the whole control file.

                 If any are specified then dpkg-deb will print their
                 contents, in the order in which they appear in the control
                 file. If more than one control-field-name is specified
                 then dpkg-deb will precede each with its field name (and a
                 colon and space).

                 No errors are reported for fields requested but not found.

          -c, --contents archive
                 Lists the contents of the filesystem tree archive portion
                 of the package archive. It is currently produced in the
                 format generated by tar's verbose listing.

          -x, --extract archive directory
                 Extracts the filesystem tree from a package archive into
                 the specified directory.

                 Note that extracting a package to the root directory will
                 not result in a correct installation! Use dpkg to install
                 packages.

                 directory (but not its parents) will be created if
                 necessary, and its permissions modified to match the
                 contents of the package.

          -X, --vextract archive directory
                 Is like --extract (-x) with --verbose (-v) which prints a
                 listing of the files extracted as it goes.

          -R, --raw-extract archive directory
                 Extracts the filesystem tree from a package archive into a
                 specified directory, and the control information files
                 into a DEBIAN subdirectory of the specified directory
                 (since dpkg 1.16.1).

                 The target directory (but not its parents) will be created
                 if necessary.

                 The input archive is not (currently) processed
                 sequentially, so reading it from standard input («-») is
                 not supported.

          --ctrl-tarfile archive
                 Extracts the control data from a binary package and sends
                 it to standard output in tar format (since dpkg 1.17.14).
                 Together with tar(1) this can be used to extract a
                 particular control file from a package archive.  The input
                 archive will always be processed sequentially.

          --fsys-tarfile archive
                 Extracts the filesystem tree data from a binary package
                 and sends it to standard output in tar format. Together
                 with tar(1) this can be used to extract a particular file
                 from a package archive.  The input archive will always be
                 processed sequentially.

          -e, --control archive [directory]
                 Extracts the control information files from a package
                 archive into the specified directory.

                 If no directory is specified then a subdirectory DEBIAN in
                 the current directory is used.

                 The target directory (but not its parents) will be created
                 if necessary.

          -?, --help
                 Show the usage message and exit.

          --version
                 Show the version and exit.


-------------------------------------------------------

::

          --showformat=format
                 This option is used to specify the format of the output
                 --show will produce. The format is a string that will be
                 output for each package listed.

                 The string may reference any status field using the
                 “${field-name}” form, a list of the valid fields can be
                 easily produced using -I on the same package. A complete
                 explanation of the formatting options (including escape
                 sequences and field tabbing) can be found in the
                 explanation of the --showformat option in dpkg-query(1).

                 The default for this field is “${Package}\t${Version}\n”.

          -zcompress-level
                 Specify which compression level to use on the compressor
                 backend, when building a package (default is 9 for gzip, 6
                 for xz).  The accepted values are 0-9 with: 0 being mapped
                 to compressor none for gzip.  Before dpkg 1.16.2 level 0
                 was equivalent to compressor none for all compressors.

          -Scompress-strategy
                 Specify which compression strategy to use on the
                 compressor backend, when building a package (since dpkg
                 1.16.2). Allowed values are none (since dpkg 1.16.4),
                 filtered, huffman, rle and fixed for gzip (since dpkg
                 1.17.0) and extreme for xz.

          -Zcompress-type
                 Specify which compression type to use when building a
                 package.  Allowed values are gzip, xz (since dpkg 1.15.6),
                 and none (default is xz).

          --[no-]uniform-compression
                 Specify that the same compression parameters should be
                 used for all archive members (i.e. control.tar and
                 data.tar; since dpkg 1.17.6).  Otherwise only the data.tar
                 member will use those parameters. The only supported
                 compression types allowed to be uniformly used are none,
                 gzip and xz.  The --no-uniform-compression option disables
                 uniform compression (since dpkg 1.19.0).  Uniform
                 compression is the default (since dpkg 1.19.0).

          --root-owner-group
                 Set the owner and group for each entry in the filesystem
                 tree data to root with id 0 (since dpkg 1.19.0).

                 Note: This option can be useful for rootless builds (see
                 rootless-builds.txt), but should not be used when the
                 entries have an owner or group that is not root.  Support
                 for these will be added later in the form of a meta
                 manifest.

          --deb-format=format
                 Set the archive format version used when building (since
                 dpkg 1.17.0).  Allowed values are 2.0 for the new format,
                 and 0.939000 for the old one (default is 2.0).

                 The old archive format is less easily parsed by non-Debian
                 tools and is now obsolete; its only use is when building
                 packages to be parsed by versions of dpkg older than
                 0.93.76 (September 1995), which was released as i386 a.out
                 only.

          --nocheck
                 Inhibits dpkg-deb --build's usual checks on the proposed
                 contents of an archive. You can build any archive you
                 want, no matter how broken, this way.

          -v, --verbose
                 Enables verbose output (since dpkg 1.16.1).  This
                 currently only affects --extract making it behave like
                 --vextract.

          -D, --debug
                 Enables debugging output. This is not very interesting.


---------------------------------------------------------------

::

          0      The requested action was successfully performed.

          2      Fatal or unrecoverable error due to invalid command-line
                 usage, or interactions with the system, such as accesses
                 to the database, memory allocations, etc.


---------------------------------------------------------------

::

          DPKG_COLORS
                 Sets the color mode (since dpkg 1.18.5).  The currently
                 accepted values are: auto (default), always and never.

          TMPDIR If set, dpkg-deb will use it as the directory in which to
                 create temporary files and directories.

          SOURCE_DATE_EPOCH
                 If set, it will be used as the timestamp (as seconds since
                 the epoch) in the deb(5)'s ar(5) container and used to
                 clamp the mtime in the tar(5) file entries.


---------------------------------------------------

::

          Do not attempt to use just dpkg-deb to install software! You must
          use dpkg proper to ensure that all the files are correctly placed
          and the package's scripts run and its status and contents
          recorded.


-------------------------------------------------

::

          dpkg-deb -I package1.deb package2.deb does the wrong thing.

          There is no authentication on .deb files; in fact, there isn't
          even a straightforward checksum.  (Higher level tools like APT
          support authenticating .deb packages retrieved from a given
          repository, and most packages nowadays provide an md5sum control
          file generated by debian/rules. Though this is not directly
          supported by the lower level tools.)


---------------------------------------------------------

::

          deb(5), deb-control(5), dpkg(1), dselect(1).

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

   1.19.6-2-g6e42d5               2019-03-25                    dpkg-deb(1)

--------------

Pages that refer to this page:
`dh_builddeb(1) <../man1/dh_builddeb.1.html>`__, 
`dpkg(1) <../man1/dpkg.1.html>`__, 
`dpkg-name(1) <../man1/dpkg-name.1.html>`__, 
`dpkg-split(1) <../man1/dpkg-split.1.html>`__, 
`deb(5) <../man5/deb.5.html>`__, 
`deb-conffiles(5) <../man5/deb-conffiles.5.html>`__, 
`deb-control(5) <../man5/deb-control.5.html>`__, 
`deb-old(5) <../man5/deb-old.5.html>`__, 
`deb-src-rules(5) <../man5/deb-src-rules.5.html>`__

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
