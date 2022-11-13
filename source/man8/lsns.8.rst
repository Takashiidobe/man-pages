.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lsns(8) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
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

   LSNS(8)                   System Administration                  LSNS(8)

NAME
-------------------------------------------------

::

          lsns - list namespaces


---------------------------------------------------------

::

          lsns [options] namespace


---------------------------------------------------------------

::

          lsns lists information about all the currently accessible
          namespaces or about the given namespace. The namespace identifier
          is an inode number.

          The default output is subject to change. So whenever possible,
          you should avoid using default outputs in your scripts. Always
          explicitly define expected output mode (--tree or --list) and
          columns by using the --output option together with a columns list
          in environments where a stable output is required.

          The NSFS column, printed when net is specified for the --type
          option, is special; it uses multi-line cells. Use the option
          --nowrap to switch to ","-separated single-line representation.

          Note that lsns reads information directly from the /proc
          filesystem and for non-root users it may return incomplete
          information. The current /proc filesystem may be unshared and
          affected by a PID namespace (see unshare --mount-proc for more
          details). lsns is not able to see persistent namespaces without
          processes where the namespace instance is held by a bind mount to
          /proc/pid/ns/type.


-------------------------------------------------------

::

          -J, --json
              Use JSON output format.

          -l, --list
              Use list output format.

          -n, --noheadings
              Do not print a header line.

          -o, --output list
              Specify which output columns to print. Use --help to get a
              list of all supported columns.

              The default list of columns may be extended if list is
              specified in the format +list (e.g., lsns -o +PATH).

          --output-all
              Output all available columns.

          -p, --task PID
              Display only the namespaces held by the process with this
              PID.

          -r, --raw
              Use the raw output format.

          -t, --type type
              Display the specified type of namespaces only. The supported
              types are mnt, net, ipc, user, pid, uts, cgroup and time.
              This option may be given more than once.

          -u, --notruncate
              Do not truncate text in columns.

          -W, --nowrap
              Do not use multi-line text in columns.

          -T, --tree rel
              Use tree-like output format. If process is given as rel,
              print proecss tree(s) in each name space. This is default
              when --tree is not specified. If parent is given, print
              tree(s) constructed by the parent/child relationship. If
              owner is given, print tree(s) constructed by the owner/owned
              relationship. owner is used as default when rel is omitted.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------------

::

          Karel Zak <kzak@redhat.com>


---------------------------------------------------------

::

          nsenter(1), unshare(1), clone(2), namespaces(7), ioctl_ns(2)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The lsns command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-06-17                        LSNS(8)

--------------

Pages that refer to this page:
`namespaces(7) <../man7/namespaces.7.html>`__

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
