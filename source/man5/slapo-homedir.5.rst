.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-homedir(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `REPLICATION <#REPLICATION>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO-HOMEDIR(5)           File Formats Manual          SLAPO-HOMEDIR(5)

NAME
-------------------------------------------------

::

          slapo-homedir - Home directory provisioning overlay


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          The homedir overlay causes slapd(8) to notice changes involving
          RFC-2307bis style user-objects and make appropriate changes to
          the local filesystem.  This can be performed on both master and
          replica systems, so it is possible to perform remote home
          directory provisioning.


-------------------------------------------------------------------

::

          Both slapd.conf and back-config style configuration is supported.

          overlay homedir
                 This directive adds the homedir overlay to the current
                 database, or to the frontend, if used before any database
                 instantiation; see slapd.conf(5) for details.

          homedir-skeleton-path <pathname>

          olcSkeletonPath: pathname
                 These options set the path to the skeleton account
                 directory.  (Generally, /etc/skel) Files in this directory
                 will be copied into newly created home directories.
                 Copying is recursive and handles symlinks and fifos, but
                 will skip most specials.

          homedir-min-uidnumber <user id number>

          olcMinimumUidNumber: number
                 These options configure the minimum userid to use in any
                 home directory attempt.  This is a basic safety measure to
                 prevent accidentally using system accounts.  See
                 REPLICATION for more flexible options for selecting
                 accounts.

          homedir-regexp <regexp> <path>

          olcHomedirRegexp: regexp path
                 These options configure a set of regular expressions to
                 use for matching and optionally remapping incoming
                 homeDirectory attribute values to pathnames on the local
                 filesystem.  $number expansion is supported to access
                 values captured in parentheses.

                 For example, to accept any directory starting with home
                 and use it verbatim on the local filesystem:

                 homedir-regexp ^(/home/[-_/a-z0-9]+)$ $1

                 To match the same set of directories, but create them
                 instead under exporthome, as is popular on Solaris NFS
                 servers:

                 homedir-regexp ^(/home/[-_/a-z0-9]+)$ /export$1

          homedir-delete-style style

          olcHomedirDeleteStyle: style
                 These options configure how deletes of posixAccount
                 entries or their attributes are handled; valid styles are
                 IGNORE, which does nothing, and DELETE, which immediately
                 performs a recursive delete on the home directory, and
                 ARCHIVE, which archives the home directory contents in a
                 TAR file for later examination.  The default is IGNORE.
                 Use with caution.  ARCHIVE requires homedir-archive-path
                 to be set, or it functions similar to IGNORE.

          homedir-archive-path <pathname>

          olcArchivePath: pathname
                 These options specify the destination path for TAR files
                 created by the ARCHIVE delete style.


---------------------------------------------------------------

::

          The homedir overlay can operate on either master or replica
          systems with no changes.  See slapd.conf(5) or slapd-config(5)
          for more information on configure syncrepl.

          Partial replication (e.g. with filters) is especially useful for
          providing different provisioning options to different sets of
          users.


-------------------------------------------------

::

          DELETE, MOD, and MODRDN operations that remove the unix
          attributes when delete style is set to DELETE will recursively
          delete the (regex modified) home directory from the disk.  Please
          be careful when deleting or changing values.

          MOD and MODRDN will correctly respond to homeDirectory changes
          and perform a non-destructive rename() operation on the
          filesystem, but this does not correctly retry with a recursive
          copy when moving between filesystems.

          The recursive copy/delete/chown/tar functions are not aware of
          ACLs, extended attributes, forks, sparse files, or hard links.
          Block and character device archival is non-portable, but should
          not be an issue in home directories, hopefully.

          Copying and archiving may not support files larger than 2GiB on
          some architectures.  Bare POSIX UStar archives cannot support
          internal files larger than 8GiB.  The current tar generator does
          not attempt to resolve uid/gid into symbolic names.

          No attempt is made to try to mkdir() the parent directories
          needed for a given home directory or archive path.


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file

          /etc/skel (or similar)
                 source of new homedir files.


---------------------------------------------------------

::

          slapd.conf(5), slapd-config(5), slapd(8), RFC-2307, RFC-2307bis.


-------------------------------------------------------------------------

::

          This module was written in 2009 by Emily Backes for Symas
          Corporation.

COLOPHON
---------------------------------------------------------

::

          This page is part of the OpenLDAP (an open source implementation
          of the Lightweight Directory Access Protocol) project.
          Information about the project can be found at 
          ⟨http://www.openldap.org/⟩.  If you have a bug report for this
          manual page, see ⟨http://www.openldap.org/its/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.openldap.org/openldap/openldap.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   OpenLDAP LDVERSION             RELEASEDATE              SLAPO-HOMEDIR(5)

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
