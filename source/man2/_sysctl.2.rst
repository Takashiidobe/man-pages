.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sysctl(2) — Linux manual page
=============================

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
| `BUGS <#BUGS>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSCTL(2)               Linux Programmer's Manual              SYSCTL(2)

NAME
-------------------------------------------------

::

          sysctl - read/write system parameters


---------------------------------------------------------

::

          #include <unistd.h>
          #include <linux/sysctl.h>

          int _sysctl(struct __sysctl_args *args);


---------------------------------------------------------------

::

          This system call no longer exists on current kernels!  See NOTES.

          The _sysctl() call reads and/or writes kernel parameters.  For
          example, the hostname, or the maximum number of open files.  The
          argument has the form

              struct __sysctl_args {
                  int    *name;    /* integer vector describing variable */
                  int     nlen;    /* length of this vector */
                  void   *oldval;  /* 0 or address where to store old value */
                  size_t *oldlenp; /* available room for old value,
                                      overwritten by actual size of old value */
                  void   *newval;  /* 0 or address of new value */
                  size_t  newlen;  /* size of new value */
              };

          This call does a search in a tree structure, possibly resembling
          a directory tree under /proc/sys, and if the requested item is
          found calls some appropriate routine to read or modify the value.


-----------------------------------------------------------------

::

          Upon successful completion, _sysctl() returns 0.  Otherwise, a
          value of -1 is returned and errno is set to indicate the error.


-----------------------------------------------------

::

          EACCES, EPERM
                 No search permission for one of the encountered
                 "directories", or no read permission where oldval was
                 nonzero, or no write permission where newval was nonzero.

          EFAULT The invocation asked for the previous value by setting
                 oldval non-NULL, but allowed zero room in oldlenp.

          ENOTDIR
                 name was not found.


---------------------------------------------------------

::

          This system call first appeared in Linux 1.3.57.  It was removed
          in Linux 5.5; glibc support was removed in version 2.32.


-------------------------------------------------------------------

::

          This call is Linux-specific, and should not be used in programs
          intended to be portable.  It originated in 4.4BSD.  Only Linux
          has the /proc/sys mirror, and the object naming schemes differ
          between Linux and 4.4BSD, but the declaration of the sysctl()
          function is the same in both.


---------------------------------------------------

::

          Use of this system call was long discouraged: since Linux 2.6.24,
          uses of this system call result in warnings in the kernel log,
          and in Linux 5.5, the system call was finally removed.  Use the
          /proc/sys interface instead.

          Note that on older kernels where this system call still exists,
          it is available only if the kernel was configured with the
          CONFIG_SYSCTL_SYSCALL option.  Furthermore, glibc does not
          provide a wrapper for this system call, necessitating the use of
          syscall(2).


-------------------------------------------------

::

          The object names vary between kernel versions, making this system
          call worthless for applications.

          Not all available objects are properly documented.

          It is not yet possible to change operating system by writing to
          /proc/sys/kernel/ostype.


---------------------------------------------------------

::

          #define _GNU_SOURCE
          #include <unistd.h>
          #include <sys/syscall.h>
          #include <string.h>
          #include <stdio.h>
          #include <stdlib.h>
          #include <linux/sysctl.h>

          int _sysctl(struct __sysctl_args *args );

          #define OSNAMESZ 100

          int
          main(void)
          {
              struct __sysctl_args args;
              char osname[OSNAMESZ];
              size_t osnamelth;
              int name[] = { CTL_KERN, KERN_OSTYPE };

              memset(&args, 0, sizeof(args));
              args.name = name;
              args.nlen = sizeof(name)/sizeof(name[0]);
              args.oldval = osname;
              args.oldlenp = &osnamelth;

              osnamelth = sizeof(osname);

              if (syscall(SYS__sysctl, &args) == -1) {
                  perror("_sysctl");
                  exit(EXIT_FAILURE);
              }
              printf("This machine is running %*s\n", osnamelth, osname);
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          proc(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      SYSCTL(2)

--------------

Pages that refer to this page:
`syscalls(2) <../man2/syscalls.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__,  `sctp(7) <../man7/sctp.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/sysctl.2.license.html>`__

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
