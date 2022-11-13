.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

umad_get_port(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UMAD_GET_PORT(3)       OpenIB Programmer's Manual       UMAD_GET_PORT(3)

NAME
-------------------------------------------------

::

          umad_get_port, umad_release_port - open and close an InfiniBand
          port


---------------------------------------------------------

::

          #include <infiniband/umad.h>

          int umad_get_port(char *ca_name, int portnum, umad_port_t *port);

          int umad_release_port(umad_port_t *port);


---------------------------------------------------------------

::

          umad_get_port() fills the port structure with the IB port
          attributes specified by ca_name and portnum , or the default port
          if ca_name is NULL and portnum is zero. If only one of ca_name
          and portnum are specified, the other is used as a filter.  For
          example, passing a NULL ca_name and 2 for the portnum means get a
          port from any of the local IB devices, as long as it is the
          second port.  Note that the library may use some reference scheme
          to support port caching therefore umad_release_port() should be
          called before the port structure can be deallocated.  The
          argument port is an umad_port_t struct, as specified in
          <infiniband/umad.h>.

          typedef struct umad_port {
                  char ca_name[UMAD_CA_NAME_LEN];                 /* Name of the device */
                  int portnum;                                    /* Physical port number */
                  uint base_lid;                                  /* Base port LID */
                  uint lmc;                                       /* LMC of LID */
                  uint sm_lid;                                    /* SM LID */
                  uint sm_sl;                                     /* SM service level */
                  uint state;                                     /* Logical port state */
                  uint phys_state;                                /* Physical port state */
                  uint rate;                                      /* Port link bit rate */
                  uint64_t capmask;                               /* Port capabilities */
                  uint64_t gid_prefix;                            /* Gid prefix of this port */
                  uint64_t port_guid;                             /* GUID of this port */
          } umad_port_t;

          umad_release_port() releases the resources that were allocated by
          the umad_get_port() function for the specified IB port.


-----------------------------------------------------------------

::

          umad_get_port() and umad_release_port() return 0 on success, and
          a negative value on error.


-------------------------------------------------------

::

          Hal Rosenstock <halr@voltaire.com>

          Dotan Barak <dotanb@mellanox.co.il>

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

   OpenIB                        May 21, 2007              UMAD_GET_PORT(3)

--------------

Pages that refer to this page:
`umad_get_issm_path(3) <../man3/umad_get_issm_path.3.html>`__, 
`umad_open_port(3) <../man3/umad_open_port.3.html>`__

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
