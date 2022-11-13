.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fixfiles(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   fixfiles(8)                                                  fixfiles(8)

NAME
-------------------------------------------------

::

          fixfiles - fix file SELinux security contexts.


---------------------------------------------------------

::

          fixfiles [-v] [-F] [-M] [-f] relabel

          fixfiles [-v] [-F] { check | restore | verify } dir/file ...

          fixfiles [-v] [-F] [-B | -N time ] { check | restore | verify }

          fixfiles [-v] [-F] -R rpmpackagename[,rpmpackagename...] { check
          | restore | verify }

          fixfiles [-v] [-F] -C PREVIOUS_FILECONTEXT { check | restore |
          verify }

          fixfiles [-F] [-M] [-B] onboot


---------------------------------------------------------------

::

          This manual page describes the fixfiles script.

          This script is primarily used to correct the security context
          database (extended attributes) on filesystems.

          It can also be run at any time to relabel when adding support for
          new policy, or  just check whether the file contexts are all as
          you expect.  By default it will relabel all mounted ext2, ext3,
          ext4, gfs2, xfs, jfs and btrfs file systems as long as they do
          not have a security context mount option.  You can use the -R
          flag to use rpmpackages as an alternative.  The file
          /etc/selinux/fixfiles_exclude_dirs can contain a list of
          directories excluded from relabeling.

          fixfiles onboot will setup the machine to relabel on the next
          reboot.


-------------------------------------------------------

::

          -B     If specified with onboot, this fixfiles will record the
                 current date in the /.autorelabel file, so that it can be
                 used later to speed up labeling. If used with restore, the
                 restore will only affect files that were modified today.

          -F     Force reset of context to match file_context for
                 customizable files

          -f     Clear /tmp directory with out prompt for removal.

          -R rpmpackagename[,rpmpackagename...]
                 Use the rpm database to discover all files within the
                 specified packages and restore the file contexts.

          -C PREVIOUS_FILECONTEXT
                 Run a diff on  the PREVIOUS_FILECONTEXT file to the
                 currently installed one, and restore the context of all
                 affected files.

          -N time
                 Only act on files created after the specified date.  Date
                 must be specified in "YYYY-MM-DD HH:MM" format.  Date
                 field will be passed to find --newermt command.

          -M     Bind mount filesystems before relabeling them, this allows
                 fixing the context of files or directories that have been
                 mounted over.

          -v     Modify verbosity from progress to verbose. (Run restorecon
                 with -v instead of -p)


-----------------------------------------------------------

::

          One of:

          check | verify
                 print any incorrect file context labels, showing old and
                 new context, but do not change them.

          restore
                 change any incorrect file context labels.

          relabel
                 Prompt for removal of contents of /tmp directory and then
                 change any incorrect file context labels to match the
                 install file_contexts file.

          [[dir/file] ... ]
                 List of files or directories trees that you wish to check
                 file context on.


-----------------------------------------------------

::

          This man page was written by Richard Hally
          <rhally@mindspring.com>.  The script  was written by Dan Walsh
          <dwalsh@redhat.com>


---------------------------------------------------------

::

          setfiles(8), restorecon(8)

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

                                  2002031409                    fixfiles(8)

--------------

Pages that refer to this page:
`selinux_config(5) <../man5/selinux_config.5.html>`__, 
`restorecon(8) <../man8/restorecon.8.html>`__, 
`selinux(8) <../man8/selinux.8.html>`__

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
