.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chmem(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CHMEM(8)                  System Administration                 CHMEM(8)

NAME
-------------------------------------------------

::

          chmem - configure memory


---------------------------------------------------------

::

          chmem [-h] [-V*] [-v] [-e|-d] [SIZE|RANGE -b BLOCKRANGE] [-z
          ZONE]


---------------------------------------------------------------

::

          The chmem command sets a particular size or range of memory
          online or offline.

          •   Specify SIZE as <size>[m|M|g|G]. With m or M, <size>
              specifies the memory size in MiB (1024 x 1024 bytes). With g
              or G, <size> specifies the memory size in GiB (1024 x 1024 x
              1024 bytes). The default unit is MiB.

          •   Specify RANGE in the form 0x<start>-0x<end> as shown in the
              output of the lsmem(1) command. <start> is the hexadecimal
              address of the first byte and <end> is the hexadecimal
              address of the last byte in the memory range.

          •   Specify BLOCKRANGE in the form <first>-<last> or <block> as
              shown in the output of the lsmem(1) command. <first> is the
              number of the first memory block and <last> is the number of
              the last memory block in the memory range. Alternatively a
              single block can be specified. BLOCKRANGE requires the
              --blocks option.

          •   Specify ZONE as the name of a memory zone, as shown in the
              output of the lsmem -o +ZONES command. The output shows one
              or more valid memory zones for each memory range. If multiple
              zones are shown, then the memory range currently belongs to
              the first zone. By default, chmem will set memory online to
              the zone Movable, if this is among the valid zones. This
              default can be changed by specifying the --zone option with
              another valid zone. For memory ballooning, it is recommended
              to select the zone Movable for memory online and offline, if
              possible. Memory in this zone is much more likely to be able
              to be offlined again, but it cannot be used for arbitrary
              kernel allocations, only for migratable pages (e.g.,
              anonymous and page cache pages). Use the --help option to see
              all available zones.

          SIZE and RANGE must be aligned to the Linux memory block size, as
          shown in the output of the lsmem(1) command.

          Setting memory online can fail for various reasons. On
          virtualized systems it can fail if the hypervisor does not have
          enough memory left, for example because memory was overcommitted.
          Setting memory offline can fail if Linux cannot free the memory.
          If only part of the requested memory can be set online or
          offline, a message tells you how much memory was set online or
          offline instead of the requested amount.

          When setting memory online chmem starts with the lowest memory
          block numbers. When setting memory offline chmem starts with the
          highest memory block numbers.


-------------------------------------------------------

::

          -b, --blocks
              Use a BLOCKRANGE parameter instead of RANGE or SIZE for the
              --enable and --disable options.

          -d, --disable
              Set the specified RANGE, SIZE, or BLOCKRANGE of memory
              offline.

          -e, --enable
              Set the specified RANGE, SIZE, or BLOCKRANGE of memory
              online.

          -z, --zone
              Select the memory ZONE where to set the specified RANGE,
              SIZE, or BLOCKRANGE of memory online or offline. By default,
              memory will be set online to the zone Movable, if possible.

          -h, --help
              Print a short help text, then exit.

          -v, --verbose
              Verbose mode. Causes chmem to print debugging messages about
              it’s progress.

          -V, --version
              Print the version number, then exit.


---------------------------------------------------------------

::

          chmem has the following exit status values:

          0
              success

          1
              failure

          64
              partial success


-------------------------------------------------------

::

          chmem --enable 1024
              This command requests 1024 MiB of memory to be set online.

          chmem -e 2g
              This command requests 2 GiB of memory to be set online.

          chmem --disable 0x00000000e4000000-0x00000000f3ffffff
              This command requests the memory range starting with
              0x00000000e4000000 and ending with 0x00000000f3ffffff to be
              set offline.

          chmem -b -d 10
              This command requests the memory block number 10 to be set
              offline.


---------------------------------------------------------

::

          lsmem(1)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The chmem command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                       CHMEM(8)

--------------

Pages that refer to this page: `lsmem(1) <../man1/lsmem.1.html>`__

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
