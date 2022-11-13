.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-checkbuilddeps(1) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dpkg-checkbuilddeps(1)         dpkg suite         dpkg-checkbuilddeps(1)

NAME
-------------------------------------------------

::

          dpkg-checkbuilddeps - check build dependencies and conflicts


---------------------------------------------------------

::

          dpkg-checkbuilddeps [option...]  [control-file]


---------------------------------------------------------------

::

          This program checks the installed packages in the system against
          the build dependencies and build conflicts listed in the control
          file. If any are not met, it displays them and exits with a
          nonzero return code.

          By default, debian/control is read, but an alternate control
          filename may be specified on the command line.


-------------------------------------------------------

::

          --admindir=dir
                 Change the location of the dpkg database (since dpkg
                 1.14.0).  The default location is /usr/local/var/lib/dpkg.

          -A     Ignore Build-Depends-Arch and Build-Conflicts-Arch lines
                 (since dpkg 1.16.4).  Use when only arch-indep packages
                 will be built, or combine with -B when only a source
                 package is to be built.

          -B     Ignore Build-Depends-Indep and Build-Conflicts-Indep
                 lines. Use when only arch-dep packages will be built, or
                 combine with -A when only a source package is to be built.

          -I     Ignore built-in build depends and conflicts (since dpkg
                 1.18.2).  These are implicit dependencies that are usually
                 required on a specific distribution, the so called Build-
                 Essential package set.

          -d build-depends-string

          -c build-conflicts-string
                 Use the given build dependencies/conflicts instead of
                 those contained in the debian/control file (since dpkg
                 1.14.17).

          -a arch
                 Check build dependencies/conflicts assuming that the
                 package described in the control file is to be built for
                 the given host architecture instead of the architecture of
                 the current system (since dpkg 1.16.2).

          -P profile[,...]
                 Check build dependencies/conflicts assuming that the
                 package described in the control file is to be built for
                 the given build profile(s) (since dpkg 1.17.2).  The
                 argument is a comma-separated list of profile names.

          -?, --help
                 Show the usage message and exit.

          --version
                 Show the version and exit.


---------------------------------------------------------------

::

          DEB_BUILD_PROFILES
                 If set, it will be used as the active build profile(s) for
                 the package being built. It is a space separated list of
                 profile names. Overridden by the -P option.

          DPKG_COLORS
                 Sets the color mode (since dpkg 1.18.5).  The currently
                 accepted values are: auto (default), always and never.

          DPKG_NLS
                 If set, it will be used to decide whether to activate
                 Native Language Support, also known as
                 internationalization (or i18n) support (since dpkg
                 1.19.0).  The accepted values are: 0 and 1 (default).

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

   1.19.6-2-g6e42d5               2019-03-25         dpkg-checkbuilddeps(1)

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
