.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mv(1) — Linux manual page
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

   MV(1)                         User Commands                        MV(1)

NAME
-------------------------------------------------

::

          mv - move (rename) files


---------------------------------------------------------

::

          mv [OPTION]... [-T] SOURCE DEST
          mv [OPTION]... SOURCE... DIRECTORY
          mv [OPTION]... -t DIRECTORY SOURCE...


---------------------------------------------------------------

::

          Rename SOURCE to DEST, or move SOURCE(s) to DIRECTORY.

          Mandatory arguments to long options are mandatory for short
          options too.

          --backup[=CONTROL]
                 make a backup of each existing destination file

          -b     like --backup but does not accept an argument

          -f, --force
                 do not prompt before overwriting

          -i, --interactive
                 prompt before overwrite

          -n, --no-clobber
                 do not overwrite an existing file

          If you specify more than one of -i, -f, -n, only the final one
          takes effect.

          --strip-trailing-slashes
                 remove any trailing slashes from each SOURCE argument

          -S, --suffix=SUFFIX
                 override the usual backup suffix

          -t, --target-directory=DIRECTORY
                 move all SOURCE arguments into DIRECTORY

          -T, --no-target-directory
                 treat DEST as a normal file

          -u, --update
                 move only when the SOURCE file is newer than the
                 destination file or when the destination file is missing

          -v, --verbose
                 explain what is being done

          -Z, --context
                 set SELinux security context of destination file to
                 default type

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

          Written by Mike Parker, David MacKenzie, and Jim Meyering.


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

          rename(2)

          Full documentation <https://www.gnu.org/software/coreutils/mv>
          or available locally via: info '(coreutils) mv invocation'

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

   GNU coreutils 8.32             March 2020                          MV(1)

--------------

Pages that refer to this page: `rename(1) <../man1/rename.1.html>`__, 
`rename(2) <../man2/rename.2.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`lsof(8) <../man8/lsof.8.html>`__

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
