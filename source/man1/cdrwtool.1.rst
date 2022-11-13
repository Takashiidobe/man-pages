.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cdrwtool(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CDRWTOOL(1)              General Commands Manual             CDRWTOOL(1)

NAME
-------------------------------------------------

::

          cdrwtool - perform various actions on a CD-R, CD-RW, and DVD-R


---------------------------------------------------------

::

          cdrwtool -d device -i | -g

          cdrwtool -d device -s [ write-parameters ]

          cdrwtool -d device -q [ write-parameters ]

          cdrwtool -d device -m offset [ write-parameters ]

          cdwrtool -d device -u blocks [ write-parameters ]

          cdrwtool -d device -b b_mode [ write-parameters ]

          cdrwtool -d device -c blocks [ write-parameters ]

          cdwrtool -d device -f filename [ write-parameters ]

          cdwrtool -d device -r track [ write-parameters ]

          cdrwtool -h


---------------------------------------------------------------

::

          The cdwrtool command can perform certain actions on a CD-R, CD-
          RW, or DVD-R device. Mainly these are blanking the media,
          formatting it for use with the packet-cd device,  and applying an
          UDF filesystem.

          The most common usage is probably the `quick setup' option:

                 cdrwtool -d device -q

          which will blank the disc, format it as one large track, and
          write the UDF filesystem structures.

          Other options get and set various parameters of how the device is
          set up, and provide for different offsets, modes and settings
          from the defaults.

          The usefulness of most of the options is not explained.


-------------------------------------------------------

::

          Main directives:

          -d device
                 Specify the device to use. eg. /dev/sr0

          -i     Print disc track info.

          -g     Print write parameters.

          -u length
                 Make a UDF filesystem using length number of blocks.

          -q     `Quick setup': blank the disc, format it as one large
                 track and write a UDF filesystem.

          -m offset
                 Format the disc at offset number of blocks.

          -b mode
                 Blank the disk using a mode of `full' or `fast'.

          -f filename
                 Write file.

          -c track
                 Close track.

          -r track
                 Reserve track.

          -z length
                 Fixed packet length.

          -s     Set write parameters determined by -l, -w, and -p options
                 for the disc.

          -v version
                 Specify the udf revision to use. Valid revisions are
                 0x0201, 0x0200 and 0x0150.  If omitted, mkudffs udf-
                 version is 0x0150.

          -h     Prints a sparse help message.

          Write parameters:

          -t speed
                 Set write speed. (Defaults to 12x ?)

          -l type
                 Set multi-session field. Either `0' (default), `1', or
                 `3', corresponding to `No B0 pointer. Next Session not
                 allowed', `B0 pointer = FF:FF:FF. Next session not
                 allowed', and `Next session allowed. B0 pointer = next
                 possible program area' respectively.

          -w mode
                 Set write mode. Either `mode1' or `mode2' (default).

          -p type
                 Set packet type. Either `0' or `1' (default),
                 corresponding to variable and fixed packet sizes
                 respectively.

          -o offset
                 Set write offset.


-------------------------------------------------

::

          Many modern drives refuse on the preparations to format new,
          blanked, or appendable CD-RW media. This causes a message like

                 Command failed: 55 ... - sense ...

          The remedy is to use a CD-capable burn program for writing a
          session and closing the medium. For example by using any of
          "cdrecord", "wodim", "cdrskin", or "xorriso -as cdrecord" as
          content of variable prog in:

              prog="xorriso -as cdrecord"
              drive="/dev/sr0"
              dd if=/dev/zero bs=1M count=10 | $prog -v -eject dev="$drive" -


-------------------------------------------------------

::

          Jens Axboe <axboe@suse.de>
          Ben Fennema
          Some additions by Richard Atterer <atterer@debian.org>
          BUGS note about closing medium by Thomas Schmitt <scdbackup@gmx.net>


-----------------------------------------------------------------

::

          cdrwtool is part of the udftools package and is available from
          https://github.com/pali/udftools/.


---------------------------------------------------------

::

          pktsetup(8), cdrecord(1), wodim(1), cdrskin(1), xorriso(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the udftools (Linux tools for UDF
          filesystems and DVD/CD-R(W) drives) project.  Information about
          the project can be found at ⟨https://github.com/pali/udftools⟩.
          If you have a bug report for this manual page, see
          ⟨https://github.com/pali/udftools/issues⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/pali/udftools.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-14.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Commands                        udftools                     CDRWTOOL(1)

--------------

Pages that refer to this page: `udfinfo(1) <../man1/udfinfo.1.html>`__, 
`wrudf(1) <../man1/wrudf.1.html>`__, 
`mkudffs(8) <../man8/mkudffs.8.html>`__, 
`pktsetup(8) <../man8/pktsetup.8.html>`__, 
`udflabel(8) <../man8/udflabel.8.html>`__

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
