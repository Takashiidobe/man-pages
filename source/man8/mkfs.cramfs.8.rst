.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mkfs.cramfs(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MKFS.CRAMFS(8)            System Administration           MKFS.CRAMFS(8)

NAME
-------------------------------------------------

::

          mkfs.cramfs - make compressed ROM file system


---------------------------------------------------------

::

          mkfs.cramfs [options] directory file


---------------------------------------------------------------

::

          Files on cramfs file systems are zlib-compressed one page at a
          time to allow random read access. The metadata is not compressed,
          but is expressed in a terse representation that is more
          space-efficient than conventional file systems.

          The file system is intentionally read-only to simplify its
          design; random write access for compressed files is difficult to
          implement. cramfs ships with a utility (mkcramfs(8)) to pack
          files into new cramfs images.

          File sizes are limited to less than 16 MB.

          Maximum file system size is a little under 272 MB. (The last file
          on the file system must begin before the 256 MB block, but can
          extend past it.)


-----------------------------------------------------------

::

          The directory is simply the root of the directory tree that we
          want to generate a compressed filesystem out of.

          The file will contain the cram file system, which later can be
          mounted.


-------------------------------------------------------

::

          -v
              Enable verbose messaging.

          -E
              Treat all warnings as errors, which are reflected as command
              exit status.

          -b blocksize
              Use defined block size, which has to be divisible by page
              size.

          -e edition
              Use defined file system edition number in superblock.

          -N big, little, host
              Use defined endianness. Value defaults to host.

          -i file
              Insert a file to cramfs file system.

          -n name
              Set name of the cramfs file system.

          -p
              Pad by 512 bytes for boot code.

          -s
              This option is ignored. Originally the -s turned on directory
              entry sorting.

          -z
              Make explicit holes.

          -h, --help
              Display help text and exit.

          -V, --version
              Display version information and exit.


---------------------------------------------------------------

::

          0
              success

          8
              operation error, such as unable to allocate memory


---------------------------------------------------------

::

          fsck.cramfs(8), mount(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The mkfs.cramfs command is part of the util-linux package which
          can be downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-02                 MKFS.CRAMFS(8)

--------------

Pages that refer to this page:
`fsck.cramfs(8) <../man8/fsck.cramfs.8.html>`__, 
`systemd-makefs@.service(8) <../man8/systemd-makefs@.service.8.html>`__

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
