.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-statoverride(1) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dpkg-statoverride(1)           dpkg suite           dpkg-statoverride(1)

NAME
-------------------------------------------------

::

          dpkg-statoverride - override ownership and mode of files


---------------------------------------------------------

::

          dpkg-statoverride [option...] command


---------------------------------------------------------------

::

          “stat overrides” are a way to tell dpkg(1) to use a different
          owner or mode for a path when a package is installed (this
          applies to any filesystem object that dpkg handles, including
          directories, devices, etc.). This can be used to force programs
          that are normally setuid to be install without a setuid flag, or
          only executable by a certain group.

          dpkg-statoverride is a utility to manage the list of stat
          overrides. It has three basic functions: adding, removing and
          listing overrides.


---------------------------------------------------------

::

          --add user group mode path
                 Add an override for path. path does not need to exist when
                 this command is used; the override will be stored and used
                 later.  Users and groups can be specified by their name
                 (for example root or nobody), or by their number by
                 prepending the number with a ‘#’ (for example #0 or
                 #65534).  The mode needs to be specified in octal.

                 If --update is specified and path exists, it is
                 immediately set to the new owner and mode.

          --remove path
                 Remove an override for path, the status of path is left
                 unchanged by this command.

          --list [glob-pattern]
                 List all overrides. If a glob pattern is specified
                 restrict the output to overrides which match the glob.

          --help Show the usage message and exit.

          --force-help
                 Give help about the --force-thing options (since dpkg
                 1.19.5).

          --version
                 Show the version and exit.


-------------------------------------------------------

::

          --admindir directory
                 Set the administrative directory to directory.  This is
                 where the statoverride file is stored.  Defaults to
                 «/usr/local/var/lib/dpkg».

          --instdir directory
                 Set the installation directory, which refers to the
                 directory where packages get installed (since dpkg
                 1.19.2).  Defaults to «/».

          --root directory
                 Set the root directory to directory, which sets the
                 installation directory to «directory» and the
                 administrative directory to
                 «directory/usr/local/var/lib/dpkg» (since dpkg 1.19.2).

          --force-things
          --no-force-things, --refuse-things
                 Force or refuse (no-force and refuse mean the same thing)
                 to do some things (since dpkg 1.19.5).  things is a comma
                 separated list of things specified below.  --force-help
                 displays a message describing them.  Things marked with
                 (*) are forced by default.

                 Warning: These options are mostly intended to be used by
                 experts only.  Using them without fully understanding
                 their effects may break your whole system.

                 all: Turns on (or off) all force options.

                 statoverride-add: Overwrite an existing stat override when
                 adding it (since dpkg 1.19.5).

                 statoverride-remove: Ignore a missing stat override when
                 removing it (since dpkg 1.19.5).

                 security-mac(*): Use platform-specific Mandatory Access
                 Controls (MAC) based security when installing files into
                 the filesystem (since dpkg 1.19.5).  On Linux systems the
                 implementation uses SELinux.

          --force
                 Force an action, even if a sanity check would otherwise
                 prohibit it.  This is necessary to override an existing
                 override.  This option is deprecated (since dpkg 1.19.5),
                 it is replaced by --force-all.

          --update
                 Immediately try to change the path to the new owner and
                 mode if it exists.

          --quiet
                 Be less verbose about what we do.


---------------------------------------------------------------

::

          0      The requested action was successfully performed.

          1      For --list, if there are no overrides or none match the
                 supplied glob.

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

          DPKG_FORCE
                 If set and none of the --force-... options have been
                 specified, it will be used as the force options to use
                 (since dpkg 1.19.5).

          DPKG_COLORS
                 Sets the color mode (since dpkg 1.18.5).  The currently
                 accepted values are: auto (default), always and never.


---------------------------------------------------

::

          /usr/local/var/lib/dpkg/statoverride
                 File which contains the current list of stat overrides of
                 the system. It is located in the dpkg administration
                 directory, along with other files important to dpkg, such
                 as status or available.
                 Note: dpkg-statoverride preserves the old copy of this
                 file, with extension “-old”, before replacing it with the
                 new one.


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

   1.19.6-2-g6e42d5               2019-03-25           dpkg-statoverride(1)

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
