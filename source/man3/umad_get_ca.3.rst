.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

umad_get_ca(3) — Linux manual page
==================================

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

   UMAD_GET_CA(3)         OpenIB Programmer's Manual         UMAD_GET_CA(3)

NAME
-------------------------------------------------

::

          umad_get_ca, umad_release_ca - get and release InfiniBand device
          port attributes


---------------------------------------------------------

::

          #include <infiniband/umad.h>

          int umad_get_ca(char *ca_name, umad_ca_t *ca);

          int umad_release_ca(umad_ca_t *ca);


---------------------------------------------------------------

::

          umad_get_ca() gets the attributes of the InfiniBand device
          ca_name.  It fills the ca structure with the device attributes
          specified by the ca_name or with the default device attributes if
          ca_name is NULL.  umad_release_ca() should be called before the
          ca structure is deallocated.  The argument ca is an umad_ca_t
          struct, as specified in <infiniband/umad.h>.

          typedef struct umad_ca {
                  char ca_name[UMAD_CA_NAME_LEN];                 /* Name of the device */
                  uint node_type;                                 /* Type of the device */
                  int numports;                                   /* Number of physical ports */
                  char fw_ver[20];                                /* FW version */
                  char ca_type[40];                               /* CA type (e.g. MT23108, etc.) */
                  char hw_ver[20];                                /* Hardware version */
                  uint64_t node_guid;                             /* Node GUID */
                  uint64_t system_guid;                           /* System image GUID */
                  umad_port_t *ports[UMAD_CA_MAX_PORTS];          /* Array of device port properties */
          } umad_ca_t;

          umad_release_ca() releases the resources that were allocated in
          the function umad_get_ca().


-----------------------------------------------------------------

::

          umad_get_ca() and umad_release_ca() return 0 on success, and a
          negative value on error.


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

   OpenIB                        May 21, 2007                UMAD_GET_CA(3)

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
