.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selinux_restorecon(3) — Linux manual page
=========================================

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

   selinux_restorecon(3)   SELinux API documentation  selinux_restorecon(3)

NAME
-------------------------------------------------

::

          selinux_restorecon - restore file(s) default SELinux security
          contexts


---------------------------------------------------------

::

          #include <selinux/restorecon.h>

          int selinux_restorecon(const char *pathname,
                                 unsigned int restorecon_flags);


---------------------------------------------------------------

::

          selinux_restorecon() restores file default security contexts on
          filesystems that support extended attributes (see xattr(7)),
          based on:

                 pathname containing a directory or file to be relabeled.
                 If this is a directory and the restorecon_flags
                 SELINUX_RESTORECON_RECURSE has been set (for descending
                 through directories), then selinux_restorecon() will write
                 an SHA1 digest of specfile entries calculated by
                 selabel_get_digests_all_partial_matches(3) to an extended
                 attribute of security.sehash once the relabeling has been
                 completed successfully (see the NOTES section for
                 details).
                 These digests will be checked should selinux_restorecon()
                 be rerun with the restorecon_flags
                 SELINUX_RESTORECON_RECURSE flag set. If any of the
                 specfile entries had been updated, the digest will also be
                 updated. However if the digest is the same, no relabeling
                 checks will take place.
                 The restorecon_flags that can be used to manage the usage
                 of the SHA1 digest are:
                        SELINUX_RESTORECON_SKIP_DIGEST
                        SELINUX_RESTORECON_IGNORE_DIGEST

                 restorecon_flags contains the labeling option/rules as
                 follows:

                        SELINUX_RESTORECON_SKIP_DIGEST Do not check or
                        update any extended attribute security.sehash
                        entries.

                        SELINUX_RESTORECON_IGNORE_DIGEST force the checking
                        of labels even if the stored SHA1 digest matches
                        the specfile entries SHA1 digest. The specfile
                        entries digest will be written to the
                        security.sehash extended attribute once relabeling
                        has been completed successfully provided the
                        SELINUX_RESTORECON_NOCHANGE flag has not been set.

                        SELINUX_RESTORECON_NOCHANGE don't change any file
                        labels (passive check) or update the digest in the
                        security.sehash extended attribute.

                        SELINUX_RESTORECON_SET_SPECFILE_CTX If set, reset
                        the files label to match the default specfile
                        context.  If not set only reset the files "type"
                        component of the context to match the default
                        specfile context.

                        SELINUX_RESTORECON_RECURSE change file and
                        directory labels recursively (descend directories)
                        and if successful write an SHA1 digest of the
                        specfile entries to an extended attribute as
                        described in the NOTES section.

                        SELINUX_RESTORECON_VERBOSE log file label changes.
                               Note that if SELINUX_RESTORECON_VERBOSE and
                               SELINUX_RESTORECON_PROGRESS flags are set,
                               then SELINUX_RESTORECON_PROGRESS will take
                               precedence.

                        SELINUX_RESTORECON_PROGRESS show progress by
                        outputting the number of files in 1k blocks
                        processed to stdout. If the
                        SELINUX_RESTORECON_MASS_RELABEL flag is also set
                        then the approximate percentage complete will be
                        shown.

                        SELINUX_RESTORECON_MASS_RELABEL generally set when
                        relabeling the entire OS, that will then show the
                        approximate percentage complete. The
                        SELINUX_RESTORECON_PROGRESS flag must also be set.

                        SELINUX_RESTORECON_REALPATH convert passed-in
                        pathname to the canonical pathname using
                        realpath(3).

                        SELINUX_RESTORECON_XDEV prevent descending into
                        directories that have a different device number
                        than the pathname entry from which the descent
                        began.

                        SELINUX_RESTORECON_ADD_ASSOC attempt to add an
                        association between an inode and a specification.
                        If there is already an association for the inode
                        and it conflicts with the specification, then use
                        the last matching specification.

                        SELINUX_RESTORECON_ABORT_ON_ERROR abort on errors
                        during the file tree walk.

                        SELINUX_RESTORECON_SYSLOG_CHANGES log any label
                        changes to syslog(3).

                        SELINUX_RESTORECON_LOG_MATCHES log what specfile
                        context matched each file.

                        SELINUX_RESTORECON_IGNORE_NOENTRY ignore files that
                        do not exist.

                        SELINUX_RESTORECON_IGNORE_MOUNTS do not read
                        /proc/mounts to obtain a list of non-seclabel
                        mounts to be excluded from relabeling checks.
                        Setting SELINUX_RESTORECON_IGNORE_MOUNTS is useful
                        where there is a non-seclabel fs mounted with a
                        seclabel fs mounted on a directory below this.

                        SELINUX_RESTORECON_CONFLICT_ERROR to treat
                        conflicting specifications, such as where two
                        hardlinks for the same inode have different
                        contexts, as errors.

                 The behavior regarding the checking and updating of the
                 SHA1 digest described above is the default behavior. It is
                 possible to change this by first calling selabel_open(3)
                 and not enabling the SELABEL_OPT_DIGEST option, then
                 calling selinux_restorecon_set_sehandle(3) to set the
                 handle to be used by selinux_restorecon(3).

                 If the pathname is a directory path, then it is possible
                 to set directories to be excluded from the path by calling
                 selinux_restorecon_set_exclude_list(3) with a NULL
                 terminated list before calling selinux_restorecon(3).

                 By default selinux_restorecon(3) reads /proc/mounts to
                 obtain a list of non-seclabel mounts to be excluded from
                 relabeling checks unless the
                 SELINUX_RESTORECON_IGNORE_MOUNTS flag has been set.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned and errno
          is set appropriately.


