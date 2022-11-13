.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage_port(3) — Linux manual page
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

   semanage_port(3)      Libsemanage API documentation     semanage_port(3)

NAME
-------------------------------------------------

::

          semanage_port - SELinux Network Ports Management API


---------------------------------------------------------

::

          #include <semanage/port_record.h>
          #include <semanage/ports_policy.h>
          #include <semanage/ports_local.h>

          This object contains properties associated with a range of
          network ports.

          For details on a specific function, see its manual page.


-------------------------------------------------------------------------------

::

          semanage_port_create(3)-
                 create a port range

          semanage_port_free(3)-
                 release resources for this port range

          semanage_port_key_create(3)-
                 create a key, which can be used to identify a port range

          semanage_port_key_free(3)-
                 release resources for this port range key

          semanage_port_key_extract(3)-
                 create a key matching this port range

          semanage_port_clone(3)-
                 create an identical port range (deep-copy clone)

          semanage_port_compare(3)-
                 compare this port range to the provided key

          semanage_port_compare2(3)-
                 compare this port range to another


---------------------------------------------------------------------------------------

::

          semanage_port_get_proto(3)-
                 return the protocol for this port range

          semanage_port_get_proto_str(3)-
                 return a string representation of the given port protocol

          semanage_port_set_proto(3)-
                 set the protocol for this port range

          semanage_port_get_low(3)-
                 return the low port number for this port range

          semanage_port_get_high(3)-
                 return the high port number for this port range

          semanage_port_set_port(3)-
                 set the port number (same low and high) for this port
                 range

          semanage_port_set_range(3)-
                 set the low and high port number for this port range

          semanage_port_get_con(3)-
                 return the SELinux context for this port range

          semanage_port_set_con(3)-
                 set the SELinux context for this port range


-------------------------------------------------------------------------------------------

::

          semanage_port_modify_local(3)-
                 add or update a port range in the local store

          semanage_port_del_local(3)-
                 delete a port range from the local store

          semanage_port_exists(3)-
                 check if a port range is defined in the persistent policy

          semanage_port_exists_local(3)-
                 check if a port range is defined in the local store

          semanage_port_query(3)-
                 query a port range in the persistent policy

          semanage_port_query_local(3)-
                 query a port range in the local store

          semanage_port_count(3)-
                 count the number of port ranges defined in the persistent
                 policy

          semanage_port_count_local(3)-
                 count the number of port ranges defined in the local store

          semanage_port_iterate(3)-
                 execute a callback for each port range in the persistent
                 policy

          semanage_port_iterate_local(3)-
                 execute a callback for each port range in the local store

          semanage_port_list(3)-
                 return an array containing all port ranges in the
                 persistent policy

          semanage_port_list_local(3)-
                 return an array containing all port ranges in the local
                 store

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

   ivg2@cornell.edu              16 March 2006             semanage_port(3)

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
