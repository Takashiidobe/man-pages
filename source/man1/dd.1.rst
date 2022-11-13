.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dd(1) — Linux manual page
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

   DD(1)                         User Commands                        DD(1)

NAME
-------------------------------------------------

::

          dd - convert and copy a file


---------------------------------------------------------

::

          dd [OPERAND]...
          dd OPTION


---------------------------------------------------------------

::

          Copy a file, converting and formatting according to the operands.

          bs=BYTES
                 read and write up to BYTES bytes at a time (default: 512);
                 overrides ibs and obs

          cbs=BYTES
                 convert BYTES bytes at a time

          conv=CONVS
                 convert the file as per the comma separated symbol list

          count=N
                 copy only N input blocks

          ibs=BYTES
                 read up to BYTES bytes at a time (default: 512)

          if=FILE
                 read from FILE instead of stdin

          iflag=FLAGS
                 read as per the comma separated symbol list

          obs=BYTES
                 write BYTES bytes at a time (default: 512)

          of=FILE
                 write to FILE instead of stdout

          oflag=FLAGS
                 write as per the comma separated symbol list

          seek=N skip N obs-sized blocks at start of output

          skip=N skip N ibs-sized blocks at start of input

          status=LEVEL
                 The LEVEL of information to print to stderr; 'none'
                 suppresses everything but error messages, 'noxfer'
                 suppresses the final transfer statistics, 'progress' shows
                 periodic transfer statistics

          N and BYTES may be followed by the following multiplicative
          suffixes: c=1, w=2, b=512, kB=1000, K=1024, MB=1000*1000,
          M=1024*1024, xM=M, GB=1000*1000*1000, G=1024*1024*1024, and so on
          for T, P, E, Z, Y.  Binary prefixes can be used, too: KiB=K,
          MiB=M, and so on.

          Each CONV symbol may be:

          ascii  from EBCDIC to ASCII

          ebcdic from ASCII to EBCDIC

          ibm    from ASCII to alternate EBCDIC

          block  pad newline-terminated records with spaces to cbs-size

          unblock
                 replace trailing spaces in cbs-size records with newline

          lcase  change upper case to lower case

          ucase  change lower case to upper case

          sparse try to seek rather than write all-NUL output blocks

          swab   swap every pair of input bytes

          sync   pad every input block with NULs to ibs-size; when used
                 with block or unblock, pad with spaces rather than NULs

          excl   fail if the output file already exists

          nocreat
                 do not create the output file

          notrunc
                 do not truncate the output file

          noerror
                 continue after read errors

          fdatasync
                 physically write output file data before finishing

          fsync  likewise, but also write metadata

          Each FLAG symbol may be:

          append append mode (makes sense only for output; conv=notrunc
                 suggested)

          direct use direct I/O for data

          directory
                 fail unless a directory

          dsync  use synchronized I/O for data

          sync   likewise, but also for metadata

          fullblock
                 accumulate full blocks of input (iflag only)

          nonblock
                 use non-blocking I/O

          noatime
                 do not update access time

          nocache
                 Request to drop cache.  See also oflag=sync

          noctty do not assign controlling terminal from file

          nofollow
                 do not follow symlinks

          count_bytes
                 treat 'count=N' as a byte count (iflag only)

          skip_bytes
                 treat 'skip=N' as a byte count (iflag only)

          seek_bytes
                 treat 'seek=N' as a byte count (oflag only)

          Sending a USR1 signal to a running 'dd' process makes it print
          I/O statistics to standard error and then resume copying.

          Options are:

          --help display this help and exit

          --version
                 output version information and exit


-----------------------------------------------------

::

          Written by Paul Rubin, David MacKenzie, and Stuart Kemp.


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

          Full documentation <https://www.gnu.org/software/coreutils/dd>
          or available locally via: info '(coreutils) dd invocation'

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

   GNU coreutils 8.32             March 2020                          DD(1)

--------------

Pages that refer to this page:
`truncate(1) <../man1/truncate.1.html>`__, 
`xfs(5) <../man5/xfs.5.html>`__,  `fdisk(8) <../man8/fdisk.8.html>`__, 
`raw(8) <../man8/raw.8.html>`__, 
`sfdisk(8) <../man8/sfdisk.8.html>`__, 
`swapon(8) <../man8/swapon.8.html>`__, 
`xfs_copy(8) <../man8/xfs_copy.8.html>`__, 
`xfs_repair(8) <../man8/xfs_repair.8.html>`__

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
