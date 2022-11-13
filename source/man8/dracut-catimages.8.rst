.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dracut-catimages(8) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DRACUT-CATIMAGES(8)              dracut              DRACUT-CATIMAGES(8)

NAME
-------------------------------------------------

::

          dracut-catimages - creates initial ramdisk image by concatenating
          images


---------------------------------------------------------

::

          dracut-catimages [OPTION...] <initramfs base image> [<image>...]


---------------------------------------------------------------

::

          dracut-catimages creates an initial ramdisk image by
          concatenating several images from the command line and
          /boot/dracut/*.img


-------------------------------------------------------

::

          -f, --force
              overwrite existing initramfs file.

          -i, --imagedir
              Directory with additional images to add (default:
              /boot/dracut/)

          -o, --overlaydir
              Overlay directory, which contains additional files that will
              be used to create an additional image

          --nooverlay
              Do not use the overlay directory

          --noimagedir
              Do not use the additional image directory

          -h, --help
              display help text and exit.

          --debug
              output debug information of the build process

          -v, --verbose
              verbose output during the build process


---------------------------------------------------

::

          /boot/dracut/*.img
              images to work with


-------------------------------------------------------

::

          Harald Hoyer


-----------------------------------------------------------------

::

          The dracut-catimages command is part of the dracut package and is
          available from https://dracut.wiki.kernel.org 


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

   dracut                         05/16/2020            DRACUT-CATIMAGES(8)

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
