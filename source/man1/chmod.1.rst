.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chmod(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SETUID AND SETGID                |                                   |
| BITS <#SETUID_AND_SETGID_BITS>`__ |                                   |
| \|                                |                                   |
| `RESTRICTED DELETI                |                                   |
| ON FLAG OR STICKY BIT <#RESTRICTE |                                   |
| D_DELETION_FLAG_OR_STICKY_BIT>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
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

   CHMOD(1)                      User Commands                     CHMOD(1)

NAME
-------------------------------------------------

::

          chmod - change file mode bits


---------------------------------------------------------

::

          chmod [OPTION]... MODE[,MODE]... FILE...
          chmod [OPTION]... OCTAL-MODE FILE...
          chmod [OPTION]... --reference=RFILE FILE...


---------------------------------------------------------------

::

          This manual page documents the GNU version of chmod.  chmod
          changes the file mode bits of each given file according to mode,
          which can be either a symbolic representation of changes to make,
          or an octal number representing the bit pattern for the new mode
          bits.

          The format of a symbolic mode is [ugoa...][[-+=][perms...]...],
          where perms is either zero or more letters from the set rwxXst,
          or a single letter from the set ugo.  Multiple symbolic modes can
          be given, separated by commas.

          A combination of the letters ugoa controls which users' access to
          the file will be changed: the user who owns it (u), other users
          in the file's group (g), other users not in the file's group (o),
          or all users (a).  If none of these are given, the effect is as
          if (a) were given, but bits that are set in the umask are not
          affected.

          The operator + causes the selected file mode bits to be added to
          the existing file mode bits of each file; - causes them to be
          removed; and = causes them to be added and causes unmentioned
          bits to be removed except that a directory's unmentioned set user
          and group ID bits are not affected.

          The letters rwxXst select file mode bits for the affected users:
          read (r), write (w), execute (or search for directories) (x),
          execute/search only if the file is a directory or already has
          execute permission for some user (X), set user or group ID on
          execution (s), restricted deletion flag or sticky bit (t).
          Instead of one or more of these letters, you can specify exactly
          one of the letters ugo: the permissions granted to the user who
          owns the file (u), the permissions granted to other users who are
          members of the file's group (g), and the permissions granted to
          users that are in neither of the two preceding categories (o).

          A numeric mode is from one to four octal digits (0-7), derived by
          adding up the bits with values 4, 2, and 1.  Omitted digits are
          assumed to be leading zeros.  The first digit selects the set
          user ID (4) and set group ID (2) and restricted deletion or
          sticky (1) attributes.  The second digit selects permissions for
          the user who owns the file: read (4), write (2), and execute (1);
          the third selects permissions for other users in the file's
          group, with the same values; and the fourth for other users not
          in the file's group, with the same values.

          chmod never changes the permissions of symbolic links; the chmod
          system call cannot change their permissions.  This is not a
          problem since the permissions of symbolic links are never used.
          However, for each symbolic link listed on the command line, chmod
          changes the permissions of the pointed-to file.  In contrast,
          chmod ignores symbolic links encountered during recursive
          directory traversals.


-------------------------------------------------------------------------------------

::

          chmod clears the set-group-ID bit of a regular file if the file's
          group ID does not match the user's effective group ID or one of
          the user's supplementary group IDs, unless the user has
          appropriate privileges.  Additional restrictions may cause the
          set-user-ID and set-group-ID bits of MODE or RFILE to be ignored.
          This behavior depends on the policy and functionality of the
          underlying chmod system call.  When in doubt, check the
          underlying system behavior.

          For directories chmod preserves set-user-ID and set-group-ID bits
          unless you explicitly specify otherwise.  You can set or clear
          the bits with symbolic modes like u+s and g-s.  To clear these
          bits for directories with a numeric mode requires an additional
          leading zero, or leading = like 00755 , or =755


---------------------------------------------------------------------------------------------------------------------

::

          The restricted deletion flag or sticky bit is a single bit, whose
          interpretation depends on the file type.  For directories, it
          prevents unprivileged users from removing or renaming a file in
          the directory unless they own the file or the directory; this is
          called the restricted deletion flag for the directory, and is
          commonly found on world-writable directories like /tmp.  For
          regular files on some older systems, the bit saves the program's
          text image on the swap device so it will load more quickly when
          run; this is called the sticky bit.


-------------------------------------------------------

::

          Change the mode of each FILE to MODE.  With --reference, change
          the mode of each FILE to that of RFILE.

          -c, --changes
                 like verbose but report only when a change is made

          -f, --silent, --quiet
                 suppress most error messages

          -v, --verbose
                 output a diagnostic for every file processed

          --no-preserve-root
                 do not treat '/' specially (the default)

          --preserve-root
                 fail to operate recursively on '/'

          --reference=RFILE
                 use RFILE's mode instead of MODE values

          -R, --recursive
                 change files and directories recursively

          --help display this help and exit

          --version
                 output version information and exit

          Each MODE is of the form
          '[ugoa]*([-+=]([rwxXst]*|[ugo]))+|[-+=][0-7]+'.


-----------------------------------------------------

::

          Written by David MacKenzie and Jim Meyering.


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

          chmod(2)

          Full documentation <https://www.gnu.org/software/coreutils/chmod>
          or available locally via: info '(coreutils) chmod invocation'

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

   GNU coreutils 8.32             March 2020                       CHMOD(1)

--------------

Pages that refer to this page: `bash(1) <../man1/bash.1.html>`__, 
`chacl(1) <../man1/chacl.1.html>`__, 
`find(1) <../man1/find.1.html>`__, 
`nfs4_setfacl(1) <../man1/nfs4_setfacl.1.html>`__, 
`rsync(1) <../man1/rsync.1.html>`__, 
`setfacl(1) <../man1/setfacl.1.html>`__, 
`chmod(2) <../man2/chmod.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__,  `lp(4) <../man4/lp.4.html>`__, 
`rsyncd.conf(5) <../man5/rsyncd.conf.5.html>`__, 
`path_resolution(7) <../man7/path_resolution.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`xattr(7) <../man7/xattr.7.html>`__, 
`mkfs.xfs(8) <../man8/mkfs.xfs.8.html>`__

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