---------------------------------------------------

::

          1.  To improve performance when relabeling file systems
              recursively (e.g. the restorecon_flags
              SELINUX_RESTORECON_RECURSE flag is set) selinux_restorecon()
              will write a calculated SHA1 digest of the specfile entries
              returned by selabel_get_digests_all_partial_matches(3) to an
              extended attribute named security.sehash for each directory
              in the pathname path.

          2.  To check the extended attribute entry use getfattr(1), for
              example:

                     getfattr -e hex -n security.sehash /

          3.  Should any of the specfile entries have changed, then when
              selinux_restorecon() is run again with the
              SELINUX_RESTORECON_RECURSE flag set, new SHA1 digests will be
              calculated and all files automatically relabeled depending on
              the settings of the SELINUX_RESTORECON_SET_SPECFILE_CTX flag
              (provided SELINUX_RESTORECON_NOCHANGE is not set).

          4.  /sys and in-memory filesystems do not support the
              security.sehash extended attribute and are automatically
              excluded from any relabeling checks.

          5.  By default stderr is used to log output messages and errors.
              This may be changed by calling selinux_set_callback(3) with
              the SELINUX_CB_LOG type option.


---------------------------------------------------------

::

          selabel_get_digests_all_partial_matches(3),
          selinux_restorecon_set_sehandle(3),
          selinux_restorecon_default_handle(3),
          selinux_restorecon_set_exclude_list(3),
          selinux_restorecon_set_alt_rootpath(3),
          selinux_restorecon_xattr(3),
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

   Security Enhanced Linux        20 Oct 2015         selinux_restorecon(3)

--------------

Pages that refer to this page:
`selabel_get_digests_all_partial_matches(3) <../man3/selabel_get_digests_all_partial_matches.3.html>`__, 
`selinux_restorecon(3) <../man3/selinux_restorecon.3.html>`__, 
`selinux_restorecon_default_handle(3) <../man3/selinux_restorecon_default_handle.3.html>`__, 
`selinux_restorecon_set_alt_rootpath(3) <../man3/selinux_restorecon_set_alt_rootpath.3.html>`__, 
`selinux_restorecon_set_exclude_list(3) <../man3/selinux_restorecon_set_exclude_list.3.html>`__, 
`selinux_restorecon_set_sehandle(3) <../man3/selinux_restorecon_set_sehandle.3.html>`__, 
`selinux_restorecon_xattr(3) <../man3/selinux_restorecon_xattr.3.html>`__, 
`restorecon(8) <../man8/restorecon.8.html>`__, 
`setfiles(8) <../man8/setfiles.8.html>`__

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
