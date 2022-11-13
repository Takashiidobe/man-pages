.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

daemon(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DAEMON(3)               Linux Programmer's Manual              DAEMON(3)

NAME
-------------------------------------------------

::

          daemon - run in the background


---------------------------------------------------------

::

          #include <unistd.h>

          int daemon(int nochdir, int noclose);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          daemon():
              Since glibc 2.21:
                  _DEFAULT_SOURCE
              In glibc 2.19 and 2.20:
                  _DEFAULT_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)
              Up to and including glibc 2.19:
                  _BSD_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)


---------------------------------------------------------------

::

          The daemon() function is for programs wishing to detach
          themselves from the controlling terminal and run in the
          background as system daemons.

          If nochdir is zero, daemon() changes the process's current
          working directory to the root directory ("/"); otherwise, the
          current working directory is left unchanged.

          If noclose is zero, daemon() redirects standard input, standard
          output, and standard error to /dev/null; otherwise, no changes
          are made to these file descriptors.


-----------------------------------------------------------------

::

          (This function forks, and if the fork(2) succeeds, the parent
          calls _exit(2), so that further errors are seen by the child
          only.)  On success daemon() returns zero.  If an error occurs,
          daemon() returns -1 and sets errno to any of the errors specified
          for the fork(2) and setsid(2).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │daemon()                              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          Not in POSIX.1.  A similar function appears on the BSDs.  The
          daemon() function first appeared in 4.4BSD.


---------------------------------------------------

::

          The glibc implementation can also return -1 when /dev/null exists
          but is not a character device with the expected major and minor
          numbers.  In this case, errno need not be set.


-------------------------------------------------

::

          The GNU C library implementation of this function was taken from
          BSD, and does not employ the double-fork technique (i.e.,
          fork(2), setsid(2), fork(2)) that is necessary to ensure that the
          resulting daemon process is not a session leader.  Instead, the
          resulting daemon is a session leader.  On systems that follow
          System V semantics (e.g., Linux), this means that if the daemon
          opens a terminal that is not already a controlling terminal for
          another session, then that terminal will inadvertently become the
          controlling terminal for the daemon.


---------------------------------------------------------

::

          fork(2), setsid(2), daemon(7), logrotate(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      DAEMON(3)

--------------

Pages that refer to this page: `fork(2) <../man2/fork.2.html>`__, 
`daemon(7) <../man7/daemon.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/daemon.3.license.html>`__

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
