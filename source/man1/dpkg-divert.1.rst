.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-divert(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dpkg-divert(1)                 dpkg suite                 dpkg-divert(1)

NAME
-------------------------------------------------

::

          dpkg-divert - override a package's version of a file


---------------------------------------------------------

::

          dpkg-divert [option...]  command


---------------------------------------------------------------

::

          dpkg-divert is the utility used to set up and update the list of
          diversions.

          File diversions are a way of forcing dpkg(1) not to install a
          file into its location, but to a diverted location. Diversions
          can be used through the Debian package scripts to move a file
          away when it causes a conflict. System administrators can also
          use it to override some package's configuration file, or whenever
          some files (which aren't marked as “conffiles”) need to be
          preserved by dpkg, when installing a newer version of a package
          which contains those files.


---------------------------------------------------------

::

          [--add] file
                 Add a diversion for file.  The file is currently not
                 renamed, see --rename.

          --remove file
                 Remove a diversion for file.  The file is currently not
                 renamed, see --rename.

          --list glob-pattern
                 List diversions matching glob-pattern.

          --listpackage file
                 Print the name of the package that diverts file (since
                 dpkg 1.15.0).  Prints LOCAL if file is locally diverted
                 and nothing if file is not diverted.

          --truename file
                 Print the real name for a diverted file.


-------------------------------------------------------

::

          --admindir directory
                 Set the administrative directory to directory.  Defaults
                 to «/usr/local/var/lib/dpkg».

          --instdir directory
                 Set the installation directory, which refers to the
                 directory where packages get installed (since dpkg
                 1.19.2). Defaults to «/».

          --root directory
                 Set the root directory to directory, which sets the
                 installation directory to «directory» and the
                 administrative directory to
                 «directory/usr/local/var/lib/dpkg» (since dpkg 1.19.2).

          --divert divert-to
                 divert-to is the location where the versions of file, as
                 provided by other packages, will be diverted.

          --local
                 Specifies that all packages' versions of this file are
                 diverted.  This means, that there are no exceptions, and
                 whatever package is installed, the file is diverted. This
                 can be used by an admin to install a locally modified
                 version.

          --package package
                 package is the name of a package whose copy of file will
                 not be diverted. i.e. file will be diverted for all
                 packages except package.

          --quiet
                 Quiet mode, i.e. no verbose output.

          --rename
                 Actually move the file aside (or back). dpkg-divert will
                 abort operation in case the destination file already
                 exists.  This is the common behavior used for diversions
                 of files from the non-Essential package set (see
                 --no-rename for more details).

          --no-rename
                 Specifies that the file should not be renamed while adding
                 or removing the diversion into the database (since dpkg
                 1.19.1).  This is intended for diversions of files from
                 the Essential package set, where the temporary
                 disappearance of the original file is not acceptable, as
                 it can render the system non-functional.  This is the
                 default behavior, but that will change in the dpkg 1.20.x
                 cycle.

          --test Test mode, i.e. don't actually perform any changes, just
                 demonstrate.

          -?, --help
                 Show the usage message and exit.

          --version
                 Show the version and exit.


---------------------------------------------------------------

::

          0      The requested action was successfully performed.

          2      Fatal or unrecoverable error due to invalid command-line
                 usage, or interactions with the system, such as accesses
                 to the database, memory allocations, etc.


---------------------------------------------------------------

::

          DPKG_ROOT
                 If set and the --instdir or --root options have not been
                 specified, it will be used as the filesystem root
                 directory (since dpkg 1.19.2).

          DPKG_ADMINDIR
                 If set and the --admindir or --root options have not been
                 specified, it will be used as the dpkg data directory.

          DPKG_MAINTSCRIPT_PACKAGE
                 If set and the --local and --package options have not been
                 specified, dpkg-divert will use it as the package name.

          DPKG_COLORS
                 Sets the color mode (since dpkg 1.18.5).  The currently
                 accepted values are: auto (default), always and never.


---------------------------------------------------

::

          /usr/local/var/lib/dpkg/diversions
                 File which contains the current list of diversions of the
                 system. It is located in the dpkg administration
                 directory, along with other files important to dpkg, such
                 as status or available.
                 Note: dpkg-divert preserves the old copy of this file,
                 with extension -old, before replacing it with the new one.


---------------------------------------------------

::

          When adding, default is --local and --divert original.distrib.
          When removing, --package or --local and --divert must match if
          specified.

          Directories can't be diverted with dpkg-divert.

          Care should be taken when diverting shared libraries, ldconfig(8)
          creates a symbolic link based on the DT_SONAME field embedded in
          the library.  Because ldconfig doesn't honour diverts (only dpkg
          does), the symlink may end up pointing at the diverted library,
          if a diverted library has the same SONAME as the undiverted one.


---------------------------------------------------------

::

          To divert all copies of a /usr/bin/example to
          /usr/bin/example.foo, i.e. directs all packages providing
          /usr/bin/example to install it as /usr/bin/example.foo,
          performing the rename if required:

          dpkg-divert --divert /usr/bin/example.foo --rename
                 /usr/bin/example

          To remove that diversion:

          dpkg-divert --rename --remove /usr/bin/example

          To divert any package trying to install /usr/bin/example to
          /usr/bin/example.foo, except your own wibble package:

          dpkg-divert --package wibble --divert /usr/bin/example.foo
                 --rename /usr/bin/example

          To remove that diversion:

          dpkg-divert --package wibble --rename --remove /usr/bin/example


---------------------------------------------------------

::

          dpkg(1).

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

   1.19.6-2-g6e42d5               2019-03-25                 dpkg-divert(1)

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
