.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sgetmask(2) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SGETMASK(2)             Linux Programmer's Manual            SGETMASK(2)

NAME
-------------------------------------------------

::

          sgetmask, ssetmask - manipulation of signal mask (obsolete)


---------------------------------------------------------

::

          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          long syscall(SYS_sgetmask, void);
          long syscall(SYS_ssetmask, long newmask);

          Note: glibc provides no wrappers for these functions,
          necessitating the use of syscall(2).


---------------------------------------------------------------

::

          These system calls are obsolete.  Do not use them; use
          sigprocmask(2) instead.

          sgetmask() returns the signal mask of the calling process.

          ssetmask() sets the signal mask of the calling process to the
          value given in newmask.  The previous signal mask is returned.

          The signal masks dealt with by these two system calls are plain
          bit masks (unlike the sigset_t used by sigprocmask(2)); use
          sigmask(3) to create and inspect these masks.


-----------------------------------------------------------------

::

          sgetmask() always successfully returns the signal mask.
          ssetmask() always succeeds, and returns the previous signal mask.


-----------------------------------------------------

::

          These system calls always succeed.


---------------------------------------------------------

::

          Since Linux 3.16, support for these system calls is optional,
          depending on whether the kernel was built with the
          CONFIG_SGETMASK_SYSCALL option.


-------------------------------------------------------------------

::

          These system calls are Linux-specific.


---------------------------------------------------

::

          These system calls are unaware of signal numbers greater than 31
          (i.e., real-time signals).

          These system calls do not exist on x86-64.

          It is not possible to block SIGSTOP or SIGKILL.


---------------------------------------------------------

::

          sigprocmask(2), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    SGETMASK(2)

--------------

Pages that refer to this page:
`syscalls(2) <../man2/syscalls.2.html>`__, 
`signal(7) <../man7/signal.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/sgetmask.2.license.html>`__

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
