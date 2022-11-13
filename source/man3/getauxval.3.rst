.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getauxval(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
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

   GETAUXVAL(3)            Linux Programmer's Manual           GETAUXVAL(3)

NAME
-------------------------------------------------

::

          getauxval - retrieve a value from the auxiliary vector


---------------------------------------------------------

::

          #include <sys/auxv.h>

          unsigned long getauxval(unsigned long type);


---------------------------------------------------------------

::

          The getauxval() function retrieves values from the auxiliary
          vector, a mechanism that the kernel's ELF binary loader uses to
          pass certain information to user space when a program is
          executed.

          Each entry in the auxiliary vector consists of a pair of values:
          a type that identifies what this entry represents, and a value
          for that type.  Given the argument type, getauxval() returns the
          corresponding value.

          The value returned for each type is given in the following list.
          Not all type values are present on all architectures.

          AT_BASE
                 The base address of the program interpreter (usually, the
                 dynamic linker).

          AT_BASE_PLATFORM
                 A pointer to a string (PowerPC and MIPS only).  On
                 PowerPC, this identifies the real platform; may differ
                 from AT_PLATFORM.  On MIPS, this identifies the ISA level
                 (since Linux 5.7).

          AT_CLKTCK
                 The frequency with which times(2) counts.  This value can
                 also be obtained via sysconf(_SC_CLK_TCK).

          AT_DCACHEBSIZE
                 The data cache block size.

          AT_EGID
                 The effective group ID of the thread.

          AT_ENTRY
                 The entry address of the executable.

          AT_EUID
                 The effective user ID of the thread.

          AT_EXECFD
                 File descriptor of program.

          AT_EXECFN
                 A pointer to a string containing the pathname used to
                 execute the program.

          AT_FLAGS
                 Flags (unused).

          AT_FPUCW
                 Used FPU control word (SuperH architecture only).  This
                 gives some information about the FPU initialization
                 performed by the kernel.

          AT_GID The real group ID of the thread.

          AT_HWCAP
                 An architecture and ABI dependent bit-mask whose settings
                 indicate detailed processor capabilities.  The contents of
                 the bit mask are hardware dependent (for example, see the
                 kernel source file arch/x86/include/asm/cpufeature.h for
                 details relating to the Intel x86 architecture; the value
                 returned is the first 32-bit word of the array described
                 there).  A human-readable version of the same information
                 is available via /proc/cpuinfo.

          AT_HWCAP2 (since glibc 2.18)
                 Further machine-dependent hints about processor
                 capabilities.

          AT_ICACHEBSIZE
                 The instruction cache block size.

          AT_L1D_CACHEGEOMETRY
                 Geometry of the L1 data cache, encoded with the cache line
                 size in bytes in the bottom 16 bits and the cache
                 associativity in the next 16 bits.  The associativity is
                 such that if N is the 16-bit value, the cache is N-way set
                 associative.

          AT_L1D_CACHESIZE
                 The L1 data cache size.

          AT_L1I_CACHEGEOMETRY
                 Geometry of the L1 instruction cache, encoded as for
                 AT_L1D_CACHEGEOMETRY.

          AT_L1I_CACHESIZE
                 The L1 instruction cache size.

          AT_L2_CACHEGEOMETRY
                 Geometry of the L2 cache, encoded as for
                 AT_L1D_CACHEGEOMETRY.

          AT_L2_CACHESIZE
                 The L2 cache size.

          AT_L3_CACHEGEOMETRY
                 Geometry of the L3 cache, encoded as for
                 AT_L1D_CACHEGEOMETRY.

          AT_L3_CACHESIZE
                 The L3 cache size.

          AT_PAGESZ
                 The system page size (the same value returned by
                 sysconf(_SC_PAGESIZE)).

          AT_PHDR
                 The address of the program headers of the executable.

          AT_PHENT
                 The size of program header entry.

          AT_PHNUM
                 The number of program headers.

          AT_PLATFORM
                 A pointer to a string that identifies the hardware
                 platform that the program is running on.  The dynamic
                 linker uses this in the interpretation of rpath values.

          AT_RANDOM
                 The address of sixteen bytes containing a random value.

          AT_SECURE
                 Has a nonzero value if this executable should be treated
                 securely.  Most commonly, a nonzero value indicates that
                 the process is executing a set-user-ID or set-group-ID
                 binary (so that its real and effective UIDs or GIDs differ
                 from one another), or that it gained capabilities by
                 executing a binary file that has capabilities (see
                 capabilities(7)).  Alternatively, a nonzero value may be
                 triggered by a Linux Security Module.  When this value is
                 nonzero, the dynamic linker disables the use of certain
                 environment variables (see ld-linux.so(8)) and glibc
                 changes other aspects of its behavior.  (See also
                 secure_getenv(3).)

          AT_SYSINFO
                 The entry point to the system call function in the vDSO.
                 Not present/needed on all architectures (e.g., absent on
                 x86-64).

          AT_SYSINFO_EHDR
                 The address of a page containing the virtual Dynamic
                 Shared Object (vDSO) that the kernel creates in order to
                 provide fast implementations of certain system calls.

          AT_UCACHEBSIZE
                 The unified cache block size.

          AT_UID The real user ID of the thread.


-----------------------------------------------------------------

::

          On success, getauxval() returns the value corresponding to type.
          If type is not found, 0 is returned.


-----------------------------------------------------

::

          ENOENT (since glibc 2.19)
                 No entry corresponding to type could be found in the
                 auxiliary vector.


---------------------------------------------------------

::

          The getauxval() function was added to glibc in version 2.16.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │getauxval()                           │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          This function is a nonstandard glibc extension.


---------------------------------------------------

::

          The primary consumer of the information in the auxiliary vector
          is the dynamic linker, ld-linux.so(8).  The auxiliary vector is a
          convenient and efficient shortcut that allows the kernel to
          communicate a certain set of standard information that the
          dynamic linker usually or always needs.  In some cases, the same
          information could be obtained by system calls, but using the
          auxiliary vector is cheaper.

          The auxiliary vector resides just above the argument list and
          environment in the process address space.  The auxiliary vector
          supplied to a program can be viewed by setting the LD_SHOW_AUXV
          environment variable when running a program:

              $ LD_SHOW_AUXV=1 sleep 1

          The auxiliary vector of any process can (subject to file
          permissions) be obtained via /proc/[pid]/auxv; see proc(5) for
          more information.


-------------------------------------------------

::

          Before the addition of the ENOENT error in glibc 2.19, there was
          no way to unambiguously distinguish the case where type could not
          be found from the case where the value corresponding to type was
          zero.


---------------------------------------------------------

::

          execve(2), secure_getenv(3), vdso(7), ld-linux.so(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-08-27                   GETAUXVAL(3)

--------------

Pages that refer to this page: `execve(2) <../man2/execve.2.html>`__, 
`getunwind(2) <../man2/getunwind.2.html>`__, 
`getenv(3) <../man3/getenv.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__,  `libc(7) <../man7/libc.7.html>`__, 
`random(7) <../man7/random.7.html>`__, 
`vdso(7) <../man7/vdso.7.html>`__,  `ld.so(8) <../man8/ld.so.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/getauxval.3.license.html>`__

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
