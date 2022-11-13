.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selabel_get_digests_all_partial_matches(3) — Linux manual page
==============================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   selabel_get_digests_all_partial_matches(3)Manuals_all_partial_matches(3)

NAME
-------------------------------------------------

::

          selabel_get_digests_all_partial_matches - retrieve the partial
          matches digest and the xattr digest that applies to the supplied
          path - Only supported on file backend.


---------------------------------------------------------

::

          #include <stdbool.h>
          #include <selinux/selinux.h>
          #include <selinux/label.h>

          bool selabel_get_digests_all_partial_matches(
                                                  struct selabel_handle
                                                  *hnd,
                                                  const char *key,
                                                  uint8_t
                                                  **calculated_digest,
                                                  uint8_t **xattr_digest,
                                                  size_t *digest_len);


---------------------------------------------------------------

::

          selabel_get_digests_all_partial_matches() retrieves the
          file_contexts partial matches digest and the xattr digest that
          applies to the supplied path on the handle hnd.
          The key parameter is the path to retrieve the digests.
          The calculated_digest is a pointer to the key calculated
          file_contexts digest of all applicable partial matches, or NULL
          if none exist. The caller must free(3) the buffer.
          The xattr_digest is a pointer to the key xattr(7) stored digest,
          or NULL if it does not exist.  The caller must free(3) the
          buffer.
          The digest_len is the length of the digests that will always be
          returned (even if both are NULL). Note that if both digests are
          returned, they will always be the same length.


-----------------------------------------------------------------

::

          TRUE if the digests match or FALSE if they do not or either or
          both are missing.


---------------------------------------------------------

::

          selinux_restorecon(3), selabel_partial_match(3), selabel_open(3),
          selinux(8), selabel_file(5)

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

   SELinux API documentation     1s4elAapbreill_g2e0t1_9digests_all_partial_matches(3)

--------------

Pages that refer to this page:
`selinux_restorecon(3) <../man3/selinux_restorecon.3.html>`__

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
