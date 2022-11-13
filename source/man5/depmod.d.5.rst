.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

depmod.d(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DEPMOD.D(5)                     depmod.d                     DEPMOD.D(5)

NAME
-------------------------------------------------

::

          depmod.d - Configuration directory for depmod


---------------------------------------------------------

::

          /usr/lib/depmod.d/*.conf

          /usr/local/lib/depmod.d/*.conf

          /run/depmod.d/*.conf

          /etc/depmod.d/*.conf


---------------------------------------------------------------

::

          The order in which modules are processed by the depmod command
          can be altered on a global or per-module basis. This is typically
          useful in cases where built-in kernel modules are complemented by
          custom built versions of the same and the user wishes to affect
          the priority of processing in order to override the module
          version supplied by the kernel.

          The format of files under depmod.d is simple: one command per
          line, with blank lines and lines starting with '#' ignored
          (useful for adding comments). A '\' at the end of a line causes
          it to continue on the next line, which makes the files a bit
          neater.


---------------------------------------------------------

::

          search subdirectory...
              This allows you to specify the order in which /lib/modules
              (or other configured module location) subdirectories will be
              processed by depmod. Directories are listed in order, with
              the highest priority given to the first listed directory and
              the lowest priority given to the last directory listed. The
              special keyword built-in refers to the standard module
              directories installed by the kernel. Another special keyword
              external refers to the list of external directories, defined
              by the external command.

              By default, depmod will give a higher priority to a directory
              with the name updates using this built-in search string:
              "updates built-in" but more complex arrangements are possible
              and are used in several popular distributions.

          override modulename kernelversion modulesubdirectory
              This command allows you to override which version of a
              specific module will be used when more than one module
              sharing the same name is processed by the depmod command. It
              is possible to specify one kernel or all kernels using the *
              wildcard.  modulesubdirectory is the name of the subdirectory
              under /lib/modules (or other module location) where the
              target module is installed.

              For example, it is possible to override the priority of an
              updated test module called kmod by specifying the following
              command: "override kmod * extra". This will ensure that any
              matching module name installed under the extra subdirectory
              within /lib/modules (or other module location) will take
              priority over any likenamed module already provided by the
              kernel.

          external kernelversion absolutemodulesdirectory...
              This specifies a list of directories, which will be checked
              according to the priorities in the search command. The order
              matters also, the first directory has the higher priority.

              The kernelversion is a POSIX regular expression or *
              wildcard, like in the override.


-----------------------------------------------------------

::

          This manual page Copyright 2006-2010, Jon Masters, Red Hat, Inc.


---------------------------------------------------------

::

          depmod(8)


-------------------------------------------------------

::

          Jon Masters <jcm@jonmasters.org>
              Developer

          Robby Workman <rworkman@slackware.com>
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

   kmod                           08/27/2021                    DEPMOD.D(5)

--------------

Pages that refer to this page: `depmod(8) <../man8/depmod.8.html>`__

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
