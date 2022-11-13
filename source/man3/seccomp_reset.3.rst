.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

seccomp_init(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   seccomp_init(3)         libseccomp Documentation         seccomp_init(3)

NAME
-------------------------------------------------

::

          seccomp_init, seccomp_reset - Initialize the seccomp filter state


---------------------------------------------------------

::

          #include <seccomp.h>

          typedef void * scmp_filter_ctx;

          scmp_filter_ctx seccomp_init(uint32_t def_action);
          int seccomp_reset(scmp_filter_ctx ctx, uint32_t def_action);

          Link with -lseccomp.


---------------------------------------------------------------

::

          The seccomp_init() and seccomp_reset() functions (re)initialize
          the internal seccomp filter state, prepares it for use, and sets
          the default action based on the def_action parameter.  The
          seccomp_init() function must be called before any other
          libseccomp functions as the rest of the library API will fail if
          the filter context is not initialized properly.  The
          seccomp_reset() function releases the existing filter context
          state before reinitializing it and can only be called after a
          call to seccomp_init() has succeeded.  If seccomp_reset() is
          called with a NULL filter, it resets the library's global task
          state, including any notification file descriptors retrieved by
          seccomp_notify_fd(3).  Normally this is not needed, but it may be
          required to continue using the library after a fork() or clone()
          call to ensure the API level and user notification state is
          properly reset.

          When the caller is finished configuring the seccomp filter and
          has loaded it into the kernel, the caller should call
          seccomp_release(3) to release all of the filter context state.

          Valid def_action values are as follows:

          SCMP_ACT_KILL
                 The thread will be terminated by the kernel with SIGSYS
                 when it calls a syscall that does not match any of the
                 configured seccomp filter rules.  The thread will not be
                 able to catch the signal.

          SCMP_ACT_KILL_PROCESS
                 The entire process will be terminated by the kernel with
                 SIGSYS when it calls a syscall that does not match any of
                 the configured seccomp filter rules.

          SCMP_ACT_TRAP
                 The thread will be sent a SIGSYS signal when it calls a
                 syscall that does not match any of the configured seccomp
                 filter rules.  It may catch this and change its behavior
                 accordingly.  When using SA_SIGINFO with sigaction(2),
                 si_code will be set to SYS_SECCOMP, si_syscall will be set
                 to the syscall that failed the rules, and si_arch will be
                 set to the AUDIT_ARCH for the active ABI.

          SCMP_ACT_ERRNO(uint16_t errno)
                 The thread will receive a return value of errno when it
                 calls a syscall that does not match any of the configured
                 seccomp filter rules.

          SCMP_ACT_TRACE(uint16_t msg_num)
                 If the thread is being traced and the tracing process
                 specified the PTRACE_O_TRACESECCOMP option in the call to
                 ptrace(2), the tracing process will be notified, via
                 PTRACE_EVENT_SECCOMP, and the value provided in msg_num
                 can be retrieved using the PTRACE_GETEVENTMSG option.

          SCMP_ACT_LOG
                 The seccomp filter will have no effect on the thread
                 calling the syscall if it does not match any of the
                 configured seccomp filter rules but the syscall will be
                 logged.

          SCMP_ACT_ALLOW
                 The seccomp filter will have no effect on the thread
                 calling the syscall if it does not match any of the
                 configured seccomp filter rules.


-----------------------------------------------------------------

::

          The seccomp_init() function returns a filter context on success,
          NULL on failure.  The seccomp_reset() function returns zero on
          success or one of the following error codes on failure:

          -EINVAL
                 Invalid input, either the context or action is invalid.

          -ENOMEM
                 The library was unable to allocate enough memory.


---------------------------------------------------------

::

          #include <seccomp.h>

          int main(int argc, char *argv[])
          {
               int rc = -1;
               scmp_filter_ctx ctx;

               ctx = seccomp_init(SCMP_ACT_KILL);
               if (ctx == NULL)
                    goto out;

               /* ... */

               rc = seccomp_reset(ctx, SCMP_ACT_KILL);
               if (rc < 0)
                    goto out;

               /* ... */

          out:
               seccomp_release(ctx);
               return -rc;
          }


---------------------------------------------------

::

          While the seccomp filter can be generated independent of the
          kernel, kernel support is required to load and enforce the
          seccomp filter generated by libseccomp.

          The libseccomp project site, with more information and the source
          code repository, can be found at
          https://github.com/seccomp/libseccomp.  This tool, as well as the
          libseccomp library, is currently under development, please report
          any bugs at the project site or directly to the author.


-----------------------------------------------------

::

          Paul Moore <paul@paul-moore.com>


---------------------------------------------------------

::

          seccomp_release(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the libseccomp (high-level API to the Linux
          Kernel's seccomp filter) project.  Information about the project
          can be found at ⟨https://github.com/seccomp/libseccomp⟩.  If you
          have a bug report for this manual page, see
          ⟨https://groups.google.com/d/forum/libseccomp⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/seccomp/libseccomp⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-25.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   paul@paul-moore.com            30 May 2020               seccomp_init(3)

--------------

Pages that refer to this page: `seccomp(2) <../man2/seccomp.2.html>`__, 
`seccomp_arch_add(3) <../man3/seccomp_arch_add.3.html>`__, 
`seccomp_attr_set(3) <../man3/seccomp_attr_set.3.html>`__, 
`seccomp_export_bpf(3) <../man3/seccomp_export_bpf.3.html>`__, 
`seccomp_load(3) <../man3/seccomp_load.3.html>`__, 
`seccomp_merge(3) <../man3/seccomp_merge.3.html>`__, 
`seccomp_release(3) <../man3/seccomp_release.3.html>`__, 
`seccomp_rule_add(3) <../man3/seccomp_rule_add.3.html>`__

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
