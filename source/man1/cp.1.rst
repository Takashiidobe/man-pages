.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cp(1) — Linux manual page
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

   CP(1)                         User Commands                        CP(1)

NAME
-------------------------------------------------

::

          cp - copy files and directories


---------------------------------------------------------

::

          cp [OPTION]... [-T] SOURCE DEST
          cp [OPTION]... SOURCE... DIRECTORY
          cp [OPTION]... -t DIRECTORY SOURCE...


---------------------------------------------------------------

::

          Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.

          Mandatory arguments to long options are mandatory for short
          options too.

          -a, --archive
                 same as -dR --preserve=all

          --attributes-only
                 don't copy the file data, just the attributes

          --backup[=CONTROL]
                 make a backup of each existing destination file

          -b     like --backup but does not accept an argument

          --copy-contents
                 copy contents of special files when recursive

          -d     same as --no-dereference --preserve=links

          -f, --force
                 if an existing destination file cannot be opened, remove
                 it and try again (this option is ignored when the -n
                 option is also used)

          -i, --interactive
                 prompt before overwrite (overrides a previous -n option)

          -H     follow command-line symbolic links in SOURCE

          -l, --link
                 hard link files instead of copying

          -L, --dereference
                 always follow symbolic links in SOURCE

          -n, --no-clobber
                 do not overwrite an existing file (overrides a previous -i
                 option)

          -P, --no-dereference
                 never follow symbolic links in SOURCE

          -p     same as --preserve=mode,ownership,timestamps

          --preserve[=ATTR_LIST]
                 preserve the specified attributes (default:
                 mode,ownership,timestamps), if possible additional
                 attributes: context, links, xattr, all

          --no-preserve=ATTR_LIST
                 don't preserve the specified attributes

          --parents
                 use full source file name under DIRECTORY

          -R, -r, --recursive
                 copy directories recursively

          --reflink[=WHEN]
                 control clone/CoW copies. See below

          --remove-destination
                 remove each existing destination file before attempting to
                 open it (contrast with --force)

          --sparse=WHEN
                 control creation of sparse files. See below

          --strip-trailing-slashes
                 remove any trailing slashes from each SOURCE argument

          -s, --symbolic-link
                 make symbolic links instead of copying

          -S, --suffix=SUFFIX
                 override the usual backup suffix

          -t, --target-directory=DIRECTORY
                 copy all SOURCE arguments into DIRECTORY

          -T, --no-target-directory
                 treat DEST as a normal file

          -u, --update
                 copy only when the SOURCE file is newer than the
                 destination file or when the destination file is missing

          -v, --verbose
                 explain what is being done

          -x, --one-file-system
                 stay on this file system

          -Z     set SELinux security context of destination file to
                 default type

          --context[=CTX]
                 like -Z, or if CTX is specified then set the SELinux or
                 SMACK security context to CTX

          --help display this help and exit

          --version
                 output version information and exit

          By default, sparse SOURCE files are detected by a crude heuristic
          and the corresponding DEST file is made sparse as well.  That is
          the behavior selected by --sparse=auto.  Specify --sparse=always
          to create a sparse DEST file whenever the SOURCE file contains a
          long enough sequence of zero bytes.  Use --sparse=never to
          inhibit creation of sparse files.

          When --reflink[=always] is specified, perform a lightweight copy,
          where the data blocks are copied only when modified.  If this is
          not possible the copy fails, or if --reflink=auto is specified,
          fall back to a standard copy.  Use --reflink=never to ensure a
          standard copy is performed.

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

          As a special case, cp makes a backup of SOURCE when the force and
          backup options are given and SOURCE and DEST are the same name
          for an existing, regular file.


-----------------------------------------------------

::

          Written by Torbjorn Granlund, David MacKenzie, and Jim Meyering.


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

          Full documentation <https://www.gnu.org/software/coreutils/cp>
          or available locally via: info '(coreutils) cp invocation'

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

   GNU coreutils 8.32             March 2020                          CP(1)

--------------

Pages that refer to this page: `rsync(1) <../man1/rsync.1.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`e2image(8) <../man8/e2image.8.html>`__, 
`readprofile(8) <../man8/readprofile.8.html>`__, 
`swapon(8) <../man8/swapon.8.html>`__

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
