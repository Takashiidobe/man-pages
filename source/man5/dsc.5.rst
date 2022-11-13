.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dsc(5) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FIELDS <#FIELDS>`__ \|           |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dsc(5)                         dpkg suite                         dsc(5)

NAME
-------------------------------------------------

::

          dsc - Debian source packages' control file format


---------------------------------------------------------

::

          filename.dsc


---------------------------------------------------------------

::

          Each Debian source package is composed of a .dsc control file,
          which contains a number of fields.  Each field begins with a tag,
          such as Source or Binary (case insensitive), followed by a colon,
          and the body of the field.  Fields are delimited only by field
          tags.  In other words, field text may be multiple lines in
          length, but the installation tools will generally join lines when
          processing the body of the field (except in case of the multiline
          fields Package-List, Files, Checksums-Sha1 and Checksums-Sha256,
          see below).

          The control data might be enclosed in an OpenPGP ASCII Armored
          signature, as specified in RFC4880.


-----------------------------------------------------

::

          Format: format-version (required)
                 The value of this field declares the format version of the
                 source package.  The field value is used by programs
                 acting on a source package to interpret the list of files
                 in the source package and determine how to unpack it.  The
                 syntax of the field value is a numeric major revision
                 (“0-9”), a period (“.”), a numeric minor revision (“0-9”),
                 and then an optional subtype after whitespace (“ \t”),
                 which if specified is a lowercase alphanumeric (“a-z0-9”)
                 word in parentheses (“()”).  The subtype is optional in
                 the syntax but may be mandatory for particular source
                 format revisions.

                 The source formats currently supported by dpkg are 1.0,
                 2.0, 3.0 (native), 3.0 (quilt), 3.0 (git), 3.0 (bzr) and
                 3.0 (custom).  See dpkg-source(1) for their description.

          Source: source-name (required)
                 The value of this field determines the package name, and
                 is used to generate file names by most installation tools.

          Binary: binary-package-list
                 This folded field lists binary packages which this source
                 package can produce, separated by commas.

                 This field has now been superseded by the Package-List
                 field, which gives enough information about what binary
                 packages are produced on which architecture, build-profile
                 and other involved restrictions.

          Architecture: arch-list (recommended)
                 A list of architectures and architecture wildcards
                 separated by spaces which specify the type of hardware
                 this package can be compiled for.  Common architecture
                 names and architecture wildcards are amd64, armel, i386,
                 linux-any, any-amd64, etc.

                 Note that the all value is meant for packages that are
                 architecture independent, and any for packages that are
                 architecture dependent.  The list may include (or consist
                 solely of) the special value all.  When the list contains
                 the architecture wildcard any, the only other value
                 allowed in the list is all.

                 The field value is generally generated from Architecture
                 fields from in the debian/control in the source package.

          Version: version-string (required)
                 Typically, this is the original package's version number
                 in whatever form the program's author uses.  It may also
                 include a Debian revision number (for non-native
                 packages).  The exact format and sorting algorithm are
                 described in deb-version(7).

          Origin: name
                 The name of the distribution this package is originating
                 from.

          Maintainer: fullname-email (recommended)
                 Should be in the format “Joe Bloggs <jbloggs@foo.com>”,
                 and is typically the person who created the package, as
                 opposed to the author of the software that was packaged.

          Uploaders: fullname-email-list
                 Lists all the names and email addresses of co-maintainers
                 of the package, in the same format as the Maintainer
                 field.  Multiple co-maintainers should be separated by a
                 comma.

          Description short-description
           long-description
                 The format for the source package description is a short
                 brief summary on the first line (after the Description
                 field).  The following lines should be used as a longer,
                 more detailed description.  Each line of the long
                 description must be preceded by a space, and blank lines
                 in the long description must contain a single ‘.’
                 following the preceding space.

          Homepage: url
                 The upstream project home page url.

          Standards-Version: version-string (recommended)
                 This documents the most recent version of the distribution
                 policy standards this package complies with.

          Vcs-Browser: url
                 The url of a web interface to browse the Version Control
                 System repository.

          Vcs-Arch: url
          Vcs-Bzr: url
          Vcs-Cvs: url
          Vcs-Darcs: url
          Vcs-Git: url
          Vcs-Hg: url
          Vcs-Mtn: url
          Vcs-Svn: url
                 These fields declare the url of the Version Control System
                 repository used to maintain this package.  See
                 deb-src-control(5) for more details.

          Testsuite: name-list
                 This field declares that the source package contains the
                 specified test suites.  The value is a comma-separated
                 list of test suites.  If the autopkgtest value is present,
                 a debian/tests/control is expected to be present, if the
                 file is present but not the value, then dpkg-source will
                 automatically add it, preserving previous values.

          Testsuite-Triggers: package-list
                 This field declares the comma-separated union of all test
                 dependencies (Depends fields in debian/tests/control
                 file), with all restrictions removed, and OR dependencies
                 flattened (that is, converted to separate AND
                 relationships), except for binaries generated by this
                 source package and its meta-dependency equivalent @.

                 Rationale: this field is needed because otherwise to be
                 able to get the test dependencies, each source package
                 would need to be unpacked.

          Build-Depends: package-list
          Build-Depends-Arch: package-list
          Build-Depends-Indep: package-list
          Build-Conflicts: package-list
          Build-Conflicts-Arch: package-list
          Build-Conflicts-Indep: package-list
                 These fields declare relationships between the source
                 package and packages used to build it.  They are discussed
                 in the deb-src-control(5) manpage.

          Package-List:
           package package-type section priority key-value-list
                 This multiline field contains a list of binary packages
                 generated by this source package.

                 The package is the binary package name.

                 The package-type is the binary package type, usually deb,
                 another common value is udeb.

                 The section and priority match the binary package fields
                 of the same name.

                 The key-value-list is a space separated key=value list,
                 and the currently known optional keys are:

                 arch   The architecture restriction from the binary
                        package Architecture field, with spaces converted
                        to ‘,’.

                 profile
                        The normalized build-profile restriction formula
                        from the binary package Build-Profile field, with
                        ORs converted to ‘+’ and ANDs to ‘,’.

                 essential
                        If the binary package is essential, this key will
                        contain the value of the Essential field, that is a
                        yes value.

          Files: (required)
          Checksums-Sha1: (required)
          Checksums-Sha256: (required)
           checksum size filename
                 These multiline fields contain a list of files with a
                 checksum and size for each one.  These fields have the
                 same syntax and differ only in the checksum algorithm
                 used: MD5 for Files, SHA-1 for Checksums-Sha1 and SHA-256
                 for Checksums-Sha256.

                 The first line of the field value (the part on the same
                 line as the field name followed by a colon) is always
                 empty.  The content of the field is expressed as
                 continuation lines, one line per file.  Each line consists
                 of the checksum, a space, the file size, a space, and the
                 file name.

                 These fields list all files that make up the source
                 package.  The list of files in these fields must match the
                 list of files in the other related fields.


-------------------------------------------------

::

          The Format field conflates the format for the .dsc file itself
          and the format of the extracted source package.


---------------------------------------------------------

::

          deb-src-control(5), deb-version(7), dpkg-source(1).

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

   1.19.6-2-g6e42d5               2019-03-25                         dsc(5)

--------------

Pages that refer to this page:
`dpkg-source(1) <../man1/dpkg-source.1.html>`__, 
`deb-src-control(5) <../man5/deb-src-control.5.html>`__

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
