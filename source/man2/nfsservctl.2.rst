.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsservctl(2) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NFSSERVCTL(2)           Linux Programmer's Manual          NFSSERVCTL(2)

NAME
-------------------------------------------------

::

          nfsservctl - syscall interface to kernel nfs daemon


---------------------------------------------------------

::

          #include <linux/nfsd/syscall.h>

          long nfsservctl(int cmd, struct nfsctl_arg *argp,
                          union nfsctl_res *resp);


---------------------------------------------------------------

::

          Note: Since Linux 3.1, this system call no longer exists.  It has
          been replaced by a set of files in the nfsd filesystem; see
          nfsd(7).

              /*
               * These are the commands understood by nfsctl().
               */
              #define NFSCTL_SVC        0  /* This is a server process. */
              #define NFSCTL_ADDCLIENT  1  /* Add an NFS client. */
              #define NFSCTL_DELCLIENT  2  /* Remove an NFS client. */
              #define NFSCTL_EXPORT     3  /* Export a filesystem. */
              #define NFSCTL_UNEXPORT   4  /* Unexport a filesystem. */
              #define NFSCTL_UGIDUPDATE 5  /* Update a client's UID/GID map
                                              (only in Linux 2.4.x and earlier). */
              #define NFSCTL_GETFH      6  /* Get a file handle (used by mountd)
                                              (only in Linux 2.4.x and earlier). */

              struct nfsctl_arg {
                  int                       ca_version;     /* safeguard */
                  union {
                      struct nfsctl_svc     u_svc;
                      struct nfsctl_client  u_client;
                      struct nfsctl_export  u_export;
                      struct nfsctl_uidmap  u_umap;
                      struct nfsctl_fhparm  u_getfh;
                      unsigned int          u_debug;
                  } u;
              }

              union nfsctl_res {
                      struct knfs_fh          cr_getfh;
                      unsigned int            cr_debug;
              };


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


---------------------------------------------------------

::

          This system call was removed from the Linux kernel in version
          3.1.  Library support was removed from glibc in version 2.28.


-------------------------------------------------------------------

::

          This call is Linux-specific.


---------------------------------------------------------

::

          nfsd(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  NFSSERVCTL(2)

--------------

Pages that refer to this page:
`syscalls(2) <../man2/syscalls.2.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/nfsservctl.2.license.html>`__

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
