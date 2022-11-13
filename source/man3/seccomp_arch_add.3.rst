.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

seccomp_arch_add(3) — Linux manual page
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

   seccomp_arch_add(3)     libseccomp Documentation     seccomp_arch_add(3)

NAME
-------------------------------------------------

::

          seccomp_arch_add, seccomp_arch_remove, seccomp_arch_exist,
          seccomp_arch_native - Manage seccomp filter architectures


---------------------------------------------------------

::

          #include <seccomp.h>

          typedef void * scmp_filter_ctx;

          #define SCMP_ARCH_NATIVE
          #define SCMP_ARCH_X86
          #define SCMP_ARCH_X86_64
          #define SCMP_ARCH_X32
          #define SCMP_ARCH_ARM
          #define SCMP_ARCH_AARCH64
          #define SCMP_ARCH_MIPS
          #define SCMP_ARCH_MIPS64
          #define SCMP_ARCH_MIPS64N32
          #define SCMP_ARCH_MIPSEL
          #define SCMP_ARCH_MIPSEL64
          #define SCMP_ARCH_MIPSEL64N32
          #define SCMP_ARCH_PPC
          #define SCMP_ARCH_PPC64
          #define SCMP_ARCH_PPC64LE
          #define SCMP_ARCH_S390
          #define SCMP_ARCH_S390X
          #define SCMP_ARCH_PARISC
          #define SCMP_ARCH_PARISC64
          #define SCMP_ARCH_RISCV64

          uint32_t seccomp_arch_resolve_name(const char *arch_name);
          uint32_t seccomp_arch_native();
          int seccomp_arch_exist(const scmp_filter_ctx ctx, uint32_t arch_token);
          int seccomp_arch_add(scmp_filter_ctx ctx, uint32_t arch_token);
          int seccomp_arch_remove(scmp_filter_ctx ctx, uint32_t arch_token);

          Link with -lseccomp.


---------------------------------------------------------------

::

          The seccomp_arch_exist() function tests to see if a given
          architecture has been added to the seccomp filter in ctx , where
          the seccomp_arch_add() and seccomp_arch_remove() add and remove,
          respectively, architectures from the seccomp filter.  In all
          three functions, the architecture values given in arch_token
          should be the SCMP_ARCH_* defined constants; with the
          SCMP_ARCH_NATIVE constant always referring to the native compiled
          architecture.  The seccomp_arch_native() function returns the
          system's architecture such that it will match one of the
          SCMP_ARCH_* constants.  While the seccomp_arch_resolve_name()
          function also returns a SCMP_ARCH_* constant, the returned token
          matches the name of the architecture passed as an argument to the
          function.

          When a seccomp filter is initialized with the call to
          seccomp_init(3) the native architecture is automatically added to
          the filter.

          While it is possible to remove all architectures from a filter,
          most of the libseccomp APIs will fail if the filter does not
          contain at least one architecture.

          When adding a new architecture to an existing filter, the
          existing rules will not be added to the new architecture.
          However, rules added after adding the new architecture will be
          added to all of the architectures in the filter.


-----------------------------------------------------------------

::

          The seccomp_arch_add(), seccomp_arch_remove(), and
          seccomp_arch_exist() functions return zero on success or one of
          the following error codes on failure:

          -EDOM  Architecture specific failure.

          -EEXIST
                 In the case of seccomp_arch_add() the architecture already
                 exists and in the case of seccomp_arch_remove() the
                 architecture does not exist.

          -EINVAL
                 Invalid input, either the context or architecture token is
                 invalid.

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

               if (seccomp_arch_exist(ctx, SCMP_ARCH_X86) == -EEXIST) {
                    rc = seccomp_arch_add(ctx, SCMP_ARCH_X86);
                    if (rc != 0)
                         goto out_all;
                    rc = seccomp_arch_remove(ctx, SCMP_ARCH_NATIVE);
                    if (rc != 0)
                         goto out_all;
               }

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

          seccomp_init(3), seccomp_reset(3), seccomp_merge(3)

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

   paul@paul-moore.com           15 June 2020           seccomp_arch_add(3)

--------------

Pages that refer to this page:
`seccomp_merge(3) <../man3/seccomp_merge.3.html>`__

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
