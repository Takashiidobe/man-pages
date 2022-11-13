.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-scansources(1) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dpkg-scansources(1)            dpkg suite            dpkg-scansources(1)

NAME
-------------------------------------------------

::

          dpkg-scansources - create Sources index files


---------------------------------------------------------

::

          dpkg-scansources [option...] binary-dir [override-file [path-
          prefix]] > Sources


---------------------------------------------------------------

::

          dpkg-scansources scans the given binary-dir for .dsc files.
          These are used to create a Debian source index, which is output
          to stdout.

          The override-file, if given, is used to set priorities in the
          resulting index records and to override the maintainer field
          given in the .dsc files.  The file can be compressed (since dpkg
          1.15.5).  See deb-override(5) for the format of this file. Note:
          Since the override file is indexed by binary, not source
          packages, there's a bit of a problem here. The current
          implementation uses the highest priority of all the binary
          packages produced by a .dsc file for the priority of the source
          package, and the override entry for the first binary package
          listed in the .dsc file to modify maintainer information. This
          might change.

          The path-prefix, if given, is prepended to the directory field in
          the generated source index. You generally use this to make the
          directory fields contain the path from the top of the Debian
          archive hierarchy.

          Note: If you want to access the generated Sources file with
          apt(8) you will probably need to compress the file with gzip(1)
          (generating a Sources.gz file). apt ignores uncompressed Sources
          files except on local access (i.e.  file:// sources).


-------------------------------------------------------

::

          -n, --no-sort
              Don't sort the index records. Normally they are sorted by
              source package name.

          -e, --extra-override file
              Scan file to find supplementary overrides (since dpkg 1.15.4;
              the file can be compressed since dpkg 1.15.5).  See
              deb-extra-override(5) for more information on its format.

          -s, --source-override file
              Use file as the source override file (the file can be
              compressed since dpkg 1.15.5).  The default is the name of
              the override file you specified with .src appended.

              The source override file is in a different format from the
              binary override file. It contains only two whitespace
              separated fields, the first is the source package name and
              the second is the section. Blank lines and comment lines are
              ignored in the normal manner. If a package appears in both
              files the source override takes precedence for setting the
              section.

          --debug
              Turn debugging on.

          --help
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


---------------------------------------------------------

::

          deb-override(5), deb-extra-override(5), dpkg-scanpackages(1).

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

   1.19.6-2-g6e42d5               2019-03-25            dpkg-scansources(1)

--------------

Pages that refer to this page:
`dpkg-scanpackages(1) <../man1/dpkg-scanpackages.1.html>`__, 
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
