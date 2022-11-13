.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-name(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dpkg-name(1)                   dpkg suite                   dpkg-name(1)

NAME
-------------------------------------------------

::

          dpkg-name - rename Debian packages to full package names


---------------------------------------------------------

::

          dpkg-name [option...]  [--] file...


---------------------------------------------------------------

::

          This manual page documents the dpkg-name program which provides
          an easy way to rename Debian packages into their full package
          names. A full package name consists of
          package_version_architecture.package-type as specified in the
          control file of the package. The version part of the filename
          consists of the upstream version information optionally followed
          by a hyphen and the revision information. The package-type part
          comes from that field if present or fallbacks to deb.


-------------------------------------------------------

::

          -a, --no-architecture
                 The destination filename will not have the architecture
                 information.

          -k, --symlink
                 Create a symlink, instead of moving.

          -o, --overwrite
                 Existing files will be overwritten if they have the same
                 name as the destination filename.

          -s, --subdir [dir]
                 Files will be moved into a subdirectory. If the directory
                 given as argument exists the files will be moved into that
                 directory otherwise the name of the target directory is
                 extracted from the section field in the control part of
                 the package. The target directory will be
                 «unstable/binary-architecture/section».  If the section is
                 not found in the control, then no-section is assumed, and
                 in this case, as well as for sections non-free and contrib
                 the target directory is «section/binary-architecture».
                 The section field is not required so a lot of packages
                 will find their way to the no-section area.  Use this
                 option with care, it's messy.

          -c, --create-dir
                 This option can used together with the -s option. If a
                 target directory isn't found it will be created
                 automatically.  Use this option with care.

          -?, --help
                 Show the usage message and exit.

          -v, --version
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


-------------------------------------------------

::

          Some packages don't follow the name structure
          package_version_architecture.deb.  Packages renamed by dpkg-name
          will follow this structure. Generally this will have no impact on
          how packages are installed by dselect(1)/dpkg(1), but other
          installation tools might depend on this naming structure.


---------------------------------------------------------

::

          dpkg-name bar-foo.deb
                 The file bar-foo.deb will be renamed to
                 bar-foo_1.0-2_i386.deb or something similar (depending on
                 whatever information is in the control part of
                 bar-foo.deb).

          find /root/debian/ -name '*.deb' | xargs -n 1 dpkg-name -a
                 All files with the extension deb in the directory
                 /root/debian and its subdirectory's will be renamed by
                 dpkg-name if required into names with no architecture
                 information.

          find -name '*.deb' | xargs -n 1 dpkg-name -a -o -s -c
                 Don't do this.  Your archive will be messed up completely
                 because a lot of packages don't come with section
                 information.  Don't do this.

          dpkg-deb --build debian-tmp && dpkg-name -o -s .. debian-tmp.deb
                 This can be used when building new packages.


---------------------------------------------------------

::

          deb(5), deb-control(5), dpkg(1), dpkg-deb(1), find(1), xargs(1).

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

   1.19.6-2-g6e42d5               2019-03-25                   dpkg-name(1)

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
