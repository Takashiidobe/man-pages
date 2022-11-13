.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sysinfo(2) — Linux manual page
==============================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSINFO(2)              Linux Programmer's Manual             SYSINFO(2)

NAME
-------------------------------------------------

::

          sysinfo - return system information


---------------------------------------------------------

::

          #include <sys/sysinfo.h>

          int sysinfo(struct sysinfo *info);


---------------------------------------------------------------

::

          sysinfo() returns certain statistics on memory and swap usage, as
          well as the load average.

          Until Linux 2.3.16, sysinfo() returned information in the
          following structure:

              struct sysinfo {
                  long uptime;             /* Seconds since boot */
                  unsigned long loads[3];  /* 1, 5, and 15 minute load averages */
                  unsigned long totalram;  /* Total usable main memory size */
                  unsigned long freeram;   /* Available memory size */
                  unsigned long sharedram; /* Amount of shared memory */
                  unsigned long bufferram; /* Memory used by buffers */
                  unsigned long totalswap; /* Total swap space size */
                  unsigned long freeswap;  /* Swap space still available */
                  unsigned short procs;    /* Number of current processes */
                  char _f[22];             /* Pads structure to 64 bytes */
              };

          In the above structure, the sizes of the memory and swap fields
          are given in bytes.

          Since Linux 2.3.23 (i386) and Linux 2.3.48 (all architectures)
          the structure is:

              struct sysinfo {
                  long uptime;             /* Seconds since boot */
                  unsigned long loads[3];  /* 1, 5, and 15 minute load averages */
                  unsigned long totalram;  /* Total usable main memory size */
                  unsigned long freeram;   /* Available memory size */
                  unsigned long sharedram; /* Amount of shared memory */
                  unsigned long bufferram; /* Memory used by buffers */
                  unsigned long totalswap; /* Total swap space size */
                  unsigned long freeswap;  /* Swap space still available */
                  unsigned short procs;    /* Number of current processes */
                  unsigned long totalhigh; /* Total high memory size */
                  unsigned long freehigh;  /* Available high memory size */
                  unsigned int mem_unit;   /* Memory unit size in bytes */
                  char _f[20-2*sizeof(long)-sizeof(int)];
                                           /* Padding to 64 bytes */
              };

          In the above structure, sizes of the memory and swap fields are
          given as multiples of mem_unit bytes.


-----------------------------------------------------------------

::

          On success, sysinfo() returns zero.  On error, -1 is returned,
          and errno is set to indicate the error.


-----------------------------------------------------

::

          EFAULT info is not a valid address.


---------------------------------------------------------

::

          sysinfo() first appeared in Linux 0.98.pl6.


-------------------------------------------------------------------

::

          This function is Linux-specific, and should not be used in
          programs intended to be portable.


---------------------------------------------------

::

          All of the information provided by this system call is also
          available via /proc/meminfo and /proc/loadavg.


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

   Linux                          2021-03-22                     SYSINFO(2)

--------------

Pages that refer to this page:
`syscalls(2) <../man2/syscalls.2.html>`__, 
`get_phys_pages(3) <../man3/get_phys_pages.3.html>`__

--------------

`Copyright and license for this manual
page <../man2/sysinfo.2.license.html>`__

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
