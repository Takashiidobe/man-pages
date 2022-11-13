.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_set_option(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA_SET_OPTION(3)    Librdmacm Programmer's Manual   RDMA_SET_OPTION(3)

NAME
-------------------------------------------------

::

          rdma_set_option - Set communication options for an rdma_cm_id.


---------------------------------------------------------

::

          #include <rdma/rdma_cma.h>

          int rdma_set_option (struct rdma_cm_id *id, int level, int
          optname, void *optval, size_t optlen);


-----------------------------------------------------------

::

          id          RDMA identifier.

          level       Protocol level of the option to set.

          optname     Name of the option, relative to the level, to set.

          optval      Reference to the option data.  The data is dependent
                      on the level and optname.

          optlen      The size of the %optval buffer.


---------------------------------------------------------------

::

          Sets communication options for an rdma_cm_id.  This call is used
          to override the default system settings.

          optname can be one of

          RDMA_OPTION_ID_TOS
                      Specify the quality of service provided by a
                      connection.  The expected optlen is size of uint8_t.

          RDMA_OPTION_ID_REUSEADDR
                      Bound the rdma_cm_id to a reuseable address. This
                      will allow other users to bind to that same address.
                      The expected optlen is size of int.

          RDMA_OPTION_ID_AFONLY
                      Set IPV6_V6ONLY socket.  The expected optlen is size
                      of int.

          RDMA_OPTION_IB_PATH
                      Set IB path record data.  The expected optlen is size
                      of struct ibv_path_data[].

          RDMA_OPTION_ID_ACK_TIMEOUT
                      Set QP ACK timeout.  The value calculated according
                      to the formula 4.096 * 2^(ack_timeout) usec.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error.  If an error occurs, errno
          will be set to indicate the failure reason.


---------------------------------------------------

::

          Option details may be found in the relevant header files.


---------------------------------------------------------

::

          rdma_create_id(3)

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

   librdmacm                      2007-08-06             RDMA_SET_OPTION(3)

--------------

Pages that refer to this page:
`rdma_create_id(3) <../man3/rdma_create_id.3.html>`__, 
`rdma_cm(7) <../man7/rdma_cm.7.html>`__

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
