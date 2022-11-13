.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fsck.minix(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `WARNING <#WARNING>`__ \|         |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
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

   FSCK.MINIX(8)             System Administration            FSCK.MINIX(8)

NAME
-------------------------------------------------

::

          fsck.minix - check consistency of Minix filesystem


---------------------------------------------------------

::

          fsck.minix [options] device


---------------------------------------------------------------

::

          fsck.minix performs a consistency check for the Linux MINIX
          filesystem.

          The program assumes the filesystem is quiescent. fsck.minix
          should not be used on a mounted device unless you can be sure
          nobody is writing to it. Remember that the kernel can write to
          device when it searches for files.

          The device name will usually have the following form:

             ┌───────────────┬─────────────┐
             │               │             │
             │/dev/hda[1-63] │ IDE disk 1  │
             ├───────────────┼─────────────┤
             │               │             │
             │/dev/hdb[1-63] │ IDE disk 2  │
             ├───────────────┼─────────────┤
             │               │             │
             │/dev/sda[1-15] │ SCSI disk 1 │
             ├───────────────┼─────────────┤
             │               │             │
             │/dev/sdb[1-15] │ SCSI disk 2 │
             └───────────────┴─────────────┘

          If the filesystem was changed, i.e., repaired, then
          fsck.minix will print "FILE SYSTEM HAS CHANGED" and will
          sync(2) three times before exiting. There is no need to
          reboot after check.


-------------------------------------------------------

::

          fsck.minix should not be used on a mounted filesystem.
          Using fsck.minix on a mounted filesystem is very dangerous,
          due to the possibility that deleted files are still in use,
          and can seriously damage a perfectly good filesystem! If
          you absolutely have to run fsck.minix on a mounted
          filesystem, such as the root filesystem, make sure nothing
          is writing to the disk, and that no files are "zombies"
          waiting for deletion.


-------------------------------------------------------

::

          -l, --list
              List all filenames.

          -r, --repair
              Perform interactive repairs.

          -a, --auto
              Perform automatic repairs. This option implies --repair
              and serves to answer all of the questions asked with
              the default. Note that this can be extremely dangerous
              in the case of extensive filesystem damage.

          -v, --verbose
              Be verbose.

          -s, --super
              Output super-block information.

          -m, --uncleared
              Activate MINIX-like "mode not cleared" warnings.

          -f, --force
              Force a filesystem check even if the filesystem was
              marked as valid. Marking is done by the kernel when the
              filesystem is unmounted.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------------------

::

          There are numerous diagnostic messages. The ones mentioned
          here are the most commonly seen in normal usage.

          If the device does not exist, fsck.minix will print "unable
          to read super block". If the device exists, but is not a
          MINIX filesystem, fsck.minix will print "bad magic number
          in super-block".


---------------------------------------------------------------

::

          The exit status returned by fsck.minix is the sum of the
          following:

          0
              No errors

          3
              Filesystem errors corrected, system should be rebooted
              if filesystem was mounted

          4
              Filesystem errors left uncorrected

          7
              Combination of exit statuses 3 and 4

          8
              Operational error

          16
              Usage or syntax error


-------------------------------------------------------

::

          Linus Torvalds <torvalds@cs.helsinki.fi>. Exit status
          values by Rik Faith <faith@cs.unc.edu> Added support for
          filesystem valid flag: Dr. Wettstein
          <greg%wind.uucp@plains.nodak.edu>. Check to prevent fsck of
          mounted filesystem added by Daniel Quinlan
          <quinlan@yggdrasil.com>. Minix v2 fs support by Andreas
          Schwab <schwab@issan.informatik.uni-dortmund.de>, updated
          by Nicolai Langfeldt <janl@math.uio.no>. Portability patch
          by Russell King <rmk@ecs.soton.ac.uk>.


---------------------------------------------------------

::

          fsck(8), fsck.ext2(8), mkfs(8), mkfs.ext2(8),
          mkfs.minix(8), reboot(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The fsck.minix command is part of the util-linux package
          which can be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This
          page is part of the util-linux (a random collection of
          Linux utilities) project. Information about the project can
          be found at 
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you
          have a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩
          on 2021-08-27. (At that time, the date of the most recent
          commit that was found in the repository was 2021-08-24.) If
          you discover any rendering problems in this HTML version of
          the page, or you believe there is a better or more up-to-
          date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is
          not part of the original manual page), send a mail to
          man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                  FSCK.MINIX(8)

--------------

Pages that refer to this page:
`fsck(8@@e2fsprogs) <../man8/fsck.8@@e2fsprogs.html>`__, 
`fsck(8) <../man8/fsck.8.html>`__, 
`systemd-fsck@.service(8) <../man8/systemd-fsck@.service.8.html>`__

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
