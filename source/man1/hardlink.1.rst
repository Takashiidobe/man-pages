.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

hardlink(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   HARDLINK(1)                   User Commands                  HARDLINK(1)

NAME
-------------------------------------------------

::

          hardlink - link multiple copies of a file


---------------------------------------------------------

::

          hardlink [options] [directory|file]...


---------------------------------------------------------------

::

          hardlink is a tool which replaces copies of a file with
          hardlinks, therefore saving space.


-------------------------------------------------------

::

          -h, --help
              print quick usage details to the screen.

          -v, --verbose
              More verbose output. If specified once, every hardlinked file
              is displayed, if specified twice, it also shows every
              comparison.

          -q, --quiet
              Quiet mode, don’t print anything.

          -n, --dry-run
              Do not act, just print what would happen.

          -f, --respect-name
              Only try to link files with the same (basename). It’s
              strongly recommended to use long options rather than -f which
              is interpreted in a different way by others hardlink
              implementations.

          -p, --ignore-mode
              Link/compare files even if their mode is different. This may
              be a bit unpredictable.

          -o, --ignore-owner
              Link/compare files even if their owner (user and group) is
              different. It is not predictable.

          -t, --ignore-time
              Link/compare files even if their time of modification is
              different. You almost always want this.

          -X, --respect-xattrs
              Only try to link files with the same extended attributes.

          -m, --maximize
              Among equal files, keep the file with the highest link count.

          -M, --minimize
              Among equal files, keep the file with the lowest link count.

          -O, --keep-oldest
              Among equal files, keep the oldest file (least recent
              modification time). By default, the newest file is kept. If
              --maximize or --minimize is specified, the link count has a
              higher precedence than the time of modification.

          -x, --exclude regex
              A regular expression which excludes files from being compared
              and linked.

          -i, --include regex
              A regular expression to include files. If the option
              --exclude has been given, this option re-includes files which
              would otherwise be excluded. If the option is used without
              --exclude, only files matched by the pattern are included.

          -s, --minimum-size size
              The minimum size to consider. By default this is 1, so empty
              files will not be linked. The size argument may be followed
              by the multiplicative suffixes KiB (=1024), MiB (=1024*1024),
              and so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is
              optional, e.g., "K" has the same meaning as "KiB").


-----------------------------------------------------------

::

          hardlink takes one or more directories which will be searched for
          files to be linked.


-------------------------------------------------

::

          The original hardlink implementation uses the option -f to force
          hardlinks creation between filesystem. This very rarely usable
          feature is no more supported by the current hardlink.

          hardlink assumes that the trees it operates on do not change
          during operation. If a tree does change, the result is undefined
          and potentially dangerous. For example, if a regular file is
          replaced by a device, hardlink may start reading from the device.
          If a component of a path is replaced by a symbolic link or file
          permissions change, security may be compromised. Do not run
          hardlink on a changing tree or on a tree controlled by another
          user.


-----------------------------------------------------

::

          There are multiple hardlink implementations. The very first
          implementation is from Jakub Jelinek for Fedora distribution,
          this implementation has been used in util-linux between versions
          v2.34 to v2.36. The current implementations is based on Debian
          version from Julian Andres Klode.


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The hardlink command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-02                    HARDLINK(1)

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
