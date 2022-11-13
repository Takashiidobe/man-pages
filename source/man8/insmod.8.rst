.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

insmod(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   INSMOD(8)                        insmod                        INSMOD(8)

NAME
-------------------------------------------------

::

          insmod - Simple program to insert a module into the Linux Kernel


---------------------------------------------------------

::

          insmod [filename] [module options...]


---------------------------------------------------------------

::

          insmod is a trivial program to insert a module into the kernel.
          Most users will want to use modprobe(8) instead, which is more
          clever and can handle module dependencies.

          Only the most general of error messages are reported: as the work
          of trying to link the module is now done inside the kernel, the
          dmesg usually gives more information about errors.


-----------------------------------------------------------

::

          This manual page originally Copyright 2002, Rusty Russell, IBM
          Corporation. Maintained by Jon Masters and others.


---------------------------------------------------------

::

          modprobe(8), rmmod(8), lsmod(8), modinfo(8) depmod(8)


-------------------------------------------------------

::

          Jon Masters <jcm@jonmasters.org>
              Developer

          Lucas De Marchi <lucas.de.marchi@gmail.com>
              Developer

COLOPHON
---------------------------------------------------------

::

          This page is part of the kmod (userspace tools for managing
          kernel modules) project.  Information about the project can be
          found at [unknown -- if you know, please contact man-
          pages@man7.org] If you have a bug report for this manual page,
          send it to linux-modules@vger.kernel.org.  This page was obtained
          from the project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-06-09.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   kmod                           08/27/2021                      INSMOD(8)

--------------

Pages that refer to this page: `sk98lin(4) <../man4/sk98lin.4.html>`__, 
`wavelan(4) <../man4/wavelan.4.html>`__, 
`kmod(8) <../man8/kmod.8.html>`__, 
`lsmod(8) <../man8/lsmod.8.html>`__, 
`modprobe(8) <../man8/modprobe.8.html>`__, 
`rmmod(8) <../man8/rmmod.8.html>`__

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
