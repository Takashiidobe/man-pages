.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage_iface(3) — Linux manual page
=====================================

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

   semanage_iface(3)     Libsemanage API documentation    semanage_iface(3)

NAME
-------------------------------------------------

::

          semanage_iface - SELinux Network Interfaces Management API


---------------------------------------------------------

::

          #include <semanage/iface_record.h>
          #include <semanage/interfaces_policy.h>
          #include <semanage/interfaces_local.h>

          This object contains properties associated with a network
          interface.

          For details on a specific function, see its manual page.


-------------------------------------------------------------------------------

::

          semanage_iface_create(3)-
                 create an interface

          semanage_iface_free(3)-
                 release resources for this interface

          semanage_iface_key_create(3)-
                 create a key, which can be used to identify an interface

          semanage_iface_key_free(3)-
                 release resources for this interface key

          semanage_iface_key_extract(3)-
                 create a key matching this interface

          semanage_iface_clone(3)-
                 create an identical interface (deep-copy clone)

          semanage_iface_compare(3)-
                 compare this interface to the provided key

          semanage_iface_compare2(3)-
                 compare this interface to another


---------------------------------------------------------------------------------------

::

          semanage_iface_get_name(3)-
                 return the name of this interface

          semanage_iface_set_name(3)-
                 set the name of this interface

          semanage_iface_get_ifcon(3)-
                 return the SELinux context associated with this interface

          semanage_iface_set_ifcon(3)-
                 set the SELinux context associated with this interface

          semanage_iface_get_msgcon(3)-
                 return the SELinux context associated with packets sent
                 over this interface

          semanage_iface_set_msgcon(3)-
                 set the SELinux context associated with packets sent over
                 this interface


-------------------------------------------------------------------------------------------

::

          semanage_iface_modify_local(3)-
                 add or update an interface in the local store

          semanage_iface_del_local(3)-
                 delete an interface from the local store

          semanage_iface_exists(3)-
                 check if an interface is defined in the persistent policy

          semanage_iface_exists_local(3)-
                 check if an interface is defined in the local store

          semanage_iface_query(3)-
                 query an interface in the persistent policy

          semanage_iface_query_local(3)-
                 query an interface in the local store

          semanage_iface_count(3)-
                 count the number of interfaces defined in the persistent
                 policy

          semanage_iface_count_local(3)-
                 count the number of interfaces defined in the local store

          semanage_iface_iterate(3)-
                 execute a callback for each interface in the persistent
                 policy

          semanage_iface_iterate_local(3)-
                 execute a callback for each interface in the local store

          semanage_iface_list(3)-
                 return an array containing all interfaces in the
                 persistent policy

          semanage_iface_list_local(3)-
                 return an array containing all interfaces in the local
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

   ivg2@cornell.edu              16 March 2006            semanage_iface(3)

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
