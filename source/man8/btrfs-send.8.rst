.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

btrfs-send(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BTRFS-SEND(8)                 Btrfs Manual                 BTRFS-SEND(8)

NAME
-------------------------------------------------

::

          btrfs-send - generate a stream of changes between two subvolume
          snapshots


---------------------------------------------------------

::

          btrfs send [-ve] [-p <parent>] [-c <clone-src>] [-f <outfile>]
          <subvol> [<subvol>...]


---------------------------------------------------------------

::

          This command will generate a stream of instructions that describe
          changes between two subvolume snapshots. The stream can be
          consumed by the btrfs receive command to replicate the sent
          snapshot on a different filesystem. The command operates in two
          modes: full and incremental.

          All snapshots involved in one send command must be read-only, and
          this status cannot be changed as long as there’s a running send
          operation that uses the snapshot.

          In the full mode, the entire snapshot data and metadata will end
          up in the stream.

          In the incremental mode (options -p and -c), previously sent
          snapshots that are available on both the sending and receiving
          side can be used to reduce the amount of information that has to
          be sent to reconstruct the sent snapshot on a different
          filesystem.

          The -p <parent> option can be omitted when -c <clone-src> options
          are given, in which case btrfs send will determine a suitable
          parent from among the clone sources.

          You must not specify clone sources unless you guarantee that
          these snapshots are exactly in the same state on both sides—both
          for the sender and the receiver.

          Options

          -e
              if sending multiple subvolumes at once, use the new format
              and omit the end cmd marker in the stream separating the
              subvolumes

          -p <parent>
              send an incremental stream from parent to subvol

          -c <clone-src>
              use this snapshot as a clone source for an incremental send
              (multiple allowed)

          -f <outfile>
              output is normally written to standard output so it can be,
              for example, piped to btrfs receive. Use this option to write
              it to a file instead.

          --no-data
              send in NO_FILE_DATA mode

              The output stream does not contain any file data and thus
              cannot be used to transfer changes. This mode is faster and
              is useful to show the differences in metadata. -q|--quiet::::
              (deprecated) alias for global -q option -v|--verbose::
              (deprecated) alias for global -v option

          Global options

          -q|--quiet
              suppress all messages except errors

          -v|--verbose
              increase output verbosity, print generated commands in a
              readable form


---------------------------------------------------------------

::

          btrfs send returns a zero exit status if it succeeds. Non zero is
          returned in case of failure.


-----------------------------------------------------------------

::

          btrfs is part of btrfs-progs. Please refer to the btrfs wiki
          http://btrfs.wiki.kernel.org for further details.


---------------------------------------------------------

::

          mkfs.btrfs(8), btrfs-receive(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the btrfs-progs (btrfs filesystem tools)
          project.  Information about the project can be found at 
          ⟨https://btrfs.wiki.kernel.org/index.php/Btrfs_source_repositories⟩.
          If you have a bug report for this manual page, see
          ⟨https://btrfs.wiki.kernel.org/index.php/Problem_FAQ#How_do_I_report_bugs_and_issues.3F⟩.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-07-30.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Btrfs v4.6.1                   07/14/2020                  BTRFS-SEND(8)

--------------

Pages that refer to this page: `btrfs(8) <../man8/btrfs.8.html>`__, 
`btrfs-receive(8) <../man8/btrfs-receive.8.html>`__

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
