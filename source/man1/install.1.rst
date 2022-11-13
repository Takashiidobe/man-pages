.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

install(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COPYRIGHT <#COPYRIGHT>`__ \|  |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   INSTALL(1)                    User Commands                   INSTALL(1)

NAME
-------------------------------------------------

::

          install - copy files and set attributes


---------------------------------------------------------

::

          install [OPTION]... [-T] SOURCE DEST
          install [OPTION]... SOURCE... DIRECTORY
          install [OPTION]... -t DIRECTORY SOURCE...
          install [OPTION]... -d DIRECTORY...


---------------------------------------------------------------

::

          This install program copies files (often just compiled) into
          destination locations you choose.  If you want to download and
          install a ready-to-use package on a GNU/Linux system, you should
          instead be using a package manager like yum(1) or apt-get(1).

          In the first three forms, copy SOURCE to DEST or multiple
          SOURCE(s) to the existing DIRECTORY, while setting permission
          modes and owner/group.  In the 4th form, create all components of
          the given DIRECTORY(ies).

          Mandatory arguments to long options are mandatory for short
          options too.

          --backup[=CONTROL]
                 make a backup of each existing destination file

          -b     like --backup but does not accept an argument

          -c     (ignored)

          -C, --compare
                 compare each pair of source and destination files, and in
                 some cases, do not modify the destination at all

          -d, --directory
                 treat all arguments as directory names; create all
                 components of the specified directories

          -D     create all leading components of DEST except the last, or
                 all components of --target-directory, then copy SOURCE to
                 DEST

          -g, --group=GROUP
                 set group ownership, instead of process' current group

          -m, --mode=MODE
                 set permission mode (as in chmod), instead of rwxr-xr-x

          -o, --owner=OWNER
                 set ownership (super-user only)

          -p, --preserve-timestamps
                 apply access/modification times of SOURCE files to
                 corresponding destination files

          -s, --strip
                 strip symbol tables

          --strip-program=PROGRAM
                 program used to strip binaries

          -S, --suffix=SUFFIX
                 override the usual backup suffix

          -t, --target-directory=DIRECTORY
                 copy all SOURCE arguments into DIRECTORY

          -T, --no-target-directory
                 treat DEST as a normal file

          -v, --verbose
                 print the name of each directory as it is created

          --preserve-context
                 preserve SELinux security context

          -Z     set SELinux security context of destination file and each
                 created directory to default type

          --context[=CTX]
                 like -Z, or if CTX is specified then set the SELinux or
                 SMACK security context to CTX

          --help display this help and exit

          --version
                 output version information and exit

          The backup suffix is '~', unless set with --suffix or
          SIMPLE_BACKUP_SUFFIX.  The version control method may be selected
          via the --backup option or through the VERSION_CONTROL
          environment variable.  Here are the values:

          none, off
                 never make backups (even if --backup is given)

          numbered, t
                 make numbered backups

          existing, nil
                 numbered if numbered backups exist, simple otherwise

          simple, never
                 always make simple backups


-----------------------------------------------------

::

          Written by David MacKenzie.


---------------------------------------------------------------------

::

          GNU coreutils online help:
          <https://www.gnu.org/software/coreutils/>
          Report any translation bugs to
          <https://translationproject.org/team/>


-----------------------------------------------------------

::

          Copyright © 2020 Free Software Foundation, Inc.  License GPLv3+:
          GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
          This is free software: you are free to change and redistribute
          it.  There is NO WARRANTY, to the extent permitted by law.


---------------------------------------------------------

::

          Full documentation
          <https://www.gnu.org/software/coreutils/install>
          or available locally via: info '(coreutils) install invocation'

COLOPHON
---------------------------------------------------------

::

          This page is part of the coreutils (basic file, shell and text
          manipulation utilities) project.  Information about the project
          can be found at ⟨http://www.gnu.org/software/coreutils/⟩.  If you
          have a bug report for this manual page, see
          ⟨http://www.gnu.org/software/coreutils/⟩.  This page was obtained
          from the tarball coreutils-8.32.tar.xz fetched from
          ⟨http://ftp.gnu.org/gnu/coreutils/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   GNU coreutils 8.32             March 2020                     INSTALL(1)

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
