.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

seccomp_merge(3) — Linux manual page
====================================

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

   seccomp_merge(3)        libseccomp Documentation        seccomp_merge(3)

NAME
-------------------------------------------------

::

          seccomp_merge - Merge two seccomp filters


---------------------------------------------------------

::

          #include <seccomp.h>

          typedef void * scmp_filter_ctx;

          int seccomp_merge(scmp_filter_ctx dst, scmp_filter_ctx src);

          Link with -lseccomp.


---------------------------------------------------------------

::

          The seccomp_merge() function merges the seccomp filter in src
          with the filter in dst and stores the resulting in the dst
          filter.  If successful, the src seccomp filter is released and
          all internal memory associated with the filter is freed; there is
          no need to call seccomp_release(3) on src and the caller should
          discard any references to the filter.

          In order to merge two seccomp filters, both filters must have the
          same attribute values and no overlapping architectures.


-----------------------------------------------------------------

::

          Returns zero on success or one of the following error codes on
          failure:

          -EDOM  Unable to merge the filters due to architecture issues,
                 e.g. byte endian mismatches.

          -EEXIST
                 The architecture already exists in the filter.

          -EINVAL
                 One of the filters is invalid.

          -ENOMEM
                 The library was unable to allocate enough memory.


---------------------------------------------------------

::

          #include <seccomp.h>

          int main(int argc, char *argv[])
          {
               int rc = -1;
               scmp_filter_ctx ctx_32, ctx_64;

               ctx_32 = seccomp_init(SCMP_ACT_KILL);
               if (ctx_32 == NULL)
                    goto out_all;
               ctx_64 = seccomp_init(SCMP_ACT_KILL);
               if (ctx_64 == NULL)
                    goto out_all;

               if (seccomp_arch_exist(ctx_32, SCMP_ARCH_X86) == -EEXIST) {
                    rc = seccomp_arch_add(ctx_32, SCMP_ARCH_X86);
                    if (rc != 0)
                         goto out_all;
                    rc = seccomp_arch_remove(ctx_32, SCMP_ARCH_NATIVE);
                    if (rc != 0)
                         goto out_all;
               }
               if (seccomp_arch_exist(ctx_64, SCMP_ARCH_X86_64) == -EEXIST) {
                    rc = seccomp_arch_add(ctx_64, SCMP_ARCH_X86_64);
                    if (rc != 0)
                         goto out_all;
                    rc = seccomp_arch_remove(ctx_64, SCMP_ARCH_NATIVE);
                    if (rc != 0)
                         goto out_all;
               }

               /* ... */

               rc = seccomp_merge(ctx_64, ctx_32);
               if (rc != 0)
                    goto out_all;

               /* NOTE: the 'ctx_32' filter is no longer valid at this point */

               /* ... */

          out:
               seccomp_release(ctx_64);
               return -rc;
          out_all:
               seccomp_release(ctx_32);
               goto out;
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

          seccomp_init(3), seccomp_reset(3), seccomp_arch_add(3),
          seccomp_arch_remove(3), seccomp_attr_get(3), seccomp_attr_set(3)

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

   paul@paul-moore.com            30 May 2020              seccomp_merge(3)

--------------

Pages that refer to this page:
`seccomp_arch_add(3) <../man3/seccomp_arch_add.3.html>`__

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
