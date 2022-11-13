.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rmmod(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RMMOD(8)                          rmmod                         RMMOD(8)

NAME
-------------------------------------------------

::

          rmmod - Simple program to remove a module from the Linux Kernel


---------------------------------------------------------

::

          rmmod [-f] [-s] [-v] [modulename]


---------------------------------------------------------------

::

          rmmod is a trivial program to remove a module (when module
          unloading support is provided) from the kernel. Most users will
          want to use modprobe(8) with the -r option instead.


-------------------------------------------------------

::

          -v, --verbose
              Print messages about what the program is doing. Usually rmmod
              prints messages only if something goes wrong.

          -f, --force
              This option can be extremely dangerous: it has no effect
              unless CONFIG_MODULE_FORCE_UNLOAD was set when the kernel was
              compiled. With this option, you can remove modules which are
              being used, or which are not designed to be removed, or have
              been marked as unsafe (see lsmod(8)).

          -s, --syslog
              Send errors to syslog instead of standard error.

          -V --version
              Show version of program and exit.


-----------------------------------------------------------

::

          This manual page originally Copyright 2002, Rusty Russell, IBM
          Corporation. Maintained by Jon Masters and others.


---------------------------------------------------------

::

          modprobe(8), insmod(8), lsmod(8), modinfo(8) depmod(8)


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

   kmod                           08/27/2021                       RMMOD(8)

--------------

Pages that refer to this page:
`delete_module(2) <../man2/delete_module.2.html>`__, 
`insmod(8) <../man8/insmod.8.html>`__, 
`kmod(8) <../man8/kmod.8.html>`__, 
`modprobe(8) <../man8/modprobe.8.html>`__

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
