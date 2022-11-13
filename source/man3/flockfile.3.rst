.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flockfile(3) — Linux manual page
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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FLOCKFILE(3)            Linux Programmer's Manual           FLOCKFILE(3)

NAME
-------------------------------------------------

::

          flockfile, ftrylockfile, funlockfile - lock FILE for stdio


---------------------------------------------------------

::

          #include <stdio.h>

          void flockfile(FILE *filehandle);
          int ftrylockfile(FILE *filehandle);
          void funlockfile(FILE *filehandle);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          All functions shown above:
              /* Since glibc 2.24: */ _POSIX_C_SOURCE >= 199309L
                  || /* Glibc <= 2.23: */ _POSIX_C_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The stdio functions are thread-safe.  This is achieved by
          assigning to each FILE object a lockcount and (if the lockcount
          is nonzero) an owning thread.  For each library call, these
          functions wait until the FILE object is no longer locked by a
          different thread, then lock it, do the requested I/O, and unlock
          the object again.

          (Note: this locking has nothing to do with the file locking done
          by functions like flock(2) and lockf(3).)

          All this is invisible to the C-programmer, but there may be two
          reasons to wish for more detailed control.  On the one hand,
          maybe a series of I/O actions by one thread belongs together, and
          should not be interrupted by the I/O of some other thread.  On
          the other hand, maybe the locking overhead should be avoided for
          greater efficiency.

          To this end, a thread can explicitly lock the FILE object, then
          do its series of I/O actions, then unlock.  This prevents other
          threads from coming in between.  If the reason for doing this was
          to achieve greater efficiency, one does the I/O with the
          nonlocking versions of the stdio functions: with getc_unlocked(3)
          and putc_unlocked(3) instead of getc(3) and putc(3).

          The flockfile() function waits for *filehandle to be no longer
          locked by a different thread, then makes the current thread owner
          of *filehandle, and increments the lockcount.

          The funlockfile() function decrements the lock count.

          The ftrylockfile() function is a nonblocking version of
          flockfile().  It does nothing in case some other thread owns
          *filehandle, and it obtains ownership and increments the
          lockcount otherwise.


-----------------------------------------------------------------

::

          The ftrylockfile() function returns zero for success (the lock
          was obtained), and nonzero for failure.


-----------------------------------------------------

::

          None.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │flockfile(), ftrylockfile(),          │ Thread safety │ MT-Safe │
          │funlockfile()                         │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.

          These functions are available when _POSIX_THREAD_SAFE_FUNCTIONS
          is defined.


---------------------------------------------------------

::

          unlocked_stdio(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                   FLOCKFILE(3)

--------------

Pages that refer to this page:
`stdio_ext(3) <../man3/stdio_ext.3.html>`__, 
`unlocked_stdio(3) <../man3/unlocked_stdio.3.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/flockfile.3.license.html>`__

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
