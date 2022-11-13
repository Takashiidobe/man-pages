.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selabel_lookup_best_match(3) — Linux manual page
================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   selabel_lookup_best_match(3)nux API documentationel_lookup_best_match(3)

NAME
-------------------------------------------------

::

          selabel_lookup_best_match - obtain a best match SELinux security
          context - Only supported on file backend.


---------------------------------------------------------

::

          #include <selinux/selinux.h>
          #include <selinux/label.h>

          int selabel_lookup_best_match(struct selabel_handle *hnd,
                                        char **context,
                                        const char *key,
                                        const char **links,
                                        int type);

          int selabel_lookup_best_match_raw(struct selabel_handle *hnd,
                                            char **context,
                                            const char *key,
                                            const char **links,
                                            int type);


---------------------------------------------------------------

::

          selabel_lookup_best_match() performs a best match lookup
          operation on the handle hnd, returning the result in the memory
          pointed to by context, which must be freed by the caller using
          freecon(3).  The key parameter is a file path to check for best
          match using zero or more link (aliases) parameters. The order of
          precedence for best match is:

                 1.  An exact match for the real path (key) or

                 2.  An exact match for any of the links (aliases), or

                 3.  The longest fixed prefix match.

          The type parameter is an optional file mode argument that should
          be set to the mode bits of the file, as determined by lstat(2).
          mode may be zero, however full matching may not occur.

          selabel_lookup_best_match_raw() behaves identically to
          selabel_lookup_best_match() but does not perform context
          translation.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned and errno
          is set appropriately.


-----------------------------------------------------

::

          ENOENT No context corresponding to the input key and type was
                 found.

          EINVAL The key and/or type inputs are invalid, or the context
                 being returned failed validation.

          ENOMEM An attempt to allocate memory failed.


---------------------------------------------------

::

          Example usage - When a service creates a device node, it may also
          create one or more symlinks to the device node.  These symlinks
          may be the only stable name for the device, e.g. if the partition
          is dynamically assigned.  The file label backend supports this by
          looking up the "best match" for a device node based on its real
          path (key) and any links to it (aliases). The order of precedence
          for best match is described above.


---------------------------------------------------------

::

          selabel_open(3), selabel_stats(3), selinux_set_callback(3),
          selinux(8), lstat(2), selabel_file(5)

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

   Security Enhanced Linux        05 May 2015  selabel_lookup_best_match(3)

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
