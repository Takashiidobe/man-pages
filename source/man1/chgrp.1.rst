.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chgrp(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   CHGRP(1)                      User Commands                     CHGRP(1)

NAME
-------------------------------------------------

::

          chgrp - change group ownership


---------------------------------------------------------

::

          chgrp [OPTION]... GROUP FILE...
          chgrp [OPTION]... --reference=RFILE FILE...


---------------------------------------------------------------

::

          Change the group of each FILE to GROUP.  With --reference, change
          the group of each FILE to that of RFILE.

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

          --no-preserve-root
                 do not treat '/' specially (the default)

          --preserve-root
                 fail to operate recursively on '/'

          --reference=RFILE
                 use RFILE's group rather than specifying a GROUP value

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


---------------------------------------------------------

::

          chgrp staff /u
                 Change the group of /u to "staff".

          chgrp -hR staff /u
                 Change the group of /u and subfiles to "staff".


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

          chown(1), chown(2)

          Full documentation <https://www.gnu.org/software/coreutils/chgrp>
          or available locally via: info '(coreutils) chgrp invocation'

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

   GNU coreutils 8.32             March 2020                       CHGRP(1)

--------------

Pages that refer to this page: `chown(2) <../man2/chown.2.html>`__, 
`group(5) <../man5/group.5.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__

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
