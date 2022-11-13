.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

shred(1) — Linux manual page
============================

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

   SHRED(1)                      User Commands                     SHRED(1)

NAME
-------------------------------------------------

::

          shred - overwrite a file to hide its contents, and optionally
          delete it


---------------------------------------------------------

::

          shred [OPTION]... FILE...


---------------------------------------------------------------

::

          Overwrite the specified FILE(s) repeatedly, in order to make it
          harder for even very expensive hardware probing to recover the
          data.

          If FILE is -, shred standard output.

          Mandatory arguments to long options are mandatory for short
          options too.

          -f, --force
                 change permissions to allow writing if necessary

          -n, --iterations=N
                 overwrite N times instead of the default (3)

          --random-source=FILE
                 get random bytes from FILE

          -s, --size=N
                 shred this many bytes (suffixes like K, M, G accepted)

          -u     deallocate and remove file after overwriting

          --remove[=HOW]
                 like -u but give control on HOW to delete;  See below

          -v, --verbose
                 show progress

          -x, --exact
                 do not round file sizes up to the next full block;

                 this is the default for non-regular files

          -z, --zero
                 add a final overwrite with zeros to hide shredding

          --help display this help and exit

          --version
                 output version information and exit

          Delete FILE(s) if --remove (-u) is specified.  The default is not
          to remove the files because it is common to operate on device
          files like /dev/hda, and those files usually should not be
          removed.  The optional HOW parameter indicates how to remove a
          directory entry: 'unlink' => use a standard unlink call.  'wipe'
          => also first obfuscate bytes in the name.  'wipesync' => also
          sync each obfuscated byte to disk.  The default mode is
          'wipesync', but note it can be expensive.

          CAUTION: shred assumes the file system and hardware overwrite
          data in place.  Although this is common, many platforms operate
          otherwise.  Also, backups and mirrors may contain unremovable
          copies that will let a shredded file be recovered later.  See the
          GNU coreutils manual for details.


-----------------------------------------------------

::

          Written by Colin Plumb.


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

          Full documentation <https://www.gnu.org/software/coreutils/shred>
          or available locally via: info '(coreutils) shred invocation'

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

   GNU coreutils 8.32             March 2020                       SHRED(1)

--------------

Pages that refer to this page: `rm(1) <../man1/rm.1.html>`__, 
`logrotate(8) <../man8/logrotate.8.html>`__

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
