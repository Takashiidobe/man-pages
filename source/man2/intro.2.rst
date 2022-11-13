.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

intro(2) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
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

   INTRO(2)                Linux Programmer's Manual               INTRO(2)

NAME
-------------------------------------------------

::

          intro - introduction to system calls


---------------------------------------------------------------

::

          Section 2 of the manual describes the Linux system calls.  A
          system call is an entry point into the Linux kernel.  Usually,
          system calls are not invoked directly: instead, most system calls
          have corresponding C library wrapper functions which perform the
          steps required (e.g., trapping to kernel mode) in order to invoke
          the system call.  Thus, making a system call looks the same as
          invoking a normal library function.

          In many cases, the C library wrapper function does nothing more
          than:

          *  copying arguments and the unique system call number to the
             registers where the kernel expects them;

          *  trapping to kernel mode, at which point the kernel does the
             real work of the system call;

          *  setting errno if the system call returns an error number when
             the kernel returns the CPU to user mode.

          However, in a few cases, a wrapper function may do rather more
          than this, for example, performing some preprocessing of the
          arguments before trapping to kernel mode, or postprocessing of
          values returned by the system call.  Where this is the case, the
          manual pages in Section 2 generally try to note the details of
          both the (usually GNU) C library API interface and the raw system
          call.  Most commonly, the main DESCRIPTION will focus on the C
          library interface, and differences for the system call are
          covered in the NOTES section.

          For a list of the Linux system calls, see syscalls(2).


-----------------------------------------------------------------

::

          On error, most system calls return a negative error number (i.e.,
          the negated value of one of the constants described in errno(3)).
          The C library wrapper hides this detail from the caller: when a
          system call returns a negative value, the wrapper copies the
          absolute value into the errno variable, and returns -1 as the
          return value of the wrapper.

          The value returned by a successful system call depends on the
          call.  Many system calls return 0 on success, but some can return
          nonzero values from a successful call.  The details are described
          in the individual manual pages.

          In some cases, the programmer must define a feature test macro in
          order to obtain the declaration of a system call from the header
          file specified in the man page SYNOPSIS section.  (Where
          required, these feature test macros must be defined before
          including any header files.)  In such cases, the required macro
          is described in the man page.  For further information on feature
          test macros, see feature_test_macros(7).


-------------------------------------------------------------------

::

          Certain terms and abbreviations are used to indicate UNIX
          variants and standards to which calls in this section conform.
          See standards(7).


---------------------------------------------------

::

      Calling directly
          In most cases, it is unnecessary to invoke a system call
          directly, but there are times when the Standard C library does
          not implement a nice wrapper function for you.  In this case, the
          programmer must manually invoke the system call using syscall(2).
          Historically, this was also possible using one of the _syscall
          macros described in _syscall(2).

      Authors and copyright conditions
          Look at the header of the manual page source for the author(s)
          and copyright conditions.  Note that these can be different from
          page to page!


---------------------------------------------------------

::

          _syscall(2), syscall(2), syscalls(2), errno(3), intro(3),
          capabilities(7), credentials(7), feature_test_macros(7),
          mq_overview(7), path_resolution(7), pipe(7), pty(7),
          sem_overview(7), shm_overview(7), signal(7), socket(7),
          standards(7), symlink(7), system_data_types(7), sysvipc(7),
          time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27                       INTRO(2)

--------------

Pages that refer to this page: `syscall(2) <../man2/syscall.2.html>`__, 
`\_syscall(2) <../man2/_syscall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`intro(3) <../man3/intro.3.html>`__, 
`man-pages(7) <../man7/man-pages.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/intro.2.license.html>`__

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
