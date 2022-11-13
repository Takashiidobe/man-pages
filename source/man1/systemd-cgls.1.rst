.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-cgls(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-CGLS(1)               systemd-cgls               SYSTEMD-CGLS(1)

NAME
-------------------------------------------------

::

          systemd-cgls - Recursively show control group contents


---------------------------------------------------------

::

          systemd-cgls [OPTIONS...] [CGROUP...]

          systemd-cgls [OPTIONS...] --unit|--user-unit [UNIT...]


---------------------------------------------------------------

::

          systemd-cgls recursively shows the contents of the selected Linux
          control group hierarchy in a tree. If arguments are specified,
          shows all member processes of the specified control groups plus
          all their subgroups and their members. The control groups may
          either be specified by their full file paths or are assumed in
          the systemd control group hierarchy. If no argument is specified
          and the current working directory is beneath the control group
          mount point /sys/fs/cgroup/, shows the contents of the control
          group the working directory refers to. Otherwise, the full
          systemd control group hierarchy is shown.

          By default, empty control groups are not shown.


-------------------------------------------------------

::

          The following options are understood:

          --all
              Do not hide empty control groups in the output.

          -l, --full
              Do not ellipsize process tree members.

          -u, --unit
              Show cgroup subtrees for the specified units.

          --user-unit
              Show cgroup subtrees for the specified user units.

          -k
              Include kernel threads in output.

          -M MACHINE, --machine=MACHINE
              Limit control groups shown to the part corresponding to the
              container MACHINE.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.

          --no-pager
              Do not pipe output into a pager.


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------------

::

          systemd(1), systemctl(1), systemd-cgtop(1), systemd-nspawn(1),
          ps(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                              SYSTEMD-CGLS(1)

--------------

Pages that refer to this page: `systemd(1) <../man1/systemd.1.html>`__, 
`systemd-cgtop(1) <../man1/systemd-cgtop.1.html>`__, 
`cgroups(7) <../man7/cgroups.7.html>`__, 
`systemd-machined.service(8) <../man8/systemd-machined.service.8.html>`__

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
