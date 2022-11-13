.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ln(1) — Linux manual page
=========================

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

   LN(1)                         User Commands                        LN(1)

NAME
-------------------------------------------------

::

          ln - make links between files


---------------------------------------------------------

::

          ln [OPTION]... [-T] TARGET LINK_NAME
          ln [OPTION]... TARGET
          ln [OPTION]... TARGET... DIRECTORY
          ln [OPTION]... -t DIRECTORY TARGET...


---------------------------------------------------------------

::

          In the 1st form, create a link to TARGET with the name LINK_NAME.
          In the 2nd form, create a link to TARGET in the current
          directory.  In the 3rd and 4th forms, create links to each TARGET
          in DIRECTORY.  Create hard links by default, symbolic links with
          --symbolic.  By default, each destination (name of new link)
          should not already exist.  When creating hard links, each TARGET
          must exist.  Symbolic links can hold arbitrary text; if later
          resolved, a relative link is interpreted in relation to its
          parent directory.

          Mandatory arguments to long options are mandatory for short
          options too.

          --backup[=CONTROL]
                 make a backup of each existing destination file

          -b     like --backup but does not accept an argument

          -d, -F, --directory
                 allow the superuser to attempt to hard link directories
                 (note: will probably fail due to system restrictions, even
                 for the superuser)

          -f, --force
                 remove existing destination files

          -i, --interactive
                 prompt whether to remove destinations

          -L, --logical
                 dereference TARGETs that are symbolic links

          -n, --no-dereference
                 treat LINK_NAME as a normal file if it is a symbolic link
                 to a directory

          -P, --physical
                 make hard links directly to symbolic links

          -r, --relative
                 create symbolic links relative to link location

          -s, --symbolic
                 make symbolic links instead of hard links

          -S, --suffix=SUFFIX
                 override the usual backup suffix

          -t, --target-directory=DIRECTORY
                 specify the DIRECTORY in which to create the links

          -T, --no-target-directory
                 treat LINK_NAME as a normal file always

          -v, --verbose
                 print name of each linked file

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

          Using -s ignores -L and -P.  Otherwise, the last option specified
          controls behavior when a TARGET is a symbolic link, defaulting to
          -P.


-----------------------------------------------------

::

          Written by Mike Parker and David MacKenzie.


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

          link(2), symlink(2)

          Full documentation <https://www.gnu.org/software/coreutils/ln>
          or available locally via: info '(coreutils) ln invocation'

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

   GNU coreutils 8.32             March 2020                          LN(1)

--------------

Pages that refer to this page: `dh_link(1) <../man1/dh_link.1.html>`__, 
`pmlogmv(1) <../man1/pmlogmv.1.html>`__, 
`update-alternatives(1) <../man1/update-alternatives.1.html>`__, 
`link(2) <../man2/link.2.html>`__, 
`symlink(2) <../man2/symlink.2.html>`__, 
`hier(7) <../man7/hier.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`sln(8) <../man8/sln.8.html>`__

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
