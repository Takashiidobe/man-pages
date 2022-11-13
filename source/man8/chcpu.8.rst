.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chcpu(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CHCPU(8)                  System Administration                 CHCPU(8)

NAME
-------------------------------------------------

::

          chcpu - configure CPUs


---------------------------------------------------------

::

          chcpu -c|-d|-e|-g cpu-list

          chcpu -p mode

          chcpu -r|-h|-V


---------------------------------------------------------------

::

          chcpu can modify the state of CPUs. It can enable or disable
          CPUs, scan for new CPUs, change the CPU dispatching mode of the
          underlying hypervisor, and request CPUs from the hypervisor
          (configure) or return CPUs to the hypervisor (deconfigure).

          Some options have a cpu-list argument. Use this argument to
          specify a comma-separated list of CPUs. The list can contain
          individual CPU addresses or ranges of addresses. For example,
          0,5,7,9-11 makes the command applicable to the CPUs with the
          addresses 0, 5, 7, 9, 10, and 11.


-------------------------------------------------------

::

          -c, --configure cpu-list
              Configure the specified CPUs. Configuring a CPU means that
              the hypervisor takes a CPU from the CPU pool and assigns it
              to the virtual hardware on which your kernel runs.

          -d, --disable cpu-list
              Disable the specified CPUs. Disabling a CPU means that the
              kernel sets it offline.

          -e, --enable cpu-list
              Enable the specified CPUs. Enabling a CPU means that the
              kernel sets it online. A CPU must be configured, see -c,
              before it can be enabled.

          -g, --deconfigure cpu-list
              Deconfigure the specified CPUs. Deconfiguring a CPU means
              that the hypervisor removes the CPU from the virtual hardware
              on which the Linux instance runs and returns it to the CPU
              pool. A CPU must be offline, see -d, before it can be
              deconfigured.

          -p, --dispatch mode
              Set the CPU dispatching mode (polarization). This option has
              an effect only if your hardware architecture and hypervisor
              support CPU polarization. Available modes are:

              horizontal
                  The workload is spread across all available CPUs.

              vertical
                  The workload is concentrated on few CPUs.

          -r, --rescan
              Trigger a rescan of CPUs. After a rescan, the Linux kernel
              recognizes the new CPUs. Use this option on systems that do
              not automatically detect newly attached CPUs.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------------------

::

          chcpu has the following exit status values:

          0
              success

          1
              failure

          64
              partial success


-------------------------------------------------------

::

          Heiko Carstens <heiko.carstens@de.ibm.com>


-----------------------------------------------------------

::

          Copyright IBM Corp. 2011


---------------------------------------------------------

::

          lscpu(1)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The chcpu command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-06-17                       CHCPU(8)

--------------

Pages that refer to this page: `lscpu(1) <../man1/lscpu.1.html>`__

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
