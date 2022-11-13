.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rm(1) — Linux manual page
=========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
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

   RM(1)                         User Commands                        RM(1)

NAME
-------------------------------------------------

::

          rm - remove files or directories


---------------------------------------------------------

::

          rm [OPTION]... [FILE]...


---------------------------------------------------------------

::

          This manual page documents the GNU version of rm.  rm removes
          each specified file.  By default, it does not remove directories.

          If the -I or --interactive=once option is given, and there are
          more than three files or the -r, -R, or --recursive are given,
          then rm prompts the user for whether to proceed with the entire
          operation.  If the response is not affirmative, the entire
          command is aborted.

          Otherwise, if a file is unwritable, standard input is a terminal,
          and the -f or --force option is not given, or the -i or
          --interactive=always option is given, rm prompts the user for
          whether to remove the file.  If the response is not affirmative,
          the file is skipped.


-------------------------------------------------------

::

          Remove (unlink) the FILE(s).

          -f, --force
                 ignore nonexistent files and arguments, never prompt

          -i     prompt before every removal

          -I     prompt once before removing more than three files, or when
                 removing recursively; less intrusive than -i, while still
                 giving protection against most mistakes

          --interactive[=WHEN]
                 prompt according to WHEN: never, once (-I), or always
                 (-i); without WHEN, prompt always

          --one-file-system
                 when removing a hierarchy recursively, skip any directory
                 that is on a file system different from that of the
                 corresponding command line argument

          --no-preserve-root
                 do not treat '/' specially

          --preserve-root[=all]
                 do not remove '/' (default); with 'all', reject any
                 command line argument on a separate device from its parent

          -r, -R, --recursive
                 remove directories and their contents recursively

          -d, --dir
                 remove empty directories

          -v, --verbose
                 explain what is being done

          --help display this help and exit

          --version
                 output version information and exit

          By default, rm does not remove directories.  Use the --recursive
          (-r or -R) option to remove each listed directory, too, along
          with all of its contents.

          To remove a file whose name starts with a '-', for example
          '-foo', use one of these commands:

                 rm -- -foo

                 rm ./-foo

          Note that if you use rm to remove a file, it might be possible to
          recover some of its contents, given sufficient expertise and/or
          time.  For greater assurance that the contents are truly
          unrecoverable, consider using shred.


-----------------------------------------------------

::

          Written by Paul Rubin, David MacKenzie, Richard M. Stallman, and
          Jim Meyering.


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

          unlink(1), unlink(2), chattr(1), shred(1)

          Full documentation <https://www.gnu.org/software/coreutils/rm>
          or available locally via: info '(coreutils) rm invocation'

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

   GNU coreutils 8.32             March 2020                          RM(1)

--------------

Pages that refer to this page: `rmdir(2) <../man2/rmdir.2.html>`__, 
`unlink(2) <../man2/unlink.2.html>`__, 
`remove(3) <../man3/remove.3.html>`__, 
`mq_overview(7) <../man7/mq_overview.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`debugfs(8) <../man8/debugfs.8.html>`__, 
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
