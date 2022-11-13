.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

seccomp_export_bpf(3) — Linux manual page
=========================================

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

   seccomp_export_bpf(3)   libseccomp Documentation   seccomp_export_bpf(3)

NAME
-------------------------------------------------

::

          seccomp_export_bpf, seccomp_export_pfc - Export the seccomp
          filter


---------------------------------------------------------

::

          #include <seccomp.h>

          typedef void * scmp_filter_ctx;

          int seccomp_export_bpf(const scmp_filter_ctx ctx, int fd);
          int seccomp_export_pfc(const scmp_filter_ctx ctx, int fd);

          Link with -lseccomp.


---------------------------------------------------------------

::

          The seccomp_export_bpf() and seccomp_export_pfc() functions
          generate and output the current seccomp filter in either BPF
          (Berkeley Packet Filter) or PFC (Pseudo Filter Code).  The output
          of seccomp_export_bpf() is suitable for loading into the kernel,
          while the output of seccomp_export_pfc() is human readable and is
          intended primarily as a debugging tool for developers using
          libseccomp.  Both functions write the filter to the fd file
          descriptor.

          The filter context ctx is the value returned by the call to
          seccomp_init(3).

          While the two output formats are guaranteed to be functionally
          equivalent for the given seccomp filter configuration, the filter
          instructions, and their ordering, are not guaranteed to be the
          same in both the BPF and PFC formats.


-----------------------------------------------------------------

::

          Return zero on success or one of the following error codes on
          failure:

          -ECANCELED
                 There was a system failure beyond the control of the
                 library.

          -EFAULT
                 Internal libseccomp failure.

          -EINVAL
                 Invalid input, either the context or architecture token is
                 invalid.

          -ENOMEM
                 The library was unable to allocate enough memory.

          If the SCMP_FLTATR_API_SYSRAWRC filter attribute is non-zero then
          additional error codes may be returned to the caller; these
          additional error codes are the negative errno values returned by
          the system.  Unfortunately libseccomp can make no guarantees
          about these return values.


---------------------------------------------------------

::

          #include <seccomp.h>

          int main(int argc, char *argv[])
          {
               int rc = -1;
               scmp_filter_ctx ctx;
               int filter_fd;

               ctx = seccomp_init(SCMP_ACT_KILL);
               if (ctx == NULL)
                    goto out;

               /* ... */

               filter_fd = open("/tmp/seccomp_filter.bpf", O_WRONLY);
               if (filter_fd == -1) {
                    rc = -errno;
                    goto out;
               }

               rc = seccomp_export_bpf(ctx, filter_fd);
               if (rc < 0) {
                    close(filter_fd);
                    goto out;
               }
               close(filter_fd);

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

          seccomp_init(3), seccomp_release(3)

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

   paul@paul-moore.com            30 May 2020         seccomp_export_bpf(3)

--------------

Pages that refer to this page: `seccomp(2) <../man2/seccomp.2.html>`__

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
