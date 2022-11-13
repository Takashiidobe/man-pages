.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ttyslot(3) — Linux manual page
==============================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TTYSLOT(3)              Linux Programmer's Manual             TTYSLOT(3)

NAME
-------------------------------------------------

::

          ttyslot - find the slot of the current user's terminal in some
          file


---------------------------------------------------------

::

          #include <unistd.h>       /* See NOTES */

          int ttyslot(void);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          ttyslot():
              Since glibc 2.24:
                  _DEFAULT_SOURCE
              From glibc 2.20 to 2.23:
                  _DEFAULT_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)
              Glibc 2.19 and earlier:
                  _BSD_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)


---------------------------------------------------------------

::

          The legacy function ttyslot() returns the index of the current
          user's entry in some file.

          Now "What file?" you ask.  Well, let's first look at some
          history.

      Ancient history
          There used to be a file /etc/ttys in UNIX V6, that was read by
          the init(1) program to find out what to do with each terminal
          line.  Each line consisted of three characters.  The first
          character was either '0' or '1', where '0' meant "ignore".  The
          second character denoted the terminal: '8' stood for "/dev/tty8".
          The third character was an argument to getty(8) indicating the
          sequence of line speeds to try ('-' was: start trying 110 baud).
          Thus a typical line was "18-".  A hang on some line was solved by
          changing the '1' to a '0', signaling init, changing back again,
          and signaling init again.

          In UNIX V7 the format was changed: here the second character was
          the argument to getty(8) indicating the sequence of line speeds
          to try ('0' was: cycle through 300-1200-150-110 baud; '4' was for
          the on-line console DECwriter) while the rest of the line
          contained the name of the tty.  Thus a typical line was
          "14console".

          Later systems have more elaborate syntax.  System V-like systems
          have /etc/inittab instead.

      Ancient history (2)
          On the other hand, there is the file /etc/utmp listing the people
          currently logged in.  It is maintained by login(1).  It has a
          fixed size, and the appropriate index in the file was determined
          by login(1) using the ttyslot() call to find the number of the
          line in /etc/ttys (counting from 1).

      The semantics of ttyslot
          Thus, the function ttyslot() returns the index of the controlling
          terminal of the calling process in the file /etc/ttys, and that
          is (usually) the same as the index of the entry for the current
          user in the file /etc/utmp.  BSD still has the /etc/ttys file,
          but System V-like systems do not, and hence cannot refer to it.
          Thus, on such systems the documentation says that ttyslot()
          returns the current user's index in the user accounting data
          base.


-----------------------------------------------------------------

::

          If successful, this function returns the slot number.  On error
          (e.g., if none of the file descriptors 0, 1, or 2 is associated
          with a terminal that occurs in this data base) it returns 0 on
          UNIX V6 and V7 and BSD-like systems, but -1 on System V-like
          systems.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────────────────────────────┬───────────────┬───────────┐
          │Interface                           │ Attribute     │ Value     │
          ├────────────────────────────────────┼───────────────┼───────────┤
          │ttyslot()                           │ Thread safety │ MT-Unsafe │
          └────────────────────────────────────┴───────────────┴───────────┘


-------------------------------------------------------------------

::

          SUSv1; marked as LEGACY in SUSv2; removed in POSIX.1-2001.  SUSv2
          requires -1 on error.


---------------------------------------------------

::

          The utmp file is found in various places on various systems, such
          as /etc/utmp, /var/adm/utmp, /var/run/utmp.

          The glibc2 implementation of this function reads the file
          _PATH_TTYS, defined in <ttyent.h> as "/etc/ttys".  It returns 0
          on error.  Since Linux systems do not usually have "/etc/ttys",
          it will always return 0.

          On BSD-like systems and Linux, the declaration of ttyslot() is
          provided by <unistd.h>.  On System V-like systems, the
          declaration is provided by <stdlib.h>.  Since glibc 2.24,
          <stdlib.h> also provides the declaration with the following
          feature test macro definitions:

              (_XOPEN_SOURCE >= 500 ||
                      (_XOPEN_SOURCE && _XOPEN_SOURCE_EXTENDED))
                  && ! (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)

          Minix also has fttyslot(fd).


---------------------------------------------------------

::

          getttyent(3), ttyname(3), utmp(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     TTYSLOT(3)

--------------

Pages that refer to this page:
`getttyent(3) <../man3/getttyent.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/ttyslot.3.license.html>`__

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
