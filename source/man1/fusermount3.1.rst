.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fusermount3(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `HOMEPAGE <#HOMEPAGE>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FUSERMOUNT3(1)       Filesystem in Userspace (FUSE)       FUSERMOUNT3(1)

NAME
-------------------------------------------------

::

          fusermount3 - mount and unmount FUSE filesystems


---------------------------------------------------------

::

          fusermount3 [OPTIONS] MOUNTPOINT


---------------------------------------------------------------

::

          Filesystem in Userspace (FUSE) is a simple interface for
          userspace programs to export a virtual filesystem to the Linux
          kernel. It also aims to provide a secure method for non
          privileged users to create and mount their own filesystem
          implementations.

          fusermount3 is a program to mount and unmount FUSE filesystems.
          It should be called directly only for unmounting FUSE file
          systems. To allow mounting and unmounting by unprivileged users,
          fusermount3 needs to be installed set-uid root.


-------------------------------------------------------

::

          -h  print help.

          -V  print version.

          -o OPTION[,OPTION...]
              mount options.

          -u  unmount.

          -q  quiet.

          -z  lazy unmount.


---------------------------------------------------------

::

          mount(8), mount.fuse3(8), fuse(4),


---------------------------------------------------------

::

          More information about fusermount3 and the FUSE project can be
          found at <http://fuse.sourceforge.net/ >.


-------------------------------------------------------

::

          FUSE is currently maintained by Nikolaus Rath <Nikolaus@rath.org>

          The original author of FUSE is Miklos Szeredi
          <miklos@szeredi.hu>.

          This manual page was originally written by Daniel Baumann
          <daniel.baumann@progress-technologies.net>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the libfuse (Filesystem in Userspace)
          project.  Information about the project can be found at 
          ⟨https://github.com/libfuse/libfuse⟩.  If you have a bug report
          for this manual page, see
          ⟨https://github.com/libfuse/libfuse/issues⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/libfuse/libfuse.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-25.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   2.8.6                          2011-10-23                 FUSERMOUNT3(1)

--------------

Pages that refer to this page:
`mount.fuse3(8) <../man8/mount.fuse3.8.html>`__

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
