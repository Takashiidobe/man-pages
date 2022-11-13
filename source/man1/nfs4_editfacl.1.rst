.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfs4_setfacl(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PERMISSIONS                      |                                   |
| ALIASES <#PERMISSIONS_ALIASES>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `CONTACT <#CONTACT>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NFS4_SETFACL(1)        NFSv4 Access Control Lists        NFS4_SETFACL(1)

NAME
-------------------------------------------------

::

          nfs4_setfacl, nfs4_editfacl - manipulate NFSv4 file/directory
          access control lists


---------------------------------------------------------

::

          nfs4_setfacl [OPTIONS] COMMAND file...
          nfs4_editfacl [OPTIONS] file...


---------------------------------------------------------------

::

          nfs4_setfacl manipulates the NFSv4 Access Control List (ACL) of
          one or more files (or directories), provided they are on a
          mounted NFSv4 filesystem which supports ACLs.

          nfs4_editfacl is equivalent to nfs4_setfacl -e.

          Refer to the nfs4_acl(5) manpage for information about NFSv4 ACL
          terminology and syntax.

      COMMANDS
          -a acl_spec [index]
                 add the ACEs from acl_spec to file's ACL.  ACEs are
                 inserted starting at the indexth position (DEFAULT: 1) of
                 file's ACL.

          -A acl_file [index]
                 add the ACEs from the acl_spec in acl_file to file's ACL.
                 ACEs are inserted starting at the indexth position
                 (DEFAULT: 1) of file's ACL.

          -x acl_spec | index
                 delete ACEs matched from acl_spec - or delete the indexth
                 ACE - from file's ACL.  Note that the ordering of the ACEs
                 in acl_spec does not matter.

          -X acl_file
                 delete ACEs matched from the acl_spec in acl_file from
                 file's ACL.  Note that the ordering of the ACEs in the
                 acl_spec does not matter.

          -s acl_spec
                 set file's ACL to acl_spec.

          -S acl_file
                 set file's ACL to the acl_spec in acl_file.

          -e, --edit
                 edit file's ACL in the editor defined in the EDITOR
                 environment variable (DEFAULT: vi(1)) and set the
                 resulting ACL upon a clean exit, assuming changes made in
                 the editor were saved.  Note that if multiple files are
                 specified, the editor will be serially invoked once per
                 file.

          -m from_ace to_ace
                 modify file's ACL in-place by replacing from_ace with
                 to_ace.

          -?, -h, --help
                 display help text and exit.

          --version
                 display this program's version and exit.

          NOTE: if '-' is given as the acl_file with the -A/-X/-S flags,
          the acl_spec will be read from stdin.

      OPTIONS
          -R, --recursive
                 recursively apply to a directory's files and
                 subdirectories.  Similar to setfacl(1), the default
                 behavior is to follow symlinks given on the command line
                 and to skip symlinks encountered while recursing through
                 directories.

          -L, --logical
                 in conjunction with -R/--recursive, a logical walk follows
                 all symbolic links.

          -P, --physical
                 in conjunction with -R/--recursive, a physical walk skips
                 all symbolic links.

          --test
                 display results of COMMAND, but do not save changes.


-------------------------------------------------------------------------------

::

          With nfs4_setfacl, one can use simple abbreviations ("aliases")
          to express generic "read" (R), generic "write" (W), and generic
          "execute" (X) permissions, familiar from the POSIX mode bits used
          by, e.g., chmod(1).  To use these aliases, one can put them in
          the permissions field of an NFSv4 ACE and nfs4_setfacl will
          convert them: an R is expanded to rntcy, a W is expanded to
          watTNcCy (with D added to directory ACEs), and an X is expanded
          to xtcy.  Please refer to the nfs4_acl(5) manpage for information
          on specific NFSv4 ACE permissions.

          For example, if one wanted to grant generic "read" and "write"
          access on a file, the NFSv4 permissions field would normally
          contain something like rwatTnNcCy.  Instead, one might use
          aliases to accomplish the same goal with RW.

          The two permissions not included in any of the aliases are d
          (delete) and o (write-owner).  However, they can still be used:
          e.g., a permissions field consisting of Wdo expresses generic
          "write" access as well as the ability to delete and change
          ownership.


---------------------------------------------------------

::

          Assume that the file `foo' has the following NFSv4 ACL for the
          following examples:

                 A::OWNER@:rwatTnNcCy
                 D::OWNER@:x
                 A:g:GROUP@:rtncy
                 D:g:GROUP@:waxTC
                 A::EVERYONE@:rtncy
                 D::EVERYONE@:waxTC

          - add ACE granting `alice@nfsdomain.org' generic "read" and
            "execute" access (defaults to prepending ACE to ACL):
                 $ nfs4_setfacl -a A::alice@nfsdomain.org:rxtncy foo

          - add the same ACE as above, but using aliases:
                 $ nfs4_setfacl -a A::alice@nfsdomain.org:RX foo

          - edit existing ACL in a text editor and set modified ACL on
            clean save/exit:
                 $ nfs4_setfacl -e foo

          - set ACL (overwrites original) to contents of a spec_file named
            `newacl.txt':
                 $ nfs4_setfacl -S newacl.txt foo

          - recursively set the ACLs of all files and subdirectories in the
            current directory, skipping all symlinks encountered, to the
            ACL contained in the spec_file named `newacl.txt':
                 $ nfs4_setfacl -R -P -S newacl.txt *

          - delete the first ACE, but only print the resulting ACL (does
            not save changes):
                 $ nfs4_setfacl --test -x 1 foo

          - delete the last two ACEs above:
                 $ nfs4_setfacl -x A::EVERYONE@rtncy,D::EVERYONE@:waxTC foo

          - modify (in-place) the second ACE above:
                 $ nfs4_setfacl -m D::OWNER@:x  D::OWNER@:xo foo

          - set ACLs of `bar' and `frobaz' to ACL of `foo':
                 $ nfs4_getfacl foo | nfs4_setfacl -S - bar frobaz


-------------------------------------------------------

::

          nfs4_setfacl was written by people at CITI, the Center for
          Information Technology Integration (http://www.citi.umich.edu ).
          This manpage was written by David Richter.


-------------------------------------------------------

::

          Please send bug reports, feature requests, and comments to
          <nfsv4@linux-nfs.org>.


---------------------------------------------------------

::

          nfs4_getfacl(1), nfs4_acl(5), RFC3530 (NFSv4.0), NFSv4.1 Minor
          Version Draft.

COLOPHON
---------------------------------------------------------

::

          This page is part of the nfs4-acl-tools (NFSv4 ACL tools)
          project.  Information about the project can be found at 
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, see
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨git://git.linux-nfs.org/projects/bfields/nfs4-acl-tools.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2020-06-04.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Linux                  version 0.3.4, August 2018        NFS4_SETFACL(1)

--------------

Pages that refer to this page:
`nfs4_getfacl(1) <../man1/nfs4_getfacl.1.html>`__, 
`nfs4_acl(5) <../man5/nfs4_acl.5.html>`__

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
