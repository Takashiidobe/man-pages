.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage_bool(3) — Linux manual page
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

   semanage_bool(3)      Libsemanage API documentation     semanage_bool(3)

NAME
-------------------------------------------------

::

          semanage_bool - SELinux Policy Booleans Management API


---------------------------------------------------------

::

          #include <semanage/boolean_record.h>
          #include <semanage/booleans_active.h>
          #include <semanage/booleans_policy.h>
          #include <semanage/booleans_local.h>

          This object contains properties associated with a SELinux policy
          boolean

          For details on a specific function, see its manual page.


-------------------------------------------------------------------------------

::

          semanage_bool_create(3)-
                 create a boolean

          semanage_bool_free(3)-
                 release resources for this boolean

          semanage_bool_key_create(3)-
                 create a key, which can be used to identify a boolean

          semanage_bool_key_free(3)-
                 release resources for this boolean key

          semanage_bool_key_extract(3)-
                 create a key matching this boolean

          semanage_bool_clone(3)-
                 create an identical boolean (deep-copy clone)

          semanage_bool_compare(3)-
                 compare this boolean to the provided key

          semanage_bool_compare2(3)-
                 compare this boolean to another


---------------------------------------------------------------------------------------

::

          semanage_bool_get_name(3)-
                 return the name of this boolean

          semanage_bool_set_name(3)-
                 set the name of this boolean

          semanage_bool_get_value(3)-
                 return the value of this boolean

          semanage_bool_set_value(3)-
                 set the value of this boolean


-------------------------------------------------------------------------------------------

::

          semanage_bool_modify_local(3)-
                 add or update a boolean in the local store

          semanage_bool_set_active(3)-
                 update a boolean in the currently active policy

          semanage_bool_del_local(3)-
                 delete a boolean from the local store

          semanage_bool_exists(3)-
                 check if a boolean is defined in the persistent policy

          semanage_bool_exists_local(3)-
                 check if a boolean is defined in the local store

          semanage_bool_exists_active(3)-
                 check if a boolean is defined in the currently active
                 policy

          semanage_bool_query(3)-
                 query a boolean in the persistent policy

          semanage_bool_query_local(3)-
                 query a boolean in the local store

          semanage_bool_query_active(3)-
                 query a boolean in the currently active policy

          semanage_bool_count(3)-
                 count the number of booleans defined in the persistent
                 policy

          semanage_bool_count_local(3)-
                 count the number of booleans defined in the local store

          semanage_bool_count_active(3)-
                 count the number of booleans defined in the currently
                 active policy

          semanage_bool_iterate(3)-
                 execute a callback for each boolean in the persistent
                 policy

          semanage_bool_iterate_local(3)-
                 execute a callback for each boolean in the local store

          semanage_bool_iterate_active(3)-
                 execute a callback for each boolean in the currently
                 active policy

          semanage_bool_list(3)-
                 return an array containing all booleans in the persistent
                 policy

          semanage_bool_list_local(3)-
                 return an array containing all booleans in the local store

          semanage_bool_list_active(3)-
                 return an array containing all booleans in the currently
                 active policy

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

   ivg2@cornell.edu              16 March 2006             semanage_bool(3)

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
