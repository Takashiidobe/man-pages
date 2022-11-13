.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

on_exit(3) — Linux manual page
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

   ON_EXIT(3)              Linux Programmer's Manual             ON_EXIT(3)

NAME
-------------------------------------------------

::

          on_exit - register a function to be called at normal process
          termination


---------------------------------------------------------

::

          #include <stdlib.h>

          int on_exit(void (*function)(int, void *), void *arg);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          on_exit():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The on_exit() function registers the given function to be called
          at normal process termination, whether via exit(3) or via return
          from the program's main().  The function is passed the status
          argument given to the last call to exit(3) and the arg argument
          from on_exit().

          The same function may be registered multiple times: it is called
          once for each registration.

          When a child process is created via fork(2), it inherits copies
          of its parent's registrations.  Upon a successful call to one of
          the exec(3) functions, all registrations are removed.


-----------------------------------------------------------------

::

          The on_exit() function returns the value 0 if successful;
          otherwise it returns a nonzero value.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │on_exit()                             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          This function comes from SunOS 4, but is also present in glibc.
          It no longer occurs in Solaris (SunOS 5).  Portable application
          should avoid this function, and use the standard atexit(3)
          instead.


---------------------------------------------------

::

          By the time function is executed, stack (auto) variables may
          already have gone out of scope.  Therefore, arg should not be a
          pointer to a stack variable; it may however be a pointer to a
          heap variable or a global variable.


---------------------------------------------------------

::

          _exit(2), atexit(3), exit(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     ON_EXIT(3)

--------------

Pages that refer to this page: `execve(2) <../man2/execve.2.html>`__, 
`\_exit(2) <../man2/_exit.2.html>`__, 
`atexit(3) <../man3/atexit.3.html>`__, 
`exit(3) <../man3/exit.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/on_exit.3.license.html>`__

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
