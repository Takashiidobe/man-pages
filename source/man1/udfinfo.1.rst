.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

udfinfo(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `                                 |                                   |
| OUTPUT FORMAT <#OUTPUT_FORMAT>`__ |                                   |
| \| `LIMITATIONS <#LIMITATIONS>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UDFINFO(1)               General Commands Manual              UDFINFO(1)

NAME
-------------------------------------------------

::

          udfinfo — show information about UDF filesystem


---------------------------------------------------------

::

          udfinfo [ options ] device


---------------------------------------------------------------

::

          udfinfo shows various information about a UDF filesystem stored
          either on the block device or in the disk file image. The output
          from the udfinfo is suitable for parsing by external applications
          or scripts.


-------------------------------------------------------

::

          -h,--help
                 Display the usage and the list of options.

          -b,--blocksize= block-size
                 Specify the size of blocks in bytes. Valid block size for
                 a UDF filesystem is a power of two in the range from 512
                 to 32768 and must match a device logical (sector) size. If
                 omitted, udfinfo tries to autodetect block size. First it
                 tries logical (sector) size and then all valid block
                 sizes.

          --startblock= start-block
                 Specify the block location where the UDF filesystem
                 starts. It is used for calculating the block location of
                 the Volume Recognition Sequence (32 kB after the start
                 block) and the first Anchor Volume Descriptor Pointer (256
                 blocks after the start block).

                 Normally start block is 0, but for Multisession UDF
                 optical discs it is the block location where the last
                 session of Multisession UDF disc starts.

                 If omitted, udfinfo for optical disc tries to detect start
                 block of the last session from disc Table Of Contents.
                 Otherwise value 0 is used.

                 For accessing some previous session of Multisession UDF
                 optical disc, it is required to specify correct block
                 where that previous session starts. And also to specify
                 where that session ends via --lastblock option.

                 For Multisession UDF disc images stored in file there is
                 no way to detect where the last session starts and
                 therefore it is necessary to specify the correct start
                 block location manually from the original optical disc
                 Table Of Contents.

                 (Option available since udfinfo 2.3)

          --lastblock= last-block
                 Specify the block location where the UDF filesystem ends.
                 It is used for calculating the block location of second
                 and third Anchor Volume Descriptor Pointer (256 blocks
                 prior the last block and the last block itself).

                 Normally last block is number of disk blocks minus one,
                 but for Multisession UDF optical discs when reading
                 different session than the last one (specified by
                 --startblock) it is the block location where the specified
                 session ends.

                 If omitted, udfinfo for optical disc tried to detect the
                 last recorded block with fallback to the last block of
                 device or disk file image.

                 For accessing some previous session of Multisession UDF
                 optical disc, it is required to specify correct value for
                 both --startblock and --lastblock options.

                 (Option available since udfinfo 2.3)

          --vatblock= vat-block
                 Specify the block location of the Virtual Allocation
                 Table. Virtual Allocation Table is present only on UDF
                 disks with Virtual Partition Map and must be at the last
                 written/recorded disk block.

                 If omitted, udfinfo for optical disc tries to detect the
                 last recorded block with fallback to the last block of
                 block device or disk file image or block specified by
                 --lastblock. In most cases, this fallback does not have to
                 work and for disk file images with Virtual Allocation
                 Table it is necessary to specify the correct location.

                 Virtual Allocation Table contains locations of UDF disk
                 blocks needed to read data storage, determinate used and
                 free space blocks, read File Set Identifier and calculate
                 Windows-specific Volume Serial Number. Also, it contains
                 Logical Volume Identifier and overwrite previously stored
                 in Logical Volume Descriptor.

          --locale
                 Encode UDF string identifiers on output according to
                 current locale settings (default).

          --u8   Encode UDF string identifiers on output to 8-bit OSTA
                 Compressed Unicode format without leading Compression ID
                 byte, which is equivalent to Latin1 (ISO-8859-1) encoding.
                 This will work only for strings which all Unicode code
                 points are below U+100.

          --u16  Encode UDF string identifiers on output to 16-bit OSTA
                 Compressed Unicode format without leading Compression ID
                 byte, which is equivalent to UTF-16BE.

          --utf8 Encode UDF string identifiers on output to UTF-8.


---------------------------------------------------------------

::

          udfinfo returns 0 if successful, non-zero if there are problems
          like a block device does not contain UDF filesystem.


-------------------------------------------------------------------

::

          First part of the udfinfo standard output contains information in
          key=value format. List of all keys with their meaning are in the
          following table:

                 filename
                        File name of the selected block device or disk file
                        image

                 label  label is an alias for lvid, see udflabel(8) section
                        UDF LABEL AND UUID

                 uuid   UUID are first 16 hexadecimal lowercase digits of
                        fullvsid, but see udflabel(8) section UDF LABEL AND
                        UUID

                 lvid   UDF Logical Volume Identifier stored in UDF Logical
                        Volume Descriptor

                 vid    UDF Volume Identifier stored in UDF Primary Volume
                        Descriptor

                 vsid   fullvsid after uuid part, typically 17.–127.
                        character

                 fsid   UDF File Set Identifier stored in UDF File Set
                        Descriptor

                 fullvsid
                        UDF Volume Set Identifier stored in UDF Primary
                        Volume Descriptor

                 owner  UDF Logical Volume Info1 stored in UDF
                        Implementation Use Volume Descriptor, represents
                        Owner name, person creating the medium or
                        filesystem (available since udfinfo 2.3)

                 organization
                        UDF Logical Volume Info2 stored in UDF
                        Implementation Use Volume Descriptor, represents
                        Organization name responsible for creating the
                        medium or filesystem (available since udfinfo 2.3)

                 contact
                        UDF Logical Volume Info3 stored in UDF
                        Implementation Use Volume Descriptor, represents
                        Contact information for the medium or filesystem
                        (available since udfinfo 2.3)

                 appid  UDF Application Identifier stored in UDF Primary
                        Volume Descriptor, identifies application that
                        created medium or filesystem (available since
                        udfinfo 2.3)

                 impid  UDF Developer Identifier stored in UDF
                        Implementation Identifier of UDF Primary Volume
                        Descriptor, uniquely identifies the implementation
                        which created medium or filesystem (available since
                        udfinfo 2.3)

                 winserialnum
                        Windows-specific Volume Serial Number

                 blocksize
                        UDF block size

                 blocks Number of all blocks on the selected block device
                        or disk file image

                 usedblocks
                        Number of used space blocks on UDF disk for data
                        storage

                 freeblocks
                        Number of free space blocks on UDF disk for data
                        storage

                 behindblocks
                        Number of blocks which are behind the last block
                        used by UDF disk

                 numfiles
                        Number of stored files on UDF disk

                 numdirs
                        Number of stored directories on UDF disk

                 udfrev UDF revision needed for reading UDF disk

                 udfwriterev
                        UDF revision needed for writing or modifying UDF
                        disk

                 startblock
                        Block location where the UDF filesystem starts
                        (visible only when non-zero, available since
                        udfinfo 2.3)

                 lastblock
                        Block location where the UDF filesystem ends
                        (visible only when it is not same as the last block
                        on disk, available since udfinfo 2.3)

                 vatblock
                        Block location of the UDF Virtual Allocation Table
                        (visible only when available)

                 integrity
                        UDF integrity of Logical Volume, one of: opened,
                        closed, unknown

                 accesstype
                        UDF Access Type, one of: overwritable, rewritable,
                        writeonce, readonly, pseudo-overwritable, unknown

                 softwriteprotect
                        Status of UDF SoftWriteProtect flag, either yes or
                        no (available since udfinfo 2.2)

                 hardwriteprotect
                        Status of UDF HardWriteProtect flag, either yes or
                        no (available since udfinfo 2.2)

          When UDF integrity is not closed it means that the UDF disk was
          not properly unmounted, is in an inconsistent state and needs
          repairing.

          When either softwriteprotect or hardwriteprotect flag is set then
          UDF disk should be treated as read-only.

          All UDF string identifiers are stored on UDF disk in Unicode,
          therefore they are locale or code page agnostic. Options
          --locale, --u8, --u16 and --utf8 controls how are identifiers
          encoded on output.

          All newline characters from the UDF string identifiers are
          removed, so it is guaranteed that the newline character is
          present only as a separator.

          Second part of the udfinfo standard output contains list of UDF
          block types stored on device, one per line in the following
          format:

                 start=block-num, blocks=block-count, type=block-type

          With meaning that block-type starts at UDF block block-num and
          span block-count blocks on device.

          Windows-specific Volume Serial Number is a non-standard 32-bit
          checksum, calculated as four separate 8-bit XOR checksums of 512
          bytes long UDF File Set Descriptor. Therefore, it cannot be set
          or changed as opposed to UUID which is 64-bit long. This non-
          standard checksum is used only by Windows systems (since Windows
          98 era when it was introduced) and can be displayed on Windows
          systems by applications like vol, dir or fsutil.exe.


---------------------------------------------------------------

::

          udfinfo prior to version 2.3 was unable to handle Multisession
          UDF discs correctly. It always printed only information about the
          first session (the oldest one) and not about the last session
          (the most recent).

          udfinfo prior to version 2.2 was unable to print Unicode strings
          with code points above U+FFFF correctly.

          udfinfo prior to version 2.2 was unable to read Metadata
          Partition. Therefore, determining used and free space blocks,
          reading File Set Identifier and calculating Windows-specific
          Volume Serial Number did not have to be available or correctly
          calculated for disks with UDF revisions higher than 2.01 which
          had Metadata Partition.

          udfinfo prior to version 2.1 was unable to read Virtual
          Allocation Table stored outside of Information Control Block.
          Therefore above limitation applied also for some Write Once
          media.


-----------------------------------------------------

::

          Pali Rohár <pali.rohar@gmail.com>


-----------------------------------------------------------------

::

          udfinfo is part of the udftools package since version 2.0 and is
          available from https://github.com/pali/udftools/.


---------------------------------------------------------

::

          mkudffs(8), pktsetup(8), udflabel(8), cdrwtool(1), wrudf(1)

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

   Commands                        udftools                      UDFINFO(1)

--------------

Pages that refer to this page: `mkudffs(8) <../man8/mkudffs.8.html>`__, 
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
