.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chown(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
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

   CHOWN(1)                      User Commands                     CHOWN(1)

NAME
-------------------------------------------------

::

          chown - change file owner and group


---------------------------------------------------------

::

          chown [OPTION]... [OWNER][:[GROUP]] FILE...
          chown [OPTION]... --reference=RFILE FILE...


---------------------------------------------------------------

::

          This manual page documents the GNU version of chown.  chown
          changes the user and/or group ownership of each given file.  If
          only an owner (a user name or numeric user ID) is given, that
          user is made the owner of each given file, and the files' group
          is not changed.  If the owner is followed by a colon and a group
          name (or numeric group ID), with no spaces between them, the
          group ownership of the files is changed as well.  If a colon but
          no group name follows the user name, that user is made the owner
          of the files and the group of the files is changed to that user's
          login group.  If the colon and group are given, but the owner is
          omitted, only the group of the files is changed; in this case,
          chown performs the same function as chgrp.  If only a colon is
          given, or if the entire operand is empty, neither the owner nor
          the group is changed.


-------------------------------------------------------

::

          Change the owner and/or group of each FILE to OWNER and/or GROUP.
          With --reference, change the owner and group of each FILE to
          those of RFILE.

          -c, --changes
                 like verbose but report only when a change is made

          -f, --silent, --quiet
                 suppress most error messages

          -v, --verbose
                 output a diagnostic for every file processed

          --dereference
                 affect the referent of each symbolic link (this is the
                 default), rather than the symbolic link itself

          -h, --no-dereference
                 affect symbolic links instead of any referenced file
                 (useful only on systems that can change the ownership of a
                 symlink)

          --from=CURRENT_OWNER:CURRENT_GROUP
                 change the owner and/or group of each file only if its
                 current owner and/or group match those specified here.
                 Either may be omitted, in which case a match is not
                 required for the omitted attribute

          --no-preserve-root
                 do not treat '/' specially (the default)

          --preserve-root
                 fail to operate recursively on '/'

          --reference=RFILE
                 use RFILE's owner and group rather than specifying
                 OWNER:GROUP values

          -R, --recursive
                 operate on files and directories recursively

          The following options modify how a hierarchy is traversed when
          the -R option is also specified.  If more than one is specified,
          only the final one takes effect.

          -H     if a command line argument is a symbolic link to a
                 directory, traverse it

          -L     traverse every symbolic link to a directory encountered

          -P     do not traverse any symbolic links (default)

          --help display this help and exit

          --version
                 output version information and exit

          Owner is unchanged if missing.  Group is unchanged if missing,
          but changed to login group if implied by a ':' following a
          symbolic OWNER.  OWNER and GROUP may be numeric as well as
          symbolic.


---------------------------------------------------------

::

          chown root /u
                 Change the owner of /u to "root".

          chown root:staff /u
                 Likewise, but also change its group to "staff".

          chown -hR root /u
                 Change the owner of /u and subfiles to "root".


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

          chown(2)

          Full documentation <https://www.gnu.org/software/coreutils/chown>
          or available locally via: info '(coreutils) chown invocation'

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

   GNU coreutils 8.32             March 2020                       CHOWN(1)

--------------

Pages that refer to this page: `chgrp(1) <../man1/chgrp.1.html>`__, 
`chown(2) <../man2/chown.2.html>`__,  `fd(4) <../man4/fd.4.html>`__, 
`hd(4) <../man4/hd.4.html>`__,  `initrd(4) <../man4/initrd.4.html>`__, 
`lp(4) <../man4/lp.4.html>`__,  `mem(4) <../man4/mem.4.html>`__, 
`null(4) <../man4/null.4.html>`__,  `ram(4) <../man4/ram.4.html>`__, 
`tty(4) <../man4/tty.4.html>`__,  `ttyS(4) <../man4/ttyS.4.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`sm-notify(8) <../man8/sm-notify.8.html>`__, 
`start-stop-daemon(8) <../man8/start-stop-daemon.8.html>`__, 
`statd(8) <../man8/statd.8.html>`__

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
