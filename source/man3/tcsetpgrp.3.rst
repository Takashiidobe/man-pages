.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tcgetpgrp(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TCGETPGRP(3)            Linux Programmer's Manual           TCGETPGRP(3)

NAME
-------------------------------------------------

::

          tcgetpgrp, tcsetpgrp - get and set terminal foreground process
          group


---------------------------------------------------------

::

          #include <unistd.h>

          pid_t tcgetpgrp(int fd);
          int tcsetpgrp(int fd, pid_t pgrp);


---------------------------------------------------------------

::

          The function tcgetpgrp() returns the process group ID of the
          foreground process group on the terminal associated to fd, which
          must be the controlling terminal of the calling process.

          The function tcsetpgrp() makes the process group with process
          group ID pgrp the foreground process group on the terminal
          associated to fd, which must be the controlling terminal of the
          calling process, and still be associated with its session.
          Moreover, pgrp must be a (nonempty) process group belonging to
          the same session as the calling process.

          If tcsetpgrp() is called by a member of a background process
          group in its session, and the calling process is not blocking or
          ignoring SIGTTOU, a SIGTTOU signal is sent to all members of this
          background process group.


-----------------------------------------------------------------

::

          When fd refers to the controlling terminal of the calling
          process, the function tcgetpgrp() will return the foreground
          process group ID of that terminal if there is one, and some value
          larger than 1 that is not presently a process group ID otherwise.
          When fd does not refer to the controlling terminal of the calling
          process, -1 is returned, and errno is set to indicate the error.

          When successful, tcsetpgrp() returns 0.  Otherwise, it returns
          -1, and errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  fd is not a valid file descriptor.

          EINVAL pgrp has an unsupported value.

          ENOTTY The calling process does not have a controlling terminal,
                 or it has one but it is not described by fd, or, for
                 tcsetpgrp(), this controlling terminal is no longer
                 associated with the session of the calling process.

          EPERM  pgrp has a supported value, but is not the process group
                 ID of a process in the same session as the calling
                 process.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │tcgetpgrp(), tcsetpgrp()              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          These functions are implemented via the TIOCGPGRP and TIOCSPGRP
          ioctls.

      History
          The ioctls appeared in 4.2BSD.  The functions are POSIX
          inventions.


---------------------------------------------------------

::

          setpgid(2), setsid(2), credentials(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   TCGETPGRP(3)

--------------

Pages that refer to this page: `setpgid(2) <../man2/setpgid.2.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/tcgetpgrp.3.license.html>`__

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
