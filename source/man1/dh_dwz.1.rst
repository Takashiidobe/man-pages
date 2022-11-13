.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_dwz(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_DWZ(1)                       Debhelper                      DH_DWZ(1)

NAME
-------------------------------------------------

::

          dh_dwz - optimize DWARF debug information in ELF binaries via dwz


---------------------------------------------------------

::

          dh_dwz [debhelper options] [-Xitem] [-- params]


---------------------------------------------------------------

::

          dh_dwz is a debhelper program that will optimize the
          (uncompressed) size of the DWARF debug information in ELF
          binaries.  It does so by running dwz(1) on all the ELF binaries
          in the package.


-------------------------------------------------------

::

          --dwz-multifile, --no-dwz-multifile
              Whether dwz(1) should generate a multifile from the ELF
              binaries in the same package.  When enabled, if a package
              ships at least 2 ELF binaries, dh_dwz will instruct dwz(1) to
              generate a multifile for the package.

              By default, dh_dwz will attempt to create a multifile but
              will continue without if dwz(1) does not create one (but
              succeeds anyway).  This commonly happens when the debug files
              do not contain debug symbols (e.g. a missing -g to the
              compiler) or when the debug symbols are compressed (see
              Debian bug #931891).  If --dwz-multifile is passed, then
              dh_dwz will abort with an error if dwz(1) does not create a
              multifile.

              Note this options may not work if a package contains more ELF
              binaries than can fit on a single command line.  If this
              becomes a problem, please pass --no-dwz-multifile to work
              around the issue.

              The generated multifile will be compressed with objcopy
              --compress-debug-sections.

              Note for udeb packages: dh_dwz will never generate multifiles
              for udeb packages.  It will still use dwz to reduce the file
              size of debug files if it finds any.

          -Xitem, --exclude=item
              Exclude files that contain item anywhere in their filename
              from being stripped. You may use this option multiple times
              to build up a list of things to exclude.

          -- params
              Pass params to dwz(1) when it processes ELF binaries.  This
              is mostly useful for setting memory related parameters (e.g.
              -l and -L).


---------------------------------------------------

::

          If the DEB_BUILD_OPTIONS environment variable contains nostrip,
          nothing will be stripped, in accordance with Debian policy
          (section 10.1 "Binaries").

          While this tool technically does not remove debug information
          from binaries, it is still skipped when the DEB_BUILD_OPTIONS
          environment variable contains nostrip.  This is because nostrip
          is often used to optimize build times (e.g. for "build and
          test"-cycles) rather than optimizing for size.


---------------------------------------------------------

::

          debhelper(7)

          This program is a part of debhelper.


-----------------------------------------------------

::

          Niels Thykier <niels@thykier.net>

COLOPHON
---------------------------------------------------------

::

          This page is part of the debhelper (helper programs for
          debian/rules) project.  Information about the project can be
          found at [unknown -- if you know, please contact man-
          pages@man7.org] If you have a bug report for this manual page,
          send it to submit@bugs.debian.org.  This page was obtained from
          the project's upstream Git repository
          ⟨https://salsa.debian.org/debian/debhelper.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   13.4+nmu1                      2021-08-19                      DH_DWZ(1)

--------------

Pages that refer to this page: `dh(1) <../man1/dh.1.html>`__, 
`debhelper(7) <../man7/debhelper.7.html>`__

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
