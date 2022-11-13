.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mkudffs(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| COMPATIBILITY <#COMPATIBILITY>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \| `LIMITATIONS <#LIMITATIONS>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MKUDFFS(8)               System Manager's Manual              MKUDFFS(8)

NAME
-------------------------------------------------

::

          mkudffs — create a UDF filesystem


---------------------------------------------------------

::

          mkudffs [ options ] device [ blocks-count ]


---------------------------------------------------------------

::

          mkudffs is used to create a UDF filesystem on a device (usually a
          disk). device is the special file corresponding to the device
          (e.g. /dev/hdX) or file image. blocks-count is the number of
          blocks on the device. If omitted, mkudffs automagically figures
          the filesystem size. The order of options matters. Encoding
          option must be first and options to override default settings
          implied by the media type or UDF revision should be after the
          option they are overriding.


-------------------------------------------------------

::

          -h,--help
                 Display the usage and list of options.

          -l,--label= label
                 Specify the UDF label. UDF label is synonym for specifying
                 both --lvid and --vid options. If omitted, mkudffs label
                 is LinuxUDF. (Option available since mkudffs 1.1)

          -u,--uuid= uuid
                 Specify the UDF uuid. It must be exactly 16 hexadecimal
                 lowercase digits and is used for first 16 characters of
                 --fullvsid option. If omitted, mkudffs uuid is generated
                 from local time and a random number. (Option available
                 since mkudffs 1.1)

          -b,--blocksize= block-size
                 Specify the size of blocks in bytes. Valid block size for
                 a UDF filesystem is power of two in range from 512 to
                 32768 and must match a device logical (sector) size. If
                 omitted, mkudffs block size is set to device logical block
                 (sector) size. If logical block (sector) size is unknown
                 (e.g. when creating disk image) then for --media-type=hd
                 is used block size 512 and for other media types 2048.
                 (Prior to mkudffs 1.1 default value was always 2048
                 independently of --media-type)

          -m,--media-type= media-type
                 Specify the media type. Must be specified before --udfrev.
                 Default value is autodetected. When autodetection does not
                 work (e.g. when creating disk image) then hd value is
                 assumed. Valid media types are:

                      hd     HD (Hard Disk)

                      worm   WORM (Write Once Read Many)

                      mo     MO (Magneto Optical)

                      cd     CD-ROM (CD Read-Only Memory)

                      cdr    CD-R (CD Recordable)

                      cdrw   CD-RW (CD Read-Write)

                      dvd    DVD-ROM (DVD Read-Only Memory)

                      dvdr   DVD-R (DVD Recordable)

                      dvdrw  DVD-RW (DVD Read-Write)

                      dvdram DVD-RAM (DVD Random Access Memory)

                      bdr    BD-R (Blu-ray Disc Recordable)

                 (Short option variant -m and values cd, dvdr, bdr are
                 available since mkudffs 2.0 and autodetection is supported
                 since mkudffs 2.2)

          -r,--udfrev= udf-revision
                 Specify the UDF revision to use, either in hexadecimal BCD
                 (e.g. 0x0201) or decimal (e.g. 2.01) format. Valid
                 revisions are 1.01, 1.02, 1.50, 2.00, 2.01, 2.50 and 2.60.
                 If omitted, mkudffs UDF revision is 2.01, except for Blu-
                 ray Discs which is 2.50. UDF revisions higher then 2.01
                 are experimental. Option must be specified after
                 --media-type. (Values in decimal format and UDF revisions
                 higher then 2.01 are supported since mkudffs 2.0, UDF
                 revision 1.01 is supported since mkudffs 2.1)

          -n,--no-write
                 Not really, do not write to device. Just simulate and
                 display what would happen with device. Useful for
                 determining the calculated location of different UDF
                 blocks. (Option available since mkudffs 2.0)

          --new-file
                 Create a new image file specified by device with
                 blocks-count and fail if file already exists. If omitted,
                 mkudffs creates a new image file only in case it does not
                 exist yet. (Option available since mkudffs 2.0)

          --lvid= logical-volume-identifier
                 Specify the Logical Volume Identifier. If omitted, mkudffs
                 Logical Volume Identifier is LinuxUDF. Most UDF
                 implementations use this identifier as a disk label.

          --vid= volume-identifier
                 Specify the Volume Identifier. If omitted, mkudffs Volume
                 Identifier is LinuxUDF.

          --vsid= volume-set-identifier
                 Specify the 17.–127. character of Volume Set Identifier.
                 If omitted, mkudffs Volume Set Identifier is LinuxUDF.

          --fsid= file-set-identifier
                 Specify the File Set Identifier. If omitted, mkudffs File
                 Set Identifier is LinuxUDF.

          --fullvsid= full-volume-set-identifier
                 Specify the full Volume Set Identifier. Overwrite previous
                 --uuid and --vsid options. (Option available since mkudffs
                 1.1)

          --owner= owner-name
                 Specify the Owner name, person creating the medium or
                 filesystem. It is stored in UDF Logical Volume Info1, part
                 of UDF Implementation Use Volume Descriptor. (Option
                 available since mkudffs 2.3)

          --organization= organization-name
                 Specify the Organization name responsible for creating the
                 medium or filesystem. It is stored in UDF Logical Volume
                 Info2, part of UDF Implementation Use Volume Descriptor.
                 (Option available since mkudffs 2.3)

          --contact= contact-information
                 Specify the Contact information for the medium or
                 filesystem. It is stored in UDF Logical Volume Info3, part
                 of UDF Implementation Use Volume Descriptor. (Option
                 available since mkudffs 2.3)

          --uid= uid
                 Specify the uid of the root (/) directory. If omitted,
                 mkudffs uid is 0. Special value -1 means invalid or not
                 specified uid. (Option available since mkudffs 1.1)

          --gid= gid
                 Specify the gid of the root (/) directory. If omitted,
                 mkudffs gid is 0. Special value -1 means invalid or not
                 specified gid. (Option available since mkudffs 1.1)

          --mode= mode
                 Specify permissions in octal mode bits of the root (/)
                 directory. If omitted, mkudffs mode is 0755. (Option
                 available since mkudffs 2.0)

          --read-only
                 This option specify that the whole UDF disk should be
                 treated as read-only. It sets SoftWriteProtect domain flag
                 in Logical Volume Descriptor and in File Set Descriptor.
                 Plus for overwritable media types (hd, dvdram, dvdrw) set
                 UDF Access Type to read-only. (Option available since
                 mkudffs 2.2)

          --bootarea= fill
                 Specify how to fill UDF boot area which is the first 32kB
                 of the disk and is not used by UDF itself. Option mbr make
                 sense only when running mkudffs on whole disk, not on just
                 one partition. Valid options are:

                      preserve
                             preserve existing UDF boot area, do not touch
                             it (default for media type different from hd)

                      erase  erase existing UDF boot area, fill it by zeros
                             (default for hd media type on partitions and
                             on removable disks)

                      mbr    put MBR table with one partition which starts
                             at sector 0 (includes MBR itself) and spans
                             whole disk device, needed only for non-
                             removable hard disks used on Microsoft Windows
                             systems (default for hd media type on non-
                             removable hard disk without partitions), see
                             section WHOLE DISK VS PARTITION

                      mbr:sec-size
                             same as mbr but explicitly set MBR sector size
                             to sec-size value, default sec-size is device
                             logical block (sector) size with fallback to
                             size 512 bytes

                 (Option available since mkudffs 2.0)

          --strategy= strategy
                 Specify the allocation strategy to use. Valid strategies
                 are 4 and 4096. If omitted, mkudffs strategy is based on
                 the --media-type.

          --spartable, --spartable= spartable-number
                 Enable usage Sparing Table. Optionally specify also the
                 number of sparing tables. Valid numbers are 1–4. When the
                 spartable number is omitted then two tables are written to
                 the disc. If the option is omitted then usage of Sparing
                 Table depends on the media type. (Option prior to mkudffs
                 2.0 was available only for cdrw media type)

          --sparspace= num-of-entires
                 Specify the number of entries in Sparing Table. If
                 omitted, the default number of entries is 1024, but
                 depends on the media type. (Option available since mkudffs
                 2.0)

          --packetlen= length
                 Packet length in a number of blocks used for alignment.
                 All continuous UDF structures would be aligned to packets.
                 It specifies also the size of the Sparing Space and packet
                 length in Sparing Table. It should match the device
                 ECC/packet length. If omitted, default value for DVD discs
                 is 16 blocks, for CD/BD discs it is 32 blocks and
                 otherwise 1 block. (Option prior to mkudffs 2.1 was
                 available only for cdrw and dvdrw media types)

          --vat  Enable usage of Virtual Allocation Table (VAT). If
                 omitted, usage depends on the media type. (Option
                 available since mkudffs 2.0)

          --startblock= start-block
                 Specify the block location where the UDF filesystem
                 starts.

                 Normally start block is 0, but when creating second or
                 higher session for Multisession UDF optical disc it is the
                 block location where that new session starts.

                 When updating existing Multisession UDF image file,
                 mkudffs overwrites only data blocks for a new session at
                 start block position in the image file.

                 When creating a new UDF image file, mkudffs stores only
                 data blocks for a new session at beginning of the image
                 file. Therefore data for start block would be written to
                 the zero block instead of the start block. Such image
                 without leading blocks (where are located previous
                 sessions) is suitable for burning a new session to the
                 optical disc. But it cannot be read or detected by any UDF
                 tool until leading zero blocks (or previous sessions) are
                 prepended to the image file.

                 For calculating position where a new session of particular
                 optical disc should start is required to use software
                 which would be used for burning newly created image. So
                 for example, if for burning is used wodim(1) then second
                 value on output from wodim -msinfo call is start block.
                 Accordingly for cdrecord(1) call cdrecord -msinfo or for
                 cdrdao(1) call cdrdao msinfo or for xorriso(1) call
                 xorriso -as cdrecord dev=/dev/cdrw -msinfo.

                 (Option available since mkudffs 2.3)

          --minblocks= min-num-of-blocks
                 Specify minimal number of blocks to write on disc with
                 Virtual Allocation Table.

                 This option affects block position where is written
                 Virtual Allocation Table.  And in case option --closed is
                 used then also it affects block position of the second
                 Anchor Volume Descriptor Pointer.

                 Default value for cdr media type is 300. This is safe
                 default to allow burning CD-R disc image in Track-at-Once
                 mode. This mode requires to burn image with minimal size
                 of 300 sectors. Burning CD-R discs in other modes (e.g.
                 Disc-at-Once or Packet-Writing) may allow to allow to use
                 also smaller disc images.

                 For all other media types there is no default minimal
                 limit.

                 (Option available since mkudffs 2.3)

          --closed
                 Close disc with Virtual Allocation Table. AVDP is written
                 also to the end of the disc. By default, the disc with
                 Virtual Allocation Table is not closed.

          --space= space
                 Specify the Space Set. Unallocated Space Set is used for
                 media which blocks may be allocated immediately. Freed
                 Space Set is used for media which blocks needs to be
                 specially prepared/erased before allocation. In Space
                 Table is stored list of unallocated extents. In Space
                 Bitmap is stored bitmap of unallocated blocks. Not used
                 for VAT.

                      freedbitmap
                             Freed Bitmap

                      freedtable
                             Freed Table

                      unallocbitmap
                             Unallocated Bitmap (default)

                      unalloctable
                             Unallocated Table

          --ad= ad
                 Specify the Allocation Descriptors of the root (/)
                 directory.

                      inicb  Allocation Descriptors in ICB (default)

                      short  Short Allocation Descriptors

                      long   Long Allocation Descriptors

          --noefe
                 Don't Use Extended File Entries for the root (/)
                 directory. Affects only UDF 2.00 or higher. Must be
                 specified after --udfrev.

          --locale
                 Treat identifier string options as strings encoded
                 according to the current locale settings (default). Must
                 be specified as the first argument. (Option available
                 since mkudffs 2.0)

          --u8   Treat identifier string options as strings encoded in
                 8-bit OSTA Compressed Unicode format without leading
                 Compression ID byte, which is equivalent to Latin1
                 (ISO-8859-1). Must be specified as first argument.

          --u16  Treat identifier string options as strings encoded in
                 16-bit OSTA Compressed Unicode format without leading
                 Compression ID byte, which is equivalent to UTF-16BE. Note
                 that it is not possible to include zero byte in command
                 line options, therefore any character which has at least
                 one zero byte cannot be supplied (this applies to all
                 Latin1 characters). Must be specified as the first
                 argument.

          --utf8 Treat identifier string options as strings encoded in
                 UTF-8. Must be specified as the first argument. (Prior to
                 mkudffs 2.0 this was default option)


-------------------------------------------------------------------

::

      OPERATING SYSTEMS SUPPORT
          UDF filesystem is natively supported by large amount of operating
          systems. See following compatibility table:

          ┌────────────────────────────┬──────────────────────────┐
          │     Operating system       │ Maximum UDF revision for │
          ├─────────┬──────────────────┼────────────┬─────────────┤
          │  Name   │     Version      │    read    │    write    │
          ├─────────┼──────────────────┼────────────┼─────────────┤
          │         │ 2.3.17 – 2.4.5   │    2.00    │    2.00     │
          │Linux    │ 2.4.6 – 2.6.25   │    2.01    │    2.01     │
          │         │ 2.6.26 (and new) │    2.50    │    2.01     │
          ├─────────┼──────────────────┼────────────┼─────────────┤
          │         │ 98/Me            │    1.02    │    none     │
          │Windows  │ 2000             │    1.50    │    none     │
          │         │ XP               │    2.01    │    none     │
          │         │ Vista (and new)  │    2.60    │    2.50     │
          ├─────────┼──────────────────┼────────────┼─────────────┤
          │Mac OS   │ 8.1 – 8.5        │    1.02    │    none     │
          │         │ 8.6 – 9.2        │    1.50    │    1.50     │
          ├─────────┼──────────────────┼────────────┼─────────────┤
          │         │ 10.0 – 10.3      │    1.50    │    1.50     │
          │Mac OS X │ 10.4             │    2.01    │    2.01     │
          │         │ 10.5 (and new)   │    2.60    │    2.50     │
          ├─────────┼──────────────────┼────────────┼─────────────┤
          │FreeBSD  │ 5 (and new)      │    1.50    │    none     │
          ├─────────┼──────────────────┼────────────┼─────────────┤
          │NetBSD   │ 4.0              │    2.60    │    none     │
          │         │ 5.0 (and new)    │    2.60    │    2.60     │
          ├─────────┼──────────────────┼────────────┼─────────────┤
          │         │ 3.8 – 3.9        │    1.02    │             │
          │OpenBSD  │ 4.0 – 4.6        │    1.50    │    none     │
          │         │ 4.7 (and new)    │    2.60    │             │
          ├─────────┼──────────────────┼────────────┼─────────────┤
          │Solaris  │ 7 (and new)      │    1.50    │    1.50     │
          ├─────────┼──────────────────┼────────────┼─────────────┤
          │AIX      │ 5.2 (and new)    │    2.01    │    2.01     │
          └─────────┴──────────────────┴────────────┴─────────────┘
          Note that Windows 98 and Windows Me can read UDF filesystem only
          from CD and DVD optical discs, not from hard disks.

      BLOCK SIZE
          In most cases, operating systems are unable to mount UDF
          filesystem if UDF block size differs from logical sector size of
          the device. Typically hard disks have sector size 512 bytes and
          optical media 2048 bytes. Therefore UDF block size must match the
          logical sector size of the device.

          Linux kernel prior to version 2.6.30 used hardcoded UDF block
          size of 2048 bytes independently of logical sector size,
          therefore it was not able to automatically mount UDF filesystem
          if block size differed from 2048. Since 2.6.30 and prior to 4.11
          Linux kernel used a logical sector size of the device as UDF
          block size, plus it tried fallback to 2048. Since 4.11 it uses
          logical sector size and fallbacks to any valid block size between
          logical sector size and 4096. Therefore since version 2.6.30
          Linux kernel can automatically mount UDF filesystems correctly if
          UDF block size matches device logical sector size and since
          version 4.11 can automatically also mount devices which sector
          size does not match UDF block size. In any case and also for
          Linux kernel prior to version 2.6.30, different UDF block size
          (which is not autodetected) can be manually specified via
          bs=blocksize mount parameter.

      WHOLE DISK VS PARTITION
          UDF filesystem is supposed to be formatted on the whole media and
          not to the partitioned hard disk. Mac OS X systems enforce this
          rule and reject to automatically mount UDF filesystem unless it
          is formatted on the whole unpartitioned hard disk. Possible
          partition table (e.g. MBR or GPT) on disk with valid UDF
          filesystem is ignored. On the other hand, Microsoft Windows
          systems are unable to detect non-removable hard disks without MBR
          or GPT partition table. Removable disks do not have this
          restriction. A consequence is that non-removable hard disks
          formatted to UDF by Windows Vista+ are not recognized by Mac OS X
          systems and vice-versa. Note that manual mount of UDF partition
          on partitioned hard disk on Mac OS X system is possible and
          working (e.g. by running commands: mkdir /Volumes/DriveName &&
          mount_udf /dev/disk1s1 /Volumes/DriveName). But there is no known
          way to mount an unpartitioned non-removable disk on Windows
          system.

          Thanks to reserved and unused UDF boot area (first 32kB of UDF
          filesystem) it is possible to deal with this problem, by putting
          MBR on such non-removable hard disk just for compatibility
          reasons with Windows. Such MBR table would contain one partition
          which starts at sector 0 (includes MBR itself) and spans whole
          disk device. So the whole disk device and also the first
          partition on disk points to same sectors. Therefore UDF
          filesystem can be mounted either from whole disk device (needed
          for Mac OS X systems) or from first partition (needed for
          Microsoft Windows systems).

          Linux kernel ignores MBR table if contains partition which starts
          at sector 0. Normally Linux kernel can detect and mount UDF
          filesystem either on a partition or on whole disk device. It does
          not have any restrictions.

          mkudffs option --bootarea=mbr put such MBR table for
          compatibility with Microsoft Windows systems into disk when
          formatting.

      LINUX LABEL BUGS
          In most cases Logical Volume Identifier is used as UDF label. But
          Linux libblkid prior to version 2.26 used Volume Identifier.
          Therefore mkudffs --label for compatibility reasons set both
          Logical Volume Identifier and Volume Identifier.

          Linux libblkid prior to version 2.30 incorrectly processed non-
          ASCII identifier strings encoded in 8-bit OSTA Compressed Unicode
          format. Therefore mkudffs since version 2.0 for compatibility
          reasons tries to encode a non-ASCII identifier strings in 16-bit
          OSTA Compressed Unicode format and then fallbacks to 8-bit
          format.

          For more information about UDF Label and UUID see udflabel(8)
          section UDF LABEL AND UUID.


---------------------------------------------------------------

::

          mkudffs returns 0 if successful, non-zero if there are problems.


---------------------------------------------------------------

::

          mkudffs cannot create UDF 2.50 Metadata partition, therefore it
          does not support UDF revisions higher than 2.01 for non Write
          Once media yet. So there is no support for Blu-ray discs which
          needs UDF 2.50 (except for Blu-ray Disc Recordable which does not
          require Metadata partition).

          mkudffs prior to version 2.2 was unable to process Unicode
          strings with code points above U+FFFF. When option --utf8 was
          specified then input strings were limited to 3-byte UTF-8
          sequences and when option --u16 was specified then input strings
          were limited just to UCS-2BE strings (subset of UTF-16BE).


-------------------------------------------------

::

          mkudffs prior to version 1.1 was unable to process non-ASCII
          characters from identifier strings in --utf8 mode, --vsid option
          was completely broken and --blocksize must have been manually
          specified for hard disks as default value was hardcoded for
          optical disks. mkudffs prior to version 2.0 generated broken and
          unreadable cdr disc images.


-----------------------------------------------------

::

          Ben Fennema
          Pali Rohár <pali.rohar@gmail.com>


-----------------------------------------------------------------

::

          mkudffs is part of the udftools package and is available from
          https://github.com/pali/udftools/.


---------------------------------------------------------

::

          pktsetup(8), udflabel(8), cdrwtool(1), udfinfo(1), wrudf(1)

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

   System Management Commands      udftools                      MKUDFFS(8)

--------------

Pages that refer to this page: `udfinfo(1) <../man1/udfinfo.1.html>`__, 
`wrudf(1) <../man1/wrudf.1.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
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
