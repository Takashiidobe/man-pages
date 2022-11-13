.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pppstats(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PPPSTATS(8)              System Manager's Manual             PPPSTATS(8)

NAME
-------------------------------------------------

::

          pppstats - print PPP statistics


---------------------------------------------------------

::

          pppstats [ -a ] [ -d ] [ -v ] [ -r ] [ -z ] [ -c <count> ] [ -w
          <secs> ] [ interface ]


---------------------------------------------------------------

::

          The pppstats utility reports PPP-related statistics at regular
          intervals for the specified PPP interface.  If the interface is
          unspecified, it will default to ppp0.  The display is split
          horizontally into input and output sections containing columns of
          statistics describing the properties and volume of packets
          received and transmitted by the interface.

          The options are as follows:

          -a     Display absolute values rather than deltas.  With this
                 option, all reports show statistics for the time since the
                 link was initiated.  Without this option, the second and
                 subsequent reports show statistics for the time since the
                 last report.

          -d     Show data rate (kB/s) instead of bytes.

          -c count
                 Repeat the display count times.  If this option is not
                 specified, the default repeat count is 1 if the -w option
                 is not specified, otherwise infinity.

          -r     Display additional statistics summarizing the compression
                 ratio achieved by the packet compression algorithm in use.

          -v     Display additional statistics relating to the performance
                 of the Van Jacobson TCP header compression algorithm.

          -w wait
                 Pause wait seconds between each display.  If this option
                 is not specified, the default interval is 5 seconds.

          -z     Instead of the standard display, show statistics
                 indicating the performance of the packet compression
                 algorithm in use.

          The following fields are printed on the input side when the -z
          option is not used:

          IN     The total number of bytes received by this interface.

          PACK   The total number of packets received by this interface.

          VJCOMP The number of header-compressed TCP packets received by
                 this interface.

          VJUNC  The number of header-uncompressed TCP packets received by
                 this interface.  Not reported when the -r option is
                 specified.

          VJERR  The number of corrupted or bogus header-compressed TCP
                 packets received by this interface.  Not reported when the
                 -r option is specified.

          VJTOSS The number of VJ header-compressed TCP packets dropped on
                 reception by this interface because of preceding errors.
                 Only reported when the -v option is specified.

          NON-VJ The total number of non-TCP packets received by this
                 interface. Only reported when the -v option is specified.

          RATIO  The compression ratio achieved for received packets by the
                 packet compression scheme in use, defined as the
                 uncompressed size divided by the compressed size.  Only
                 reported when the -r option is specified.

          UBYTE  The total number of bytes received, after decompression of
                 compressed packets.  Only reported when the -r option is
                 specified.

          The following fields are printed on the output side:

          OUT    The total number of bytes transmitted from this interface.

          PACK   The total number of packets transmitted from this
                 interface.

          VJCOMP The number of TCP packets transmitted from this interface
                 with VJ-compressed TCP headers.

          VJUNC  The number of TCP packets transmitted from this interface
                 with VJ-uncompressed TCP headers.  Not reported when the
                 -r option is specified.

          NON-VJ The total number of non-TCP packets transmitted from this
                 interface.  Not reported when the -r option is specified.

          VJSRCH The number of searches for the cached header entry for a
                 VJ header compressed TCP packet.  Only reported when the
                 -v option is specified.

          VJMISS The number of failed searches for the cached header entry
                 for a VJ header compressed TCP packet.  Only reported when
                 the -v option is specified.

          RATIO  The compression ratio achieved for transmitted packets by
                 the packet compression scheme in use, defined as the size
                 before compression divided by the compressed size.  Only
                 reported when the -r option is specified.

          UBYTE  The total number of bytes to be transmitted, before packet
                 compression is applied.  Only reported when the -r option
                 is specified.

          When the -z option is specified, pppstats instead displays the
          following fields, relating to the packet compression algorithm
          currently in use.  If packet compression is not in use, these
          fields will all display zeroes.  The fields displayed on the
          input side are:

          COMPRESSED BYTE
                 The number of bytes of compressed packets received.

          COMPRESSED PACK
                 The number of compressed packets received.

          INCOMPRESSIBLE BYTE
                 The number of bytes of incompressible packets (that is,
                 those which were transmitted in uncompressed form)
                 received.

          INCOMPRESSIBLE PACK
                 The number of incompressible packets received.

          COMP RATIO
                 The recent compression ratio for incoming packets, defined
                 as the uncompressed size divided by the compressed size
                 (including both compressible and incompressible packets).

          The fields displayed on the output side are:

          COMPRESSED BYTE
                 The number of bytes of compressed packets transmitted.

          COMPRESSED PACK
                 The number of compressed packets transmitted.

          INCOMPRESSIBLE BYTE
                 The number of bytes of incompressible packets transmitted
                 (that is, those which were transmitted in uncompressed
                 form).

          INCOMPRESSIBLE PACK
                 The number of incompressible packets transmitted.

          COMP RATIO
                 The recent compression ratio for outgoing packets.


---------------------------------------------------------

::

          pppd(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the ppp (An implementation of the Point-to-
          Point Protocol (PPP)) project.  Information about the project can
          be found at ⟨https://ppp.samba.org/⟩.  If you have a bug report
          for this manual page, see
          ⟨https://github.com/paulusmack/ppp/issues⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/paulusmack/ppp⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-07.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                 26 June 1995                   PPPSTATS(8)

--------------

Pages that refer to this page: `pppd(8) <../man8/pppd.8.html>`__

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
