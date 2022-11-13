.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strsignal(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
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

   STRSIGNAL(3)            Linux Programmer's Manual           STRSIGNAL(3)

NAME
-------------------------------------------------

::

          strsignal, sigabbrev_np, sigdescr_np, sys_siglist - return string
          describing signal


---------------------------------------------------------

::

          #include <string.h>

          char *strsignal(int sig);
          const char *sigdescr_np(int sig);
          const char *sigabbrev_np(int sig);

          extern const char *const sys_siglist[];

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          sigabbrev_np(), sigdescr_np():
              _GNU_SOURCE

          strsignal():
              From glibc 2.10 to 2.31:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _GNU_SOURCE

          sys_siglist:
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE


---------------------------------------------------------------

::

          The strsignal() function returns a string describing the signal
          number passed in the argument sig.  The string can be used only
          until the next call to strsignal().  The string returned by
          strsignal() is localized according to the LC_MESSAGES category in
          the current locale.

          The sigdescr_np() function returns a string describing the signal
          number passed in the argument sig.  Unlike strsignal() this
          string is not influenced by the current locale.

          The sigabbrev_np() function returns the abbreviated name of the
          signal, sig.  For example, given the value SIGINT, it returns the
          string "INT".

          The (deprecated) array sys_siglist holds the signal description
          strings indexed by signal number.  The strsignal() or the
          sigdescr_np() function should be used instead of this array; see
          also VERSIONS.


-----------------------------------------------------------------

::

          The strsignal() function returns the appropriate description
          string, or an unknown signal message if the signal number is
          invalid.  On some systems (but not on Linux), NULL may instead be
          returned for an invalid signal number.

          The sigdescr_np() and sigabbrev_np() functions return the
          appropriate description string.  The returned string is
          statically allocated and valid for the lifetime of the program.
          These functions return NULL for an invalid signal number.


---------------------------------------------------------

::

          sigdescr_np() and sigabbrev_np() first appeared in glibc 2.32.

          Starting with version 2.32, the sys_siglist symbol is no longer
          exported by glibc.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────┬───────────────┬────────────────────────────────┐
          │Interface      │ Attribute     │ Value                          │
          ├───────────────┼───────────────┼────────────────────────────────┤
          │strsignal()    │ Thread safety │ MT-Unsafe race:strsignal       │
          │               │               │ locale                         │
          ├───────────────┼───────────────┼────────────────────────────────┤
          │sigdescr_np(), │ Thread safety │ MT-Safe                        │
          │sigabbrev_np() │               │                                │
          └───────────────┴───────────────┴────────────────────────────────┘


-------------------------------------------------------------------

::

          strsignal(): POSIX.1-2008.  Present on Solaris and the BSDs.

          sigdescr_np() and sigdabbrev_np() are GNU extensions.

          sys_siglist is nonstandard, but present on many other systems.


---------------------------------------------------

::

          sigdescr_np() and sigdabbrev_np() are thread-safe and async-
          signal-safe.


---------------------------------------------------------

::

          psignal(3), strerror(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   STRSIGNAL(3)

--------------

Pages that refer to this page: `psignal(3) <../man3/psignal.3.html>`__, 
`strerror(3) <../man3/strerror.3.html>`__, 
`signal(7) <../man7/signal.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/strsignal.3.license.html>`__

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
