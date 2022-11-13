.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage_node(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `Record API O                     |                                   |
| verview <#Record_API_Overview>`__ |                                   |
| \|                                |                                   |
| `Properties API Overv             |                                   |
| iew <#Properties_API_Overview>`__ |                                   |
| \|                                |                                   |
| `Record Store API Overvie         |                                   |
| w <#Record_Store_API_Overview>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   semanage_node(3)      Libsemanage API documentation     semanage_node(3)

NAME
-------------------------------------------------

::

          semanage_node - SELinux Network Nodes Management API


---------------------------------------------------------

::

          #include <semanage/node_record.h>
          #include <semanage/nodes_policy.h>
          #include <semanage/nodes_local.h>

          This object contains properties associated with a network node.

          For details on a specific function, see its manual page.


-------------------------------------------------------------------------------

::

          semanage_node_create(3)-
                 create a node

          semanage_node_free(3)-
                 release resources for this node

          semanage_node_key_create(3)-
                 create a key, which can be used to identify a node

          semanage_node_key_free(3)-
                 release resources for this node key

          semanage_node_key_extract(3)-
                 create a key matching this node

          semanage_node_clone(3)-
                 create an identical node (deep-copy clone)

          semanage_node_compare(3)-
                 compare this node to the provided key

          semanage_node_compare2(3)-
                 compare this node to another


---------------------------------------------------------------------------------------

::

          semanage_node_get_addr(3)-
                 return the IP address of this node in string
                 representation

          semanage_node_set_addr(3)-
                 set the IP address of this node from the provided string
                 representation and protocol

          semanage_node_get_addr_bytes(3)-
                 return the IP address of this node as a byte array in
                 network byte order

          semanage_node_set_addr_bytes(3)-
                 set the IP address of this node from the provided byte
                 array in network byte order

          semanage_node_get_mask(3)-
                 return the IP mask of this node in string representation

          semanage_node_set_mask(3)-
                 set the IP mask of this node from the provided string
                 representation and protocol version

          semanage_node_get_mask_bytes(3)-
                 return the IP mask of this node as a byte array in network
                 byte order

          semanage_node_set_mask_bytes(3)-
                 set the IP mask of this node from the provided byte array
                 in network byte order

          semanage_node_get_proto(3)-
                 return the IP protocol version for this node

          semanage_node_get_proto_str(3)-
                 return a string representation of the given node protocol

          semanage_node_set_proto(3)-
                 set the IP protocol version for this node

          semanage_node_get_con(3)-
                 return the SELinux context associated with this node

          semanage_node_set_con(3)-
                 set the SELinux context associated with this node


-------------------------------------------------------------------------------------------

::

          semanage_node_modify_local(3)-
                 add or update an interface in the local store

          semanage_node_del_local(3)-
                 delete an interface from the local store

          semanage_node_exists(3)-
                 check if an interface is defined in the persistent policy

          semanage_node_exists_local(3)-
                 check if an interface is defined in the local store

          semanage_node_query(3)-
                 query an interface in the persistent policy

          semanage_node_query_local(3)-
                 query an interface in the local store

          semanage_node_count(3)-
                 count the number of nodes defined in the persistent policy

          semanage_node_count_local(3)-
                 count the number of nodes defined in the local store

          semanage_node_iterate(3)-
                 execute a callback for each interface in the persistent
                 policy

          semanage_node_iterate_local(3)-
                 execute a callback for each interface in the local store

          semanage_node_list(3)-
                 return an array containing all nodes in the persistent
                 policy

          semanage_node_list_local(3)-
                 return an array containing all nodes in the local store

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

   ivg2@cornell.edu              16 March 2006             semanage_node(3)

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
