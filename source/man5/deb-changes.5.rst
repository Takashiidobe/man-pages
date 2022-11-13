.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

deb-changes(5) — Linux manual page
==================================

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

   deb-changes(5)                 dpkg suite                 deb-changes(5)

NAME
-------------------------------------------------

::

          deb-changes - Debian changes file format


---------------------------------------------------------

::

          filename.changes


---------------------------------------------------------------

::

          Each Debian upload is composed of a .changes control file, which
          contains a number of fields.  Each field begins with a tag, such
          as Source or Binary (case insensitive), followed by a colon, and
          the body of the field.  Fields are delimited only by field tags.
          In other words, field text may be multiple lines in length, but
          the installation tools will generally join lines when processing
          the body of the field (except in case of the multiline fields
          Description, Changes, Files, Checksums-Sha1 and Checksums-Sha256,
          see below).

          The control data might be enclosed in an OpenPGP ASCII Armored
          signature, as specified in RFC4880.


-----------------------------------------------------

::

          Format: format-version (required)
                 The value of this field declares the format version of the
                 file.  The syntax of the field value is a version number
                 with a major and minor component.  Backward incompatible
                 changes to the format will bump the major version, and
                 backward compatible changes (such as field additions) will
                 bump the minor version.  The current format version is
                 1.8.

          Date: release-date (required)
                 The date the package was built or last edited.  It must be
                 in the same format as the date in a deb-changelog(5)
                 entry.

                 The value of this field is usually extracted from the
                 debian/changelog file.

          Source: source-name [(source-version)] (required)
                 The name of the source package.  If the source version
                 differs from the binary version, then the source-name will
                 be followed by a source-version in parenthesis.  This can
                 happen when the upload is a binary-only non-maintainer
                 upload.

          Binary: binary-package-list (required in context)
                 This folded field is a space-separated list of binary
                 packages to upload.  If the upload is source-only, then
                 the field is omitted (since dpkg 1.19.3).

          Architecture: arch-list
                 Lists the architectures of the files currently being
                 uploaded.  Common architectures are amd64, armel, i386,
                 etc.  Note that the all value is meant for packages that
                 are architecture independent.  If the source for the
                 package is also being uploaded, the special entry source
                 is also present.  Architecture wildcards must never be
                 present in the list.

          Version: version-string (required)
                 Typically, this is the original package's version number
                 in whatever form the program's author uses.  It may also
                 include a Debian revision number (for non-native
                 packages).  The exact format and sorting algorithm are
                 described in deb-version(7).

          Distribution: distributions (required)
                 Lists one or more space-separated distributions where this
                 version should be installed when it is uploaded to the
                 archive.

          Urgency: urgency (recommended)
                 The urgency of the upload.  The currently known values, in
                 increasing order of urgency, are: low, medium, high,
                 critical and emergency.

          Maintainer: fullname-email (required)
                 Should be in the format “Joe Bloggs
                 <jbloggs@example.org>”, and is typically the person who
                 created the package, as opposed to the author of the
                 software that was packaged.

          Changed-By: fullname-email
                 Should be in the format “Joe Bloggs
                 <jbloggs@example.org>”, and is typically the person who
                 prepared the package changes for this release.

          Description: (recommended)
           binary-package-name - binary-package-summary
                 This multiline field contains a list of binary package
                 names followed by a space, a dash (‘-’) and their possibly
                 truncated short descriptions.  If the upload is source-
                 only, then the field is omitted (since dpkg 1.19.3).

          Closes: bug-number-list
                 A space-separated list of bug report numbers that have
                 been resolved with this upload.  The distribution archive
                 software might use this field to automatically close the
                 referred bug numbers in the distribution bug tracking
                 system.

          Binary-Only: yes
                 This field denotes that the upload is a binary-only non-
                 maintainer build.  It originates from the binary-only=yes
                 key/value from the changelog metadata entry.

          Built-For-Profiles: profile-list
                 This field specifies a whitespace separated list of build
                 profiles that this upload was built with.

          Changes: (required)
           changelog-entries
                 This multiline field contains the concatenated text of all
                 changelog entries that are part of the upload.  To make
                 this a valid multiline field empty lines are replaced with
                 a single full stop (‘.’) and all lines are indented by one
                 space character.  The exact content depends on the
                 changelog format.

          Files: (required)
           md5sum size section priority filename
                 This multiline field contains a list of files with an
                 md5sum, size, section and priority for each one.

                 The first line of the field value (the part on the same
                 line as the field name followed by a colon) is always
                 empty.  The content of the field is expressed as
                 continuation lines, one line per file.  Each line consists
                 of space-separated entries describing the file: the
                 md5sum, the file size, the file section, the file
                 priority, and the file name.

                 This field lists all files that make up the upload.  The
                 list of files in this field must match the list of files
                 in the other related Checksums fields.

          Checksums-Sha1: (required)
          Checksums-Sha256: (required)
           checksum size filename
                 These multiline fields contain a list of files with a
                 checksum and size for each one.  These fields have the
                 same syntax and differ only in the checksum algorithm
                 used: SHA-1 for Checksums-Sha1 and SHA-256 for
                 Checksums-Sha256.

                 The first line of the field value (the part on the same
                 line as the field name followed by a colon) is always
                 empty.  The content of the field is expressed as
                 continuation lines, one line per file.  Each line consists
                 of space-separated entries describing the file: the
                 checksum, the file size, and the file name.

                 These fields list all files that make up the upload.  The
                 list of files in these fields must match the list of files
                 in the Files field and the other related Checksums fields.


-------------------------------------------------

::

          The Files field is inconsistent with the other Checksums fields.
          The Changed-By and Maintainer fields have confusing names.  The
          Distribution field contains information about what is commonly
          referred to as a suite.


---------------------------------------------------------

::

          deb-src-control(5), deb-version(7).

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

   1.19.6-2-g6e42d5               2019-03-25                 deb-changes(5)

--------------

Pages that refer to this page:
`dpkg-genchanges(1) <../man1/dpkg-genchanges.1.html>`__, 
`deb-buildinfo(5) <../man5/deb-buildinfo.5.html>`__, 
`deb-changelog(5) <../man5/deb-changelog.5.html>`__, 
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
