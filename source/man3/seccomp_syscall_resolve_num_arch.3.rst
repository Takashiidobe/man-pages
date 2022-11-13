.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

seccomp_syscall_resolve_name(3) — Linux manual page
===================================================

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

   seccomp_syscall_resolve_name(3)omp Documentation_syscall_resolve_name(3)

NAME
-------------------------------------------------

::

          seccomp_syscall_resolve_name - Resolve a syscall name


---------------------------------------------------------

::

          #include <seccomp.h>

          int seccomp_syscall_resolve_name(const char *name);
          int seccomp_syscall_resolve_name_arch(uint32_t arch_token,
                                                const char *name);
          int seccomp_syscall_resolve_name_rewrite(uint32_t arch_token,
                                                   const char *name);
          char *seccomp_syscall_resolve_num_arch(uint32_t arch_token, int num);

          Link with -lseccomp.


---------------------------------------------------------------

::

          The seccomp_syscall_resolve_name(),
          seccomp_syscall_resolve_name_arch(), and
          seccomp_syscall_resolve_name_rewrite() functions resolve the
          commonly used syscall name to the syscall number used by the
          kernel and the rest of the libseccomp API, with
          seccomp_syscall_resolve_name_rewrite() rewriting the syscall
          number for architectures that modify the syscall.  Syscall
          rewriting typically happens in case of a multiplexed syscall,
          like socketcall(2) or ipc(2) on x86.
          seccomp_syscall_resolve_num_arch() function resolves the syscall
          number used by the kernel to the commonly used syscall name.

          The caller is responsible for freeing the returned string from
          seccomp_syscall_resolve_num_arch().


-----------------------------------------------------------------

::

          In the case of seccomp_syscall_resolve_name(),
          seccomp_syscall_resolve_name_arch(), and
          seccomp_syscall_resolve_name_rewrite() the associated syscall
          number is returned, with the negative pseudo syscall number being
          returned in cases where the given syscall does not exist for the
          architecture.  The value __NR_SCMP_ERROR is returned in case of
          error.  In all cases, the return value is suitable for use in any
          libseccomp API function which requires the syscall number,
          examples include seccomp_rule_add() and seccomp_rule_add_exact().

          In the case of seccomp_syscall_resolve_num_arch() the associated
          syscall name is returned and it remains the callers
          responsibility to free the returned string via free(3).


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

               rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW,
                                     seccomp_syscall_resolve_name("open"), 0);
               if (rc < 0)
                    goto out;

               /* ... */

               rc = seccomp_load(ctx);
               if (rc < 0)
                    goto out;

               /* ... */

          out:
               seccomp_release(ctx);
               return -rc;
          }


---------------------------------------------------

::

          In case of bare syscalls implemented on top of a multiplexed
          syscall, seccomp_syscall_resolve_name() and
          seccomp_syscall_resolve_name_arch() can be used to verify if a
          bare syscall is implemented for a specific architecture, while
          seccomp_syscall_resolve_name_rewrite() can be used to determine
          the underlying multiplexed syscall.

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

          seccomp_rule_add(3), seccomp_rule_add_exact(3)

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

   paul@paul-moore.com            8 May 2014seccomp_syscall_resolve_name(3)

--------------

Pages that refer to this page:
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
