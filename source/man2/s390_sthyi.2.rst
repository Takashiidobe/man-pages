.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

s390_sthyi(2) — Linux manual page
=================================

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

   S390_STHYI(2)              System Calls Manual             S390_STHYI(2)

NAME
-------------------------------------------------

::

          s390_sthyi - emulate STHYI instruction


---------------------------------------------------------

::

          #include <asm/sthyi.h>        /* Definition of STHYI_* constants */
          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_s390_sthyi, unsigned long function_code,
                      void *resp_buffer, uint64_t *return_code,
                      unsigned long flags);

          Note: glibc provides no wrapper for s390_sthyi(), necessitating
          the use of syscall(2).


---------------------------------------------------------------

::

          The s390_sthyi() system call emulates the STHYI (Store Hypervisor
          Information) instruction.  It provides hardware resource
          information for the machine and its virtualization levels.  This
          includes CPU type and capacity, as well as the machine model and
          other metrics.

          The function_code argument indicates which function to perform.
          The following code(s) are supported:

          STHYI_FC_CP_IFL_CAP
                 Return CP (Central Processor) and IFL (Integrated Facility
                 for Linux) capacity information.

          The resp_buffer argument specifies the address of a response
          buffer.  When the function_code is STHYI_FC_CP_IFL_CAP, the
          buffer must be one page (4K) in size.  If the system call returns
          0, the response buffer will be filled with CPU capacity
          information.  Otherwise, the response buffer's content is
          unchanged.

          The return_code argument stores the return code of the STHYI
          instruction, using one of the following values:

          0      Success.

          4      Unsupported function code.

          For further details about return_code, function_code, and
          resp_buffer, see the reference given in NOTES.

          The flags argument is provided to allow for future extensions and
          currently must be set to 0.


-----------------------------------------------------------------

::

          On success (that is: emulation succeeded), the return value of
          s390_sthyi() matches the condition code of the STHYI
          instructions, which is a value in the range [0..3].  A return
          value of 0 indicates that CPU capacity information is stored in
          *resp_buffer.  A return value of 3 indicates "unsupported
          function code" and the content of *resp_buffer is unchanged.  The
          return values 1 and 2 are reserved.

          On error, -1 is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EFAULT The value specified in resp_buffer or return_code is not a
                 valid address.

          EINVAL The value specified in flags is nonzero.

          ENOMEM Allocating memory for handling the CPU capacity
                 information failed.

          EOPNOTSUPP
                 The value specified in function_code is not valid.


---------------------------------------------------------

::

          This system call is available since Linux 4.15.


-------------------------------------------------------------------

::

          This Linux-specific system call is available only on the s390
          architecture.


---------------------------------------------------

::

          For details of the STHYI instruction, see the documentation page
          
          ⟨https://www.ibm.com/support/knowledgecenter/SSB27U_6.3.0/com.ibm.zvm.v630.hcpb4/hcpb4sth.htm⟩.

          When the system call interface is used, the response buffer
          doesn't have to fulfill alignment requirements described in the
          STHYI instruction definition.

          The kernel caches the response (for up to one second, as of Linux
          4.16).  Subsequent system call invocations may return the cached
          response.


---------------------------------------------------------

::

          syscall(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux Programmer's Manual      2021-03-22                  S390_STHYI(2)

--------------

Pages that refer to this page: `syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/s390_sthyi.2.license.html>`__

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
