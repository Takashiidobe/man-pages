.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libpsx(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \|                                |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LIBPSX(3)               Linux Programmer's Manual              LIBPSX(3)

NAME
-------------------------------------------------

::

          psx_syscall3, psx_syscall6 - POSIX semantics for system calls


---------------------------------------------------------

::

          #include <sys/psx_syscall.h>

          long int psx_syscall3(long int syscall_nr, long int arg1, long int arg2, long int arg3);
          long int psx_syscall6(long int syscall_nr, long int arg1, long int arg2, long int arg3, long int arg4, long int arg5, long int arg6);

          Link with one of these:

          ld ... -lpsx -lpthread --wrap=pthread_create

          gcc ... -lpsx -lpthread -Wl,-wrap,pthread_create


---------------------------------------------------------------

::

          The libpsx library attempts to fill a gap left by the pthreads(7)
          implementation on Linux. To be compliant POSIX threads, via the
          nptl(7) setxid mechanism glibc maintains consistent UID and GID
          credentials amongst all of the threads associated with the
          current process. However, other credential state is not supported
          by this abstraction. To support these extended kernel managed
          security attributes, libpsx provides a more generic pair of
          wrapping system call functions: psx_syscall3() and
          psx_syscall6().  Like the setxid mechanism, the coordination of
          thread state is mediated by a realtime signal. Whereas the
          nptl:setxid mechanism uses signo=33 (which is hidden by glibc
          below a redefined SIGRTMIN), libpsx inserts itself in the SIGSYS
          handler stack. It goes to great length to be the first such
          handler but acts as a pass-through for other SIGSYS uses.

          A linker trick of wrapping the pthread_create() call with a psx
          thread registration function is used to ensure libpsx can keep
          track of all pthreads.

          An inefficient macrology trick supports the psx_syscall() pseudo
          function which takes 1 to 7 arguments, depending on the needs of
          the caller. The macrology pads out the call to actually use
          psx_syscall3() or psx_syscall6() with zeros filling the missing
          arguments. While using this in source code will make it appear
          clean, the actual code footprint is larger. You are encouraged to
          use the more explicit psx_syscall3() and psx_syscall6() functions
          as needed.


-----------------------------------------------------------------

::

          The return value for system call functions is generally the value
          returned by the kernel, or -1 in the case of an error. In such
          cases errno(3) is set to the detailed error value. The
          psx_syscall3() and psx_syscall6() functions attempt a single
          threaded system call and return immediately in the case of an
          error. Should this call succeed, then the same system calls are
          executed from a signal handler on each of the other threads of
          the process.


-------------------------------------------------------------------

::

          The needs of libcap(3) for POSIX semantics of capability
          manipulation. You can read more about why this is needed here:

          https://sites.google.com/site/fullycapable/who-ordered-libpsx


---------------------------------------------------------------------

::

          The libpsx library is distributed from
          https://sites.google.com/site/fullycapable/ where the release
          notes may already cover recent issues.  Please report newly
          discovered bugs via:

          https://bugzilla.kernel.org/buglist.cgi?component=libcap&list_id=1090757


---------------------------------------------------------

::

          libcap(3), pthreads(7) and nptl(7).

COLOPHON
---------------------------------------------------------

::

          This page is part of the libcap (capabilities commands and
          library) project.  Information about the project can be found at
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩.  If you
          have a bug report for this manual page, send it to
          morgan@kernel.org (please put "libcap" in the Subject line).
          This page was obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-25.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  2021-03-06                      LIBPSX(3)

--------------

Pages that refer to this page:
`cap_get_proc(3) <../man3/cap_get_proc.3.html>`__, 
`cap_launch(3) <../man3/cap_launch.3.html>`__, 
`libcap(3) <../man3/libcap.3.html>`__

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
