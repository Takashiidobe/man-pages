.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selinux_restorecon_xattr(3) — Linux manual page
===============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   selinux_restorecon_xattr(3)inux API documentationnux_restorecon_xattr(3)

NAME
-------------------------------------------------

::

          selinux_restorecon_xattr - manage default security.sehash
          extended attribute entries added by selinux_restorecon(3),
          setfiles(8) or restorecon(8).


---------------------------------------------------------

::

          #include <selinux/restorecon.h>

          int selinux_restorecon_xattr(const char *pathname,
                                 unsigned int xattr_flags,
                                 struct dir_xattr ***xattr_list);


---------------------------------------------------------------

::

          selinux_restorecon_xattr() returns a linked list of dir_xattr
          structures containing information described below based on:

                 pathname containing a directory tree to be searched for
                 security.sehash extended attribute entries.

                 xattr_flags contains options as follows:

                        SELINUX_RESTORECON_XATTR_RECURSE recursively
                        descend directories.

                        SELINUX_RESTORECON_XATTR_DELETE_NONMATCH_DIGESTS
                        delete non-matching digests from each directory in
                        pathname.

                        SELINUX_RESTORECON_XATTR_DELETE_ALL_DIGESTS delete
                        all digests from each directory in pathname.

                        SELINUX_RESTORECON_XATTR_IGNORE_MOUNTS do not read
                        /proc/mounts to obtain a list of non-seclabel
                        mounts to be excluded from the search.
                        Setting SELINUX_RESTORECON_XATTR_IGNORE_MOUNTS is
                        useful where there is a non-seclabel fs mounted
                        with a seclabel fs mounted on a directory below
                        this.

                 xattr_list is the returned pointer to a linked list of
                 dir_xattr structures, each containing the following
                 information:

                        struct dir_xattr {
                            char *directory;
                            char *digest;    /* Printable hex encoded string */
                            enum digest_result result;
                            struct dir_xattr *next;
                        };

                 The result entry is enumerated as follows:
                        enum digest_result {
                            MATCH = 0,
                            NOMATCH,
                            DELETED_MATCH,
                            DELETED_NOMATCH,
                            ERROR
                        };

                 xattr_list must be set to NULL before calling
                 selinux_restorecon_xattr(3).  The caller is responsible
                 for freeing the returned xattr_list entries in the linked
                 list.

          See the NOTES section for more information.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned and errno
          is set appropriately.


---------------------------------------------------

::

          1.  By default selinux_restorecon_xattr(3) will use the default
              set of specfiles described in files_contexts(5) to calculate
              the SHA1 digests to be used for comparison.  To change this
              default behavior selabel_open(3) must be called specifying
              the required SELABEL_OPT_PATH and setting the
              SELABEL_OPT_DIGEST option to a non-NULL value.
              selinux_restorecon_set_sehandle(3) is then called to set the
              handle to be used by selinux_restorecon_xattr(3).

          2.  By default selinux_restorecon_xattr(3) reads /proc/mounts to
              obtain a list of non-seclabel mounts to be excluded from
              searches unless the SELINUX_RESTORECON_XATTR_IGNORE_MOUNTS
              flag has been set.

          3.  RAMFS and TMPFS filesystems do not support the
              security.sehash extended attribute and are automatically
              excluded from searches.

          4.  By default stderr is used to log output messages and errors.
              This may be changed by calling selinux_set_callback(3) with
              the SELINUX_CB_LOG type option.


---------------------------------------------------------

::

          selinux_restorecon(3)
          selinux_restorecon_set_sehandle(3),
          selinux_restorecon_default_handle(3),
          selinux_restorecon_set_exclude_list(3),
          selinux_restorecon_set_alt_rootpath(3),
          selinux_set_callback(3)

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

                                 30 July 2016   selinux_restorecon_xattr(3)

--------------

Pages that refer to this page:
`selinux_restorecon(3) <../man3/selinux_restorecon.3.html>`__, 
`selinux_restorecon_default_handle(3) <../man3/selinux_restorecon_default_handle.3.html>`__, 
`selinux_restorecon_set_alt_rootpath(3) <../man3/selinux_restorecon_set_alt_rootpath.3.html>`__, 
`selinux_restorecon_set_exclude_list(3) <../man3/selinux_restorecon_set_exclude_list.3.html>`__, 
`selinux_restorecon_set_sehandle(3) <../man3/selinux_restorecon_set_sehandle.3.html>`__, 
`selinux_restorecon_xattr(3) <../man3/selinux_restorecon_xattr.3.html>`__

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
