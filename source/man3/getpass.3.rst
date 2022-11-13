.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getpass(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
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

   GETPASS(3)              Linux Programmer's Manual             GETPASS(3)

NAME
-------------------------------------------------

::

          getpass - get a password


---------------------------------------------------------

::

          #include <unistd.h>

          char *getpass(const char *prompt);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getpass():
              Since glibc 2.2.2:
                  _XOPEN_SOURCE && ! (_POSIX_C_SOURCE >= 200112L)
                      || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                      || /* Glibc <= 2.19: */ _BSD_SOURCE
              Before glibc 2.2.2:
                  none


---------------------------------------------------------------

::

          This function is obsolete.  Do not use it.  If you want to read
          input without terminal echoing enabled, see the description of
          the ECHO flag in termios(3).

          The getpass() function opens /dev/tty (the controlling terminal
          of the process), outputs the string prompt, turns off echoing,
          reads one line (the "password"), restores the terminal state and
          closes /dev/tty again.


-----------------------------------------------------------------

::

          The function getpass() returns a pointer to a static buffer
          containing (the first PASS_MAX bytes of) the password without the
          trailing newline, terminated by a null byte ('\0').  This buffer
          may be overwritten by a following call.  On error, the terminal
          state is restored, errno is set to indicate the error, and NULL
          is returned.


-----------------------------------------------------

::

          ENXIO  The process does not have a controlling terminal.


---------------------------------------------------

::

          /dev/tty


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │getpass()                      │ Thread safety │ MT-Unsafe term │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          Present in SUSv2, but marked LEGACY.  Removed in POSIX.1-2001.


---------------------------------------------------

::

          In the GNU C library implementation, if /dev/tty cannot be
          opened, the prompt is written to stderr and the password is read
          from stdin.  There is no limit on the length of the password.
          Line editing is not disabled.

          According to SUSv2, the value of PASS_MAX must be defined in
          <limits.h> in case it is smaller than 8, and can in any case be
          obtained using sysconf(_SC_PASS_MAX).  However, POSIX.2 withdraws
          the constants PASS_MAX and _SC_PASS_MAX, and the function
          getpass().  The glibc version accepts _SC_PASS_MAX and returns
          BUFSIZ (e.g., 8192).


-------------------------------------------------

::

          The calling process should zero the password as soon as possible
          to avoid leaving the cleartext password visible in the process's
          address space.


---------------------------------------------------------

::

          crypt(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     GETPASS(3)

--------------

Pages that refer to this page: `crypt(3) <../man3/crypt.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/getpass.3.license.html>`__

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
