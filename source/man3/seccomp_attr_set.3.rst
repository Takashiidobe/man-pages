.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

seccomp_attr_set(3) — Linux manual page
=======================================

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

   seccomp_attr_set(3)     libseccomp Documentation     seccomp_attr_set(3)

NAME
-------------------------------------------------

::

          seccomp_attr_set, seccomp_attr_get - Manage the seccomp filter
          attributes


---------------------------------------------------------

::

          #include <seccomp.h>

          typedef void * scmp_filter_ctx;
          enum scmp_filter_attr;

          int seccomp_attr_set(scmp_filter_ctx ctx,
                               enum scmp_filter_attr attr, uint32_t value);
          int seccomp_attr_get(scmp_filter_ctx ctx,
                               enum scmp_filter_attr attr, uint32_t *value);

          Link with -lseccomp.


---------------------------------------------------------------

::

          The seccomp_attr_set() function sets the different seccomp filter
          attributes while the seccomp_attr_get() function fetches the
          filter attributes.  The seccomp filter attributes are tunable
          values that affect how the library behaves when generating and
          loading the seccomp filter into the kernel.  The attributes are
          reset to their default values whenever the filter is initialized
          or reset via seccomp_filter_init(3) or seccomp_filter_reset(3).

          The filter context ctx is the value returned by the call to
          seccomp_init(3).

          Valid attr values are as follows:

          SCMP_FLTATR_ACT_DEFAULT
                 The default filter action as specified in the call to
                 seccomp_filter_init(3) or seccomp_filter_reset(3).  This
                 attribute is read-only.

          SCMP_FLTATR_ACT_BADARCH
                 The filter action taken when the loaded filter does not
                 match the architecture of the executing application.
                 Defaults to the SCMP_ACT_KILL action.

          SCMP_FLTATR_CTL_NNP
                 A flag to specify if the NO_NEW_PRIVS functionality should
                 be enabled before loading the seccomp filter into the
                 kernel.  Setting this to off ( value == 0) results in no
                 action, meaning that loading the seccomp filter into the
                 kernel will fail if CAP_SYS_ADMIN is missing and
                 NO_NEW_PRIVS has not been externally set.  Defaults to on
                 ( value == 1).

          SCMP_FLTATR_CTL_TSYNC
                 A flag to specify if the kernel should attempt to
                 synchronize the filters across all threads on
                 seccomp_load(3).  If the kernel is unable to synchronize
                 all of the thread then the load operation will fail.  This
                 flag is only available on Linux Kernel 3.17 or greater;
                 attempting to enable this flag on earlier kernels will
                 result in an error being returned.  Defaults to off (
                 value == 0).

          SCMP_FLTATR_API_TSKIP
                 A flag to specify if libseccomp should allow filter rules
                 to be created for the -1 syscall.  The -1 syscall value
                 can be used by tracer programs to skip specific syscall
                 invocations, see seccomp(2) for more information.
                 Defaults to off ( value == 0).

          SCMP_FLTATR_CTL_LOG
                 A flag to specify if the kernel should log all filter
                 actions taken except for the SCMP_ACT_ALLOW action.
                 Defaults to off ( value == 0).

          SCMP_FLTATR_CTL_SSB
                 A flag to disable Speculative Store Bypass mitigations for
                 this filter.  Defaults to off ( value == 0).

          SCMP_FLTATR_CTL_OPTIMIZE
                 A flag to specify the optimization level of the seccomp
                 filter.  By default libseccomp generates a set of
                 sequential ´if´ statements for each rule in the filter.
                 seccomp_syscall_priority(3) can be used to prioritize the
                 order for the default cause.  The binary tree optimization
                 sorts by syscall numbers and generates consistent O(log n)
                 filter traversal for every rule in the filter.  The binary
                 tree may be advantageous for large filters.  Note that
                 seccomp_syscall_priority(3) is ignored when
                 SCMP_FLTATR_CTL_OPTIMIZE == 2.

                 The different optimization levels are described below:

                 0      Reserved value, not currently used.

                 1      Rules sorted by priority and complexity (DEFAULT).

                 2      Binary tree sorted by syscall number.

          SCMP_FLTATR_API_SYSRAWRC
                 A flag to specify if libseccomp should pass system error
                 codes back to the caller instead of the default
                 -ECANCELED.  Defaults to off ( value == 0).


-----------------------------------------------------------------

::

          Returns zero on success or one of the following error codes on
          failure:

          -EACCES
                 Setting the attribute with the given value is not allowed.

          -EEXIST
                 The attribute does not exist.

          -EINVAL
                 Invalid input, either the context or architecture token is
                 invalid.

          -EOPNOTSUPP
                 The library doesn't support the particular operation.


---------------------------------------------------------

::

          #include <seccomp.h>

          int main(int argc, char *argv[])
          {
               int rc = -1;
               scmp_filter_ctx ctx;

               ctx = seccomp_init(SCMP_ACT_ALLOW);
               if (ctx == NULL)
                    goto out;

               /* ... */

               rc = seccomp_attr_set(ctx, SCMP_FLTATR_ACT_BADARCH, SCMP_ACT_TRAP);
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

          seccomp_init(3), seccomp_reset(3), seccomp_load(3), seccomp(2)

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

   paul@paul-moore.com           06 June 2020           seccomp_attr_set(3)

--------------

Pages that refer to this page:
`seccomp_merge(3) <../man3/seccomp_merge.3.html>`__, 
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
