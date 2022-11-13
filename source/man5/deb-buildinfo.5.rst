.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

deb-buildinfo(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FIELDS <#FIELDS>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   deb-buildinfo(5)               dpkg suite               deb-buildinfo(5)

NAME
-------------------------------------------------

::

          deb-buildinfo - Debian build information file format


---------------------------------------------------------

::

          filename.buildinfo


---------------------------------------------------------------

::

          Each Debian source package build can record the build information
          in a .buildinfo control file, which contains a number of fields.
          Each field begins with a tag, such as Source or Binary (case
          insensitive), followed by a colon, and the body of the field.
          Fields are delimited only by field tags.  In other words, field
          text may be multiple lines in length, but the installation tools
          will generally join lines when processing the body of the field
          (except in case of the multiline fields Binary-Only-Changes,
          Installed-Build-Depends, Environment, Checksums-Md5,
          Checksums-Sha1 and Checksums-Sha256, see below).

          The control data might be enclosed in an OpenPGP ASCII Armored
          signature, as specified in RFC4880.

          The name of the .buildinfo file will depend on the type of build
          and will be as specific as necessary but not more; for a build
          that includes any the name will be source-name_binary-
          version_arch.buildinfo, or otherwise for a build that includes
          all the name will be source-name_binary-version_all.buildinfo, or
          otherwise for a build that includes source the name will be
          source-name_source-version_source.buildinfo.


-----------------------------------------------------

::

          Format: format-version (required)
                 The value of this field declares the format version of the
                 file.  The syntax of the field value is a version number
                 with a major and minor component.  Backward incompatible
                 changes to the format will bump the major version, and
                 backward compatible changes (such as field additions) will
                 bump the minor version.  The current format version is
                 1.0.

          Source: source-name [(source-version)] (required)
                 The name of the source package.  If the source version
                 differs from the binary version, then the source-name will
                 be followed by a source-version in parenthesis.  This can
                 happen when the build is for a binary-only non-maintainer
                 upload.

          Binary: binary-package-list (required)
                 This folded field is a space-separated list of binary
                 packages built.

          Architecture: arch-list (required)
                 This space-separated field lists the architectures of the
                 files currently being built.  Common architectures are
                 amd64, armel, i386, etc.  Note that the all value is meant
                 for packages that are architecture independent.  If the
                 source for the package is also being built, the special
                 entry source is also present.  Architecture wildcards must
                 never be present in the list.

          Version: version-string (required)
                 Typically, this is the original package's version number
                 in whatever form the program's author uses.  It may also
                 include a Debian revision number (for non-native
                 packages).  The exact format and sorting algorithm are
                 described in deb-version(7).

          Binary-Only-Changes:
           changelog-entry
                 This multiline field contains the concatenated text of the
                 changelog entry for a binary-only non-maintainer upload
                 (binNMU) if that is the case.  To make this a valid
                 multiline field empty lines are replaced with a single
                 full stop (‘.’) and all lines are indented by one space
                 character.  The exact content depends on the changelog
                 format.

          Checksums-Md5: (required)
          Checksums-Sha1: (required)
          Checksums-Sha256: (required)
           checksum size filename
                 These multiline fields contain a list of files with a
                 checksum and size for each one.  These fields have the
                 same syntax and differ only in the checksum algorithm
                 used: MD5 for Checksums-Md5, SHA-1 for Checksums-Sha1 and
                 SHA-256 for Checksums-Sha256.

                 The first line of the field value (the part on the same
                 line as the field name followed by a colon) is always
                 empty.  The content of the field is expressed as
                 continuation lines, one line per file.  Each line consists
                 of space-separated entries describing the file: the
                 checksum, the file size, and the file name.

                 These fields list all files that make up the build.

          Build-Origin: name
                 The name of the distribution this package is originating
                 from.

          Build-Architecture: arch (required)
                 The Debian architecture for the installation the packages
                 is being built in.  Common architectures are amd64, armel,
                 i386, etc.

          Build-Date: build-date
                 The date the package was built.  It must be in the same
                 format as the date in a deb-changelog(5) entry.

          Build-Kernel-Version: build-kernel-version
                 The release and version (in an unspecified format) of the
                 kernel running on the build system.  This field is only
                 going to be present if the builder has explicitly
                 requested it, to avoid leaking possibly sensitive
                 information.

          Build-Path: build-path
                 The absolute build path, which correspond to the unpacked
                 source tree.  This field is only going to be present if
                 the vendor has whitelisted it via some pattern match to
                 avoid leaking possibly sensitive information.

                 On Debian and derivatives only build paths starting with
                 /build/ will emit this field.

          Build-Tainted-By:
           taint-reason-list
                 This folded field contains a space-separated list of non-
                 exhausitve reason tags (formed by alphanumeric and dash
                 characters) which identify why the current build has been
                 tainted (since dpkg 1.19.5).

                 On Debian and derivatives the following reason tags can be
                 emitted:

                 merged-usr-via-symlinks
                        The system has a merged /usr via symlinks.  This
                        will confuse dpkg-query, dpkg-statoverride,
                        dpkg-trigger, update-alternatives and any other
                        tool using pathnames as keys into their databases,
                        as it creates filesystem aliasing problems, and
                        messes with the understanding of the filesystem
                        that dpkg has recorded in its database.  For build
                        systems that hardcode pathnames to specific
                        binaries or libraries on the resulting artifacts,
                        it can also produce packages that will be
                        incompatible with non-/usr-merged filesystems.

                 usr-local-has-configs
                        The system has configuration files under
                        /usr/local/etc.

                 usr-local-has-includes
                        The system has header files under
                        /usr/local/include.

                 usr-local-has-programs
                        The system has programs under /usr/local/bin or
                        /usr/local/sbin.

                 usr-local-has-libraries
                        The system has libraries, either static or shared
                        under /usr/local/lib.

          Installed-Build-Depends: (required)
           package-list
                 The list of installed and configured packages that might
                 affect the package build process.

                 The list consists of each package name, optionally arch-
                 qualified for foreign architectures, with an exact version
                 restriction, separated by commas.

                 The list includes all essential packages, packages listed
                 in Build-Depends, Build-Depends-Arch, Build-Depends-Indep
                 source control fields, any vendor specific builtin
                 dependencies, and all their recursive dependencies.  On
                 Debian and derivatives the dependency builtin is
                 build-essential.

                 For dependencies coming from the source control fields,
                 all dependency alternatives and all providers of virtual
                 packages depended on will be included.

          Environment:
           variable-list
                 The list of environment variables that are known to affect
                 the package build process, with each environment variable
                 followed by an equal sign (‘=’) and the variable's quoted
                 value, using double quotes (‘"’), and backslashes escaped
                 (‘\\’).


---------------------------------------------------------

::

          deb-changes(5), deb-version(7), dpkg-genbuildinfo(1).

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

   1.19.6-2-g6e42d5               2019-03-25               deb-buildinfo(5)

--------------

Pages that refer to this page:
`dpkg-genbuildinfo(1) <../man1/dpkg-genbuildinfo.1.html>`__

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
