.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfs4_getfacl(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `CONTACT <#CONTACT>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NFS4_GETFACL(1)        NFSv4 Access Control Lists        NFS4_GETFACL(1)

NAME
-------------------------------------------------

::

          nfs4_getfacl - get NFSv4 file/directory access control lists


---------------------------------------------------------

::

          nfs4_getfacl [-HR] file ...


---------------------------------------------------------------

::

          nfs4_getfacl will display the NFSv4 Access Control List (ACL) for
          the files given as arguments, provided they are on mounted NFSv4
          filesystems which support ACLs.

          If the -H/--more-help flag is specified, nfs4_getfacl will print
          some information about NFSv4 ACLs and the fields used in ACEs.

          If the -R/--recursive flag is specified, nfs4_getfacl will list
          the NFSv4 ACLs of all files and directories recursively.

          If the -c/--omit-header flag is specified, nfs4_getfacl will not
          display the comment header (Do not print filename).

          The output format for an NFSv4 file ACL, e.g., is:

                 # file: /somedir
                 A::OWNER@:rwatTnNcCy
                 A::alice@nfsdomain.org:rxtncy
                 A::bob@nfsdomain.org:rwadtTnNcCy
                 A:g:GROUP@:rtncy
                 D:g:GROUP@:waxTC
                 A::EVERYONE@:rtncy
                 D::EVERYONE@:waxTC

          In the example output above, the user `alice@nfsdomain.org' has
          the equivalent of "read" and "execute" permissions,
          `bob@nfsdomain.org' has "read" and "write", and both `GROUP@' and
          `EVERYONE@' have "read".

          The ACL listings of multiple files are separated by blank lines.

          Refer to the nfs4_acl(5) manpage for detailed information about
          NFSv4 ACL terminology and syntax.


-------------------------------------------------------

::

          nfs4_getfacl was written by people at CITI, the Center for
          Information Technology Integration (http://www.citi.umich.edu ).
          This manpage was written by David Richter.


-------------------------------------------------------

::

          Please send bug reports, feature requests, and comments to
          <linux-nfs@vger.kernel.org>.


---------------------------------------------------------

::

          nfs4_setfacl(1), nfs4_acl(5), RFC3530 (NFSv4.0), NFSv4.1 Minor
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

   Linux                  version 0.3.4, August 2018        NFS4_GETFACL(1)

--------------

Pages that refer to this page:
`nfs4_setfacl(1) <../man1/nfs4_setfacl.1.html>`__, 
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
