.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-sysusers(8) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CREDENTIALS <#CREDENTIALS>`__ \| |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-SYSUSERS(8)         systemd-sysusers         SYSTEMD-SYSUSERS(8)

NAME
-------------------------------------------------

::

          systemd-sysusers, systemd-sysusers.service - Allocate system
          users and groups


---------------------------------------------------------

::

          systemd-sysusers [OPTIONS...] [CONFIGFILE...]

          systemd-sysusers.service


---------------------------------------------------------------

::

          systemd-sysusers creates system users and groups, based on the
          file format and location specified in sysusers.d(5).

          If invoked with no arguments, it applies all directives from all
          files found in the directories specified by sysusers.d(5). When
          invoked with positional arguments, if option --replace=PATH is
          specified, arguments specified on the command line are used
          instead of the configuration file PATH. Otherwise, just the
          configuration specified by the command line arguments is
          executed. The string "-" may be specified instead of a filename
          to instruct systemd-sysusers to read the configuration from
          standard input. If only the basename of a file is specified, all
          configuration directories are searched for a matching file and
          the file found that has the highest priority is executed.


-------------------------------------------------------

::

          The following options are understood:

          --root=root
              Takes a directory path as an argument. All paths will be
              prefixed with the given alternate root path, including config
              search paths.

          --image=image
              Takes a path to a disk image file or block device node. If
              specified all operations are applied to file system in the
              indicated disk image. This is similar to --root= but operates
              on file systems stored in disk images or block devices. The
              disk image should either contain just a file system or a set
              of file systems within a GPT partition table, following the
              Discoverable Partitions Specification[1]. For further
              information on supported disk images, see systemd-nspawn(1)'s
              switch of the same name.

          --replace=PATH
              When this option is given, one ore more positional arguments
              must be specified. All configuration files found in the
              directories listed in sysusers.d(5) will be read, and the
              configuration given on the command line will be handled
              instead of and with the same priority as the configuration
              file PATH.

              This option is intended to be used when package installation
              scripts are running and files belonging to that package are
              not yet available on disk, so their contents must be given on
              the command line, but the admin configuration might already
              exist and should be given higher priority.

              Example 1. RPM installation script for radvd

                  echo 'u radvd - "radvd daemon"' | \
                            systemd-sysusers --replace=/usr/lib/sysusers.d/radvd.conf -

              This will create the radvd user as if
              /usr/lib/sysusers.d/radvd.conf was already on disk. An admin
              might override the configuration specified on the command
              line by placing /etc/sysusers.d/radvd.conf or even
              /etc/sysusers.d/00-overrides.conf.

              Note that this is the expanded form, and when used in a
              package, this would be written using a macro with "radvd" and
              a file containing the configuration line as arguments.

          --inline
              Treat each positional argument as a separate configuration
              line instead of a file name.

          --cat-config
              Copy the contents of config files to standard output. Before
              each file, the filename is printed as a comment.

          --no-pager
              Do not pipe output into a pager.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------------

::

          systemd-sysusers supports the service credentials logic as
          implemented by LoadCredential=/SetCredential= (see
          systemd.exec(1) for details). The following credentials are used
          when passed in:

          "passwd.hashed-password.user"
              A UNIX hashed password string to use for the specified user,
              when creating an entry for it. This is particularly useful
              for the "root" user as it allows provisioning the default
              root password to use via a unit file drop-in or from a
              container manager passing in this credential. Note that
              setting this credential has no effect if the specified user
              account already exists. This credential is hence primarily
              useful in first boot scenarios or systems that are fully
              stateless and come up with an empty /etc/ on every boot.

          "passwd.plaintext-password.user"
              Similar to "passwd.hashed-password.user" but expect a
              literal, plaintext password, which is then automatically
              hashed before used for the user account. If both the hashed
              and the plaintext credential are specified for the same user
              the former takes precedence. It's generally recommended to
              specify the hashed version; however in test environments with
              weaker requirements on security it might be easier to pass
              passwords in plaintext instead.

          "passwd.shell.user"
              Specifies the shell binary to use for the specified account
              when creating it.

          Note that by default the systemd-sysusers.service unit file is
          set up to inherit the "passwd.hashed-password.root",
          "passwd.plaintext-password.root" and "passwd.shell.root"
          credentials from the service manager. Thus, when invoking a
          container with an unpopulated /etc/ for the first time it is
          possible to configure the root user's password to be "systemd"
          like this:

              # systemd-nspawn --image=... --set-credential=passwd.hashed-password.root:'$y$j9T$yAuRJu1o5HioZAGDYPU5d.$F64ni6J2y2nNQve90M/p0ZP0ECP/qqzipNyaY9fjGpC' ...

          Note again that the data specified in these credentials is
          consulted only when creating an account for the first time, it
          may not be used for changing the password or shell of an account
          that already exists.

          Use mkpasswd(1) for generating UNIX password hashes from the
          command line.


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------------

::

          systemd(1), sysusers.d(5), Users, Groups, UIDs and GIDs on
          systemd systems[2], systemd.exec(1), mkpasswd(1)


---------------------------------------------------

::

           1. Discoverable Partitions Specification
              https://systemd.io/DISCOVERABLE_PARTITIONS

           2. Users, Groups, UIDs and GIDs on systemd systems
              https://systemd.io/UIDS-GIDS

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                          SYSTEMD-SYSUSERS(8)

--------------

Pages that refer to this page:
`systemd-firstboot(1) <../man1/systemd-firstboot.1.html>`__, 
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`sysusers.d(5) <../man5/sysusers.d.5.html>`__, 
`systemd-sysext(8) <../man8/systemd-sysext.8.html>`__

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
