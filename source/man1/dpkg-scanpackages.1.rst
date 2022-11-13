.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-scanpackages(1) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dpkg-scanpackages(1)           dpkg suite           dpkg-scanpackages(1)

NAME
-------------------------------------------------

::

          dpkg-scanpackages - create Packages index files


---------------------------------------------------------

::

          dpkg-scanpackages [option...] binary-path [override-file [path-
          prefix]] > Packages


---------------------------------------------------------------

::

          dpkg-scanpackages sorts through a tree of Debian binary packages
          and creates a Packages file, used by apt(8), dselect(1), etc, to
          tell the user what packages are available for installation. These
          Packages files are the same as those found on Debian archive
          sites and CD-ROMs. You might use dpkg-scanpackages yourself if
          making a directory of local packages to install on a cluster of
          machines.

          Note: If you want to access the generated Packages file with apt
          you will probably need to compress the file with xz(1)
          (generating a Packages.xz file), bzip2(1) (generating a
          Packages.bz2 file) or gzip(1) (generating a Packages.gz file).
          apt ignores uncompressed Packages files except on local access
          (i.e.  file:// sources).

          binary-path is the name of the tree of the binary packages to
          process (for example, contrib/binary-i386).  It is best to make
          this relative to the root of the Debian archive, because every
          Filename field in the new Packages file will start with this
          string.

          override-file is the name of a file to read which contains
          information about how the package fits into the distribution (the
          file can be compressed since dpkg 1.15.5); see deb-override(5).

          path-prefix is an optional string to be prepended to the Filename
          fields.

          If more than one version of a package is found only the newest
          one is included in the output. If they have the same version and
          only differ in architecture only the first one found is used.


-------------------------------------------------------

::

          -t, --type type
                 Scan for *.type packages, instead of *.deb.

          -e, --extra-override file
                 Scan file to find supplementary overrides (the file can be
                 compressed since dpkg 1.15.5).  See deb-extra-override(5)
                 for more information on its format.

          -a, --arch arch
                 Use a pattern consisting of *_all.deb and *_arch.deb
                 instead of scanning for all debs.

          -h, --hash hash-list
                 Only generate file hashes for the comma-specified list
                 specified (since dpkg 1.17.14).  The default is to
                 generate all currently supported hashes.  Supported
                 values: md5, sha1, sha256.

          -m, --multiversion
                 Include all found packages in the output.

          -M, --medium id-string
                 Add an X-Medium field containing the value id-string
                 (since dpkg 1.15.5).  This field is required if you want
                 to generate Packages.cd files for use by the multicd
                 access method of dselect.

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


---------------------------------------------------------------

::

          dpkg-scanpackages outputs the usual self-explanatory errors. It
          also warns about packages that are in the wrong subdirectory, are
          duplicated, have a Filename field in their control file, are
          missing from the override file, or have maintainer substitutions
          which do not take effect.


---------------------------------------------------------

::

          dpkg(1), dselect(1), deb-override(5), deb-extra-override(5),
          dpkg-scansources(1).

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

   1.19.6-2-g6e42d5               2019-03-25           dpkg-scanpackages(1)

--------------

Pages that refer to this page:
`dpkg-scansources(1) <../man1/dpkg-scansources.1.html>`__, 
`dselect(1) <../man1/dselect.1.html>`__, 
`deb-extra-override(5) <../man5/deb-extra-override.5.html>`__, 
`deb-override(5) <../man5/deb-override.5.html>`__

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
