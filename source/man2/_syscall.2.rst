.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\_syscall(2) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   _SYSCALL(2)             Linux Programmer's Manual            _SYSCALL(2)

NAME
-------------------------------------------------

::

          _syscall - invoking a system call without library support
          (OBSOLETE)


---------------------------------------------------------

::

          #include <linux/unistd.h>

          A _syscall macro

          desired system call


---------------------------------------------------------------

::

          The important thing to know about a system call is its prototype.
          You need to know how many arguments, their types, and the
          function return type.  There are seven macros that make the
          actual call into the system easier.  They have the form:

              _syscallX(type,name,type1,arg1,type2,arg2,...)

          where

                 X is 0–6, which are the number of arguments taken by the
                 system call

                 type is the return type of the system call

                 name is the name of the system call

                 typeN is the Nth argument's type

                 argN is the name of the Nth argument

          These macros create a function called name with the arguments you
          specify.  Once you include the _syscall() in your source file,
          you call the system call by name.


---------------------------------------------------

::

          /usr/include/linux/unistd.h


-------------------------------------------------------------------

::

          The use of these macros is Linux-specific, and deprecated.


---------------------------------------------------

::

          Starting around kernel 2.6.18, the _syscall macros were removed
          from header files supplied to user space.  Use syscall(2)
          instead.  (Some architectures, notably ia64, never provided the
          _syscall macros; on those architectures, syscall(2) was always
          required.)

          The _syscall() macros do not produce a prototype.  You may have
          to create one, especially for C++ users.

          System calls are not required to return only positive or negative
          error codes.  You need to read the source to be sure how it will
          return errors.  Usually, it is the negative of a standard error
          code, for example, -EPERM.  The _syscall() macros will return the
          result r of the system call when r is nonnegative, but will
          return -1 and set the variable errno to -r when r is negative.
          For the error codes, see errno(3).

          When defining a system call, the argument types must be passed
          by-value or by-pointer (for aggregates like structs).


---------------------------------------------------------

::

          #include <stdio.h>
          #include <stdlib.h>
          #include <errno.h>
          #include <linux/unistd.h>       /* for _syscallX macros/related stuff */
          #include <linux/kernel.h>       /* for struct sysinfo */

          _syscall1(int, sysinfo, struct sysinfo *, info);

          int
          main(void)
          {
              struct sysinfo s_info;
              int error;

              error = sysinfo(&s_info);
              printf("code error = %d\n", error);
              printf("Uptime = %lds\nLoad: 1 min %lu / 5 min %lu / 15 min %lu\n"
                     "RAM: total %lu / free %lu / shared %lu\n"
                     "Memory in buffers = %lu\nSwap: total %lu / free %lu\n"
                     "Number of processes = %d\n",
                     s_info.uptime, s_info.loads[0],
                     s_info.loads[1], s_info.loads[2],
                     s_info.totalram, s_info.freeram,
                     s_info.sharedram, s_info.bufferram,
                     s_info.totalswap, s_info.freeswap,
                     s_info.procs);
              exit(EXIT_SUCCESS);
          }

      Sample output
          code error = 0
          uptime = 502034s
          Load: 1 min 13376 / 5 min 5504 / 15 min 1152
          RAM: total 15343616 / free 827392 / shared 8237056
          Memory in buffers = 5066752
          Swap: total 27881472 / free 24698880
          Number of processes = 40


---------------------------------------------------------

::

          intro(2), syscall(2), errno(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    _SYSCALL(2)

--------------

Pages that refer to this page: `intro(2) <../man2/intro.2.html>`__, 
`syscall(2) <../man2/syscall.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/_syscall.2.license.html>`__

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
