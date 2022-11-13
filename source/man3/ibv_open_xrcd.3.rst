.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_open_xrcd(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IBV_OPEN_XRCD(3)     Libibverbs Programmer's Manual     IBV_OPEN_XRCD(3)

NAME
-------------------------------------------------

::

          ibv_open_xrcd, ibv_close_xrcd - open or close an XRC protection
          domain (XRCDs)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_xrcd *ibv_open_xrcd(struct ibv_context *context,
                                         struct ibv_xrcd_init_attr *xrcd_init_attr);

          int ibv_close_xrcd(struct ibv_xrcd *xrcd);


---------------------------------------------------------------

::

          ibv_open_xrcd() open an XRC domain for the RDMA device context
          context xrcd_init_attr is an ibv_xrcd_init_attr struct, as
          defined in <infiniband/verbs.h>.

          struct ibv_xrcd_init_attr {
                  uint32_t         comp_mask;  /* Identifies valid fields */
                  int              fd;
                  int              oflag;

          fd is the file descriptor to associate with the XRCD.  oflag
          describes the desired creation attributes.  It is a bitwise OR of
          zero or more of the following flags:

          O_CREAT
                 Indicates that an XRCD should be created and associated
                 with the inode referenced by the given fd.  If the XRCD
                 exists, this flag has no effect except as noted under
                 O_EXCL below.

          O_EXCL If O_EXCL and O_CREAT are set, open will fail if an XRCD
                 associated with the inode exists.

          If fd equals -1, no inode is associated with the XRCD. To
          indicate that XRCD should be created, use oflag = O_CREAT.

          ibv_close_xrcd() closes the XRCD xrcd.  If this is the last
          reference, the XRCD will be destroyed.


-----------------------------------------------------------------

::

          ibv_open_xrcd() returns a pointer to the opened XRCD, or NULL if
          the request fails.

          ibv_close_xrcd() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------

::

          ibv_close_xrcd() may fail if any other resource is still
          associated with the XRCD being closed.


---------------------------------------------------------

::

          ibv_create_srq_ex(3), ibv_create_qp_ex(3),


-------------------------------------------------------

::

          Sean Hefty <sean.hefty@intel.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the rdma-core (RDMA Core Userspace Libraries
          and Daemons) project.  Information about the project can be found
          at ⟨https://github.com/linux-rdma/rdma-core⟩.  If you have a bug
          report for this manual page, send it to
          linux-rdma@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/linux-rdma/rdma-core.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-18.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   libibverbs                     2011-06-17               IBV_OPEN_XRCD(3)

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
