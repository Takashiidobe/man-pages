.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

modinfo(8) — Linux manual page
==============================

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

   MODINFO(8)                       modinfo                      MODINFO(8)

NAME
-------------------------------------------------

::

          modinfo - Show information about a Linux Kernel module


---------------------------------------------------------

::

          modinfo [-0] [-F field] [-k kernel] [modulename|filename...]

          modinfo -V

          modinfo -h


---------------------------------------------------------------

::

          modinfo extracts information from the Linux Kernel modules given
          on the command line. If the module name is not a filename, then
          the /lib/modules/version directory is searched, as is also done
          by modprobe(8) when loading kernel modules.

          modinfo by default lists each attribute of the module in form
          fieldname : value, for easy reading. The filename is listed the
          same way (although it's not really an attribute).

          This version of modinfo can understand modules of any Linux
          Kernel architecture.


-------------------------------------------------------

::

          -V, --version
              Print the modinfo version.

          -F, --field
              Only print this field value, one per line. This is most
              useful for scripts. Field names are case-insensitive. Common
              fields (which may not be in every module) include author,
              description, license, parm, depends, and alias. There are
              often multiple parm, alias and depends fields. The special
              field filename lists the filename of the module.

          -b basedir, --basedir basedir
              Root directory for modules, / by default.

          -k kernel
              Provide information about a kernel other than the running
              one. This is particularly useful for distributions needing to
              extract information from a newly installed (but not yet
              running) set of kernel modules. For example, you wish to find
              which firmware files are needed by various modules in a new
              kernel for which you must make an initrd/initramfs image
              prior to booting.

          -0, --null
              Use the ASCII zero character to separate field values,
              instead of a new line. This is useful for scripts, since a
              new line can theoretically appear inside a field.

          -a --author, -d --description, -l --license, -p --parameters, -n
          --filename
              These are shortcuts for the --field flag's author,
              description, license, parm and filename arguments, to ease
              the transition from the old modutils modinfo.


-----------------------------------------------------------

::

          This manual page originally Copyright 2003, Rusty Russell, IBM
          Corporation. Maintained by Jon Masters and others.


---------------------------------------------------------

::

          modprobe(8)


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

   kmod                           08/27/2021                     MODINFO(8)

--------------

Pages that refer to this page:
`query_module(2) <../man2/query_module.2.html>`__, 
`modules.dep(5) <../man5/modules.dep.5.html>`__, 
`insmod(8) <../man8/insmod.8.html>`__, 
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
