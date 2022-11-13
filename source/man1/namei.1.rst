.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

namei(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NAMEI(1)                      User Commands                     NAMEI(1)

NAME
-------------------------------------------------

::

          namei - follow a pathname until a terminal point is found


---------------------------------------------------------

::

          namei [options] pathname...


---------------------------------------------------------------

::

          namei interprets its arguments as pathnames to any type of Unix
          file (symlinks, files, directories, and so forth). namei then
          follows each pathname until an endpoint is found (a file, a
          directory, a device node, etc). If it finds a symbolic link, it
          shows the link, and starts following it, indenting the output to
          show the context.

          This program is useful for finding "too many levels of symbolic
          links" problems.

          For each line of output, namei uses the following characters to
          identify the file type found:

                 f: = the pathname currently being resolved
                  d = directory
                  l = symbolic link (both the link and its contents are output)
                  s = socket
                  b = block device
                  c = character device
                  p = FIFO (named pipe)
                  - = regular file
                  ? = an error of some kind

          namei prints an informative message when the maximum number of
          symbolic links this system can have has been exceeded.


-------------------------------------------------------

::

          -l, --long
              Use the long listing format (same as -m -o -v).

          -m, --modes
              Show the mode bits of each file type in the style of ls(1),
              for example 'rwxr-xr-x'.

          -n, --nosymlinks
              Don’t follow symlinks.

          -o, --owners
              Show owner and group name of each file.

          -v, --vertical
              Vertically align the modes and owners.

          -x, --mountpoints
              Show mountpoint directories with a 'D' rather than a 'd'.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------

::

          To be discovered.


-------------------------------------------------------

::

          The original namei program was written by Roger Southwick
          <rogers@amadeus.wr.tek.com>.

          The program was rewritten by Karel Zak Karel Zak
          <kzak@redhat.com>.


---------------------------------------------------------

::

          ls(1), stat(1), symlink(7)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The namei command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                       NAMEI(1)

--------------

Pages that refer to this page: `symlink(2) <../man2/symlink.2.html>`__, 
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
