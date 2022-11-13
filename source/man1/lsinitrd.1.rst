.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lsinitrd(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LSINITRD(1)                      dracut                      LSINITRD(1)

NAME
-------------------------------------------------

::

          lsinitrd - tool to show the contents of an initramfs image


---------------------------------------------------------

::

          lsinitrd [OPTION...] [<image> [<filename> [<filename> [...] ]]]

          lsinitrd [OPTION...] -k <kernel-version>


---------------------------------------------------------------

::

          lsinitrd shows the contents of an initramfs image. if <image> is
          omitted, then lsinitrd uses the default image
          /boot/<machine-id>/<kernel-version>/initrd or
          /boot/initramfs-<kernel-version>.img.


-------------------------------------------------------

::

          -h, --help
              print a help message and exit.

          -s, --size
              sort the contents of the initramfs by size.

          -f, --file <filename>
              print the contents of <filename>.

          -k, --kver <kernel version>
              inspect the initramfs of <kernel version>.

          -m, --mod
              list dracut modules included of the initramfs image.

          --unpack
              unpack the initramfs to the current directory, instead of
              displaying the contents. If optional filenames are given,
              will only unpack specified files, else the whole image will
              be unpacked. Won’t unpack anything from early cpio part.

          --unpackearly
              unpack the early microcode initramfs to the current
              directory, instead of displaying the contents. Same as
              --unpack, but only unpack files from early cpio part.

          -v, --verbose
              unpack verbosely


-----------------------------------------------------------------

::

          The lsinitrd command is part of the dracut package and is
          available from https://dracut.wiki.kernel.org 


-------------------------------------------------------

::

          Harald Hoyer

          Amerigo Wang

          Nikoli


---------------------------------------------------------

::

          dracut(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the dracut (event driven initramfs
          infrastructure) project.  Information about the project can be
          found at ⟨https://dracut.wiki.kernel.org/index.php/Main_Page⟩.
          If you have a bug report for this manual page, send it to
          initramfs@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/boot/dracut/dracut.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-05-27.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   dracut 050-2-g9e68789d         05/16/2020                    LSINITRD(1)

--------------

Pages that refer to this page: `dracut(8) <../man8/dracut.8.html>`__

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
