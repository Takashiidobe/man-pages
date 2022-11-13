.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

umad_register2(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `REGIS                            |                                   |
| TRATION ATTRIBUTE STRUCTURE <#REG |                                   |
| ISTRATION_ATTRIBUTE_STRUCTURE>`__ |                                   |
| \|                                |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UMAD_REGISTER2(3)      OpenIB Programmer's Manual      UMAD_REGISTER2(3)

NAME
-------------------------------------------------

::

          umad_register2 - register the specified management class and
          version for port


---------------------------------------------------------

::

          #include <infiniband/umad.h>

          int umad_register2(int port_fd, struct umad_reg_attr *attr, uint32_t *agent_id);


---------------------------------------------------------------

::

          umad_register2() registers for a MAD agent using the provided
          registration attributes

          port_fd the port on which to register the agent

          attr The registration attributes as defined by the structure
          passed.  See below for details of this structure.

          agent_id returned on success.  agent_id identifies the kernel MAD
          agent a MAD is received by or to be sent by.  agent_id is
          returned in the umad header "struct ib_user_mad" on recv and
          specified in umad_send when sending.


---------------------------------------------------------------------------------------------------------

::

          struct umad_reg_attr {
                  uint8_t    mgmt_class;
                  uint8_t    mgmt_class_version;
                  uint32_t   flags;
                  uint64_t   method_mask[2];
                  uint32_t   oui;
                  uint8_t    rmpp_version;
          };

          mgmt_class
          Management class to register for.

          mgmt_class_version
          Management class version to register for.

          flags
          Registration flags.  If a flag specified is not supported by the kernel,
          an error is returned, and the supported flags are returned in this field.

          Current flags are:
                  UMAD_USER_RMPP -- flag to indicate the kernel should not process
                  RMPP packets.  All RMPP packets will be treated like individual
                  MADs.  The user is responsible for implementing the RMPP
                  protocol.

          method_mask
          A bit mask which indicates which unsolicited methods this agent should
          receive.  Setting this array to 0 will result in the agent only
          receiving response MADs for which a request was sent.

          oui
          The oui (in host order) to use for vendor classes 0x30 - 0x4f.
          Otherwise ignored.

          rmpp_version
          If the class supports RMPP and kernel RMPP is enabled (the default)
          indicate which rmpp_version to use.


-----------------------------------------------------------------

::

          umad_register2() returns 0 on success and +ERRNO on failure.


---------------------------------------------------------

::

          umad_unregister(3)


-----------------------------------------------------

::

          Ira Weiny <ira.weiny@intel.com>

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

   OpenIB                       March 25, 2014            UMAD_REGISTER2(3)

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
