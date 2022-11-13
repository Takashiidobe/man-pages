.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selinux_file_context_verify(3) — Linux manual page
==================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   selinux_file_context_verify(3)y Functions Manualx_file_context_verify(3)

NAME
-------------------------------------------------

::

          selinux_file_context_verify - Compare the SELinux security
          context on disk to the default security context required by the
          policy file contexts file


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int selinux_file_context_verify(const char *path, mode_t mode);


---------------------------------------------------------------

::

          selinux_file_context_verify() compares the context of the
          specified path that is held on disk (in the extended attribute),
          to the system default entry held in the file contexts series of
          files.

          The mode may be zero.

          Note that the two contexts are compared for "significant"
          differences (i.e. the user component of the contexts are ignored)
          as shown in the EXAMPLE section.


-----------------------------------------------------------------

::

          If the contexts significantly match, 1 (one) is returned.

          If the contexts do not match 0 (zero) is returned and errno is
          set to either ENOENT or EINVAL for the reasons listed in the
          ERRORS section, or if errno = 0 then the contexts did not match.

          On failure -1 is returned and errno set appropriately.


-----------------------------------------------------

::

          ENOTSUP
                 if extended attributes are not supported by the file
                 system.

          ENOENT if there is no entry in the file contexts series of files
                 or path does not exist.

          EINVAL if the entry in the file contexts series of files or path
                 are invalid, or the returned context fails validation.

          ENOMEM if attempt to allocate memory failed.


---------------------------------------------------

::

          The following configuration files (the file contexts series of
          files) supporting the active policy will be used (should they
          exist) to determine the path default context:

                 contexts/files/file_contexts - This file must exist.

                 contexts/files/file_contexts.local - If exists has local
                 customizations.

                 contexts/files/file_contexts.homedirs - If exists has
                 users home directory customizations.

                 contexts/files/file_contexts.subs - If exists has
                 substitutions that are then applied to the 'in memory'
                 version of the file contexts files.


-------------------------------------------------------

::

          If the files context is:
                 unconfined_u:object_r:admin_home_t:s0

          and the default context defined in the file contexts file is:
                 system_u:object_r:admin_home_t:s0

          then the actual strings compared are:
                 :object_r:admin_home_t:s0 and :object_r:admin_home_t:s0

          Therefore they will match and selinux_file_context_verify() will
          return 1.


---------------------------------------------------------

::

          selinux(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the selinux (Security-Enhanced Linux user-
          space libraries and tools) project.  Information about the
          project can be found at 
          ⟨https://github.com/SELinuxProject/selinux/wiki⟩.  If you have a
          bug report for this manual page, see
          ⟨https://github.com/SELinuxProject/selinux/wiki/Contributing⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/SELinuxProject/selinux⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   SELinux API documentation     08 March 2011selinux_file_context_verify(3)

--------------

Pages that refer to this page:
`selinux_lsetfilecon_default(3) <../man3/selinux_lsetfilecon_default.3.html>`__

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
