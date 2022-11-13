.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

deb-src-rules(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   deb-src-rules(5)             dpkg utilities             deb-src-rules(5)

NAME
-------------------------------------------------

::

          deb-src-rules - Debian source package rules file


---------------------------------------------------------

::

          debian/rules


---------------------------------------------------------------

::

          This file contains the instructions necessary to build the binary
          packages from the source package.

          The debian/rules file is an executable Makefile, with a shebang
          that is usually set to "#!/usr/bin/make -f".

          It must support the following make targets:

          clean  Clean up the source tree, by undoing any change done by
                 any of the build and binary targets.  This target will be
                 called with root privileges.

          build-indep
                 Build architecture independent files required to build any
                 architecture independent binary package.  If there are no
                 architecture indepdenent binary packages to generate, the
                 target must still exist but do nothing.  This target must
                 not require root privileges.

          build-arch
                 Build architecture dependent files required to build any
                 architecture dependent binary package.  If there are no
                 architecture dependent binary packages to generate, the
                 target must still exist but do nothing.  This target must
                 not require root privileges.

          build  Build architecture independent and dependent files, either
                 by depending (at least transitively) on build-indep and/or
                 build-arch or by inlining what those targets would do.
                 This target must not require root privileges.

          binary-indep
                 Build architecture independent binary packages.  This
                 target must depend (at least transitively) on either
                 build-indep or build.  This target will be called with
                 root privileges.

          binary-arch
                 Build architecture dependent binary packages.  This target
                 must depend (at least transitively) on either build-arch
                 or build.  This target will be called with root
                 privileges.

          binary Build architecture independent and dependent binary
                 packages, either by depending (at least transitively) on
                 binary-indep and/or binary-arch or by inlining what those
                 targets would do.  This target will be called with root
                 privileges.


---------------------------------------------------------

::

          dpkg-architecture(1), dpkg-vendor(1), dpkg-buildflags(1),
          dpkg-parsechangelog(1), dpkg-shlibdeps(1), dpkg-gencontrol(1),
          dpkg-deb(1), dpkg-distaddfile(1).

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

   Debian Project                 2017-09-05               deb-src-rules(5)

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
