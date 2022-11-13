.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mknod(1) — Linux manual page
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

   MKNOD(1)                      User Commands                     MKNOD(1)

NAME
-------------------------------------------------

::

          mknod - make block or character special files


---------------------------------------------------------

::

          mknod [OPTION]... NAME TYPE [MAJOR MINOR]


---------------------------------------------------------------

::

          Create the special file NAME of the given TYPE.

          Mandatory arguments to long options are mandatory for short
          options too.

          -m, --mode=MODE
                 set file permission bits to MODE, not a=rw - umask

          -Z     set the SELinux security context to default type

          --context[=CTX]
                 like -Z, or if CTX is specified then set the SELinux or
                 SMACK security context to CTX

          --help display this help and exit

          --version
                 output version information and exit

          Both MAJOR and MINOR must be specified when TYPE is b, c, or u,
          and they must be omitted when TYPE is p.  If MAJOR or MINOR
          begins with 0x or 0X, it is interpreted as hexadecimal;
          otherwise, if it begins with 0, as octal; otherwise, as decimal.
          TYPE may be:

          b      create a block (buffered) special file

          c, u   create a character (unbuffered) special file

          p      create a FIFO

          NOTE: your shell may have its own version of mknod, which usually
          supersedes the version described here.  Please refer to your
          shell's documentation for details about the options it supports.


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

          mknod(2)

          Full documentation <https://www.gnu.org/software/coreutils/mknod>
          or available locally via: info '(coreutils) mknod invocation'

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

   GNU coreutils 8.32             March 2020                       MKNOD(1)

--------------

Pages that refer to this page:
`ioctl_console(2) <../man2/ioctl_console.2.html>`__, 
`mknod(2) <../man2/mknod.2.html>`__,  `fd(4) <../man4/fd.4.html>`__, 
`full(4) <../man4/full.4.html>`__,  `hd(4) <../man4/hd.4.html>`__, 
`initrd(4) <../man4/initrd.4.html>`__, 
`intro(4) <../man4/intro.4.html>`__,  `lp(4) <../man4/lp.4.html>`__, 
`mem(4) <../man4/mem.4.html>`__,  `null(4) <../man4/null.4.html>`__, 
`ram(4) <../man4/ram.4.html>`__, 
`random(4) <../man4/random.4.html>`__, 
`tty(4) <../man4/tty.4.html>`__,  `ttyS(4) <../man4/ttyS.4.html>`__, 
`hier(7) <../man7/hier.7.html>`__

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
