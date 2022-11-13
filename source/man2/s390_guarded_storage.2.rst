.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

s390_guarded_storage(2) — Linux manual page
===========================================

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

   S390_GUARDED_STORAGE(2)    System Calls Manual   S390_GUARDED_STORAGE(2)

NAME
-------------------------------------------------

::

          s390_guarded_storage - operations with z/Architecture guarded
          storage facility


---------------------------------------------------------

::

          #include <asm/guarded_storage.h> /* Definition of GS_* constants */
          #include <sys/syscall.h>         /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_s390_guarded_storage, int command,
                      struct gs_cb *gs_cb);

          Note: glibc provides no wrapper for s390_guarded_storage(),
          necessitating the use of syscall(2).


---------------------------------------------------------------

::

          The s390_guarded_storage() system call enables the use of the
          Guarded Storage Facility (a z/Architecture-specific feature) for
          user-space processes.

          The guarded storage facility is a hardware feature that allows
          marking up to 64 memory regions (as of z14) as guarded; reading a
          pointer with a newly introduced "Load Guarded" (LGG) or "Load
          Logical and Shift Guarded" (LLGFSG) instructions will cause a
          range check on the loaded value and invoke a (previously set up)
          user-space handler if one of the guarded regions is affected.

          The command argument indicates which function to perform.  The
          following commands are supported:

          GS_ENABLE
                 Enable the guarded storage facility for the calling task.
                 The initial content of the guarded storage control block
                 will be all zeros.  After enablement, user-space code can
                 use the "Load Guarded Storage Controls" (LGSC) instruction
                 (or the load_gs_cb() function wrapper provided in the
                 asm/guarded_storage.h header) to load an arbitrary control
                 block.  While a task is enabled, the kernel will save and
                 restore the calling content of the guarded storage
                 registers on context switch.

          GS_DISABLE
                 Disables the use of the guarded storage facility for the
                 calling task.  The kernel will cease to save and restore
                 the content of the guarded storage registers, the task-
                 specific content of these registers is lost.

          GS_SET_BC_CB
                 Set a broadcast guarded storage control block to the one
                 provided in the gs_cb argument.  This is called per thread
                 and associates a specific guarded storage control block
                 with the calling task.  This control block will be used in
                 the broadcast command GS_BROADCAST.

          GS_CLEAR_BC_CB
                 Clears the broadcast guarded storage control block.  The
                 guarded storage control block will no longer have the
                 association established by the GS_SET_BC_CB command.

          GS_BROADCAST
                 Sends a broadcast to all thread siblings of the calling
                 task.  Every sibling that has established a broadcast
                 guarded storage control block will load this control block
                 and will be enabled for guarded storage.  The broadcast
                 guarded storage control block is consumed; a second
                 broadcast without a refresh of the stored control block
                 with GS_SET_BC_CB will not have any effect.

          The gs_cb argument specifies the address of a guarded storage
          control block structure and is currently used only by the
          GS_SET_BC_CB command; all other aforementioned commands ignore
          this argument.


-----------------------------------------------------------------

::

          On success, the return value of s390_guarded_storage() is 0.

          On error, -1 is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EFAULT command was GS_SET_BC_CB and the copying of the guarded
                 storage control block structure pointed by the gs_cb
                 argument has failed.

          EINVAL The value provided in the command argument was not valid.

          ENOMEM command was one of GS_ENABLE or GS_SET_BC_CB, and the
                 allocation of a new guarded storage control block has
                 failed.

          EOPNOTSUPP
                 The guarded storage facility is not supported by the
                 hardware.


---------------------------------------------------------

::

          This system call is available since Linux 4.12.


-------------------------------------------------------------------

::

          This Linux-specific system call is available only on the s390
          architecture.

          The guarded storage facility is available beginning with System
          z14.


---------------------------------------------------

::

          The description of the guarded storage facility along with
          related instructions and Guarded Storage Control Block and
          Guarded Storage Event Parameter List structure layouts is
          available in "z/Architecture Principles of Operations" beginning
          from the twelfth edition.

          The gs_cb structure has a field gsepla (Guarded Storage Event
          Parameter List Address), which is a user-space pointer to a
          Guarded Storage Event Parameter List structure (that contains the
          address of the aforementioned event handler in the gseha field),
          and its layout is available as a gs_epl structure type definition
          in the asm/guarded_storage.h header.


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

   Linux Programmer's Manual      2021-03-22        S390_GUARDED_STORAGE(2)

--------------

Pages that refer to this page: `syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/s390_guarded_storage.2.license.html>`__

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
