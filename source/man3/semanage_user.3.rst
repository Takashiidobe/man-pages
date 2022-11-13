.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage_user(3) — Linux manual page
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

   semanage_user(3)      Libsemanage API documentation     semanage_user(3)

NAME
-------------------------------------------------

::

          semanage_user - SELinux User Management API


---------------------------------------------------------

::

          #include <semanage/user_record.h>
          #include <semanage/users_policy.h>
          #include <semanage/users_local.h>

          This object contains properties associated with a SELinux user.
          Typically many Unix users are mapped to the same SELinux user.
          See semanage_seuser(3) for overview of the Unix user API.

          For details on a specific function, see its manual page.


-------------------------------------------------------------------------------

::

          semanage_user_create(3)-
                 create a user

          semanage_user_free(3)-
                 release resources for this user

          semanage_user_key_create(3)-
                 create a key, which can be used to identify a user

          semanage_user_key_free(3)-
                 release resources for this user key

          semanage_user_key_extract(3)-
                 create a key matching this user

          semanage_user_clone(3)-
                 create an identical user (deep-copy clone)

          semanage_user_compare(3)-
                 compare this user to the provided key

          semanage_user_compare2(3)-
                 compare this user to another


---------------------------------------------------------------------------------------

::

          semanage_user_get_name(3)-
                 return the name of this user

          semanage_user_set_name(3)-
                 set the name of this user

          semanage_user_get_prefix(3)-
                 return the labeling prefix for this user, used to control
                 the contexts of user directories

          semanage_user_set_prefix(3)-
                 set the labeling prefix for this user

          semanage_user_get_mlslevel(3)-
                 return the default MLS level, which is assigned to this
                 user at login time

          semanage_user_set_mlslevel(3)-
                 set the default MLS level

          semanage_user_get_mlsrange(3)-
                 return the range of valid MLS sensitivities and categories
                 for this user

          semanage_user_set_mlsrange(3)-
                 set the range of valid MLS sensitivities and categories
                 for this user

          semanage_user_add_role(3)-
                 add a role to the user's list of valid roles

          semanage_user_del_role(3)-
                 remove a role from the user's list of valid roles

          semanage_user_has_role(3)-
                 check if a role is valid for this user

          semanage_user_get_num_roles(3)-
                 return the number of valid roles for this user

          semanage_user_get_roles(3)-
                 return an array containing the roles for this user

          semanage_user_set_roles(3)- set the roles for this user


-------------------------------------------------------------------------------------------

::

          semanage_user_modify_local(3)-
                 add or update a user in the local store

          semanage_user_del_local(3)-
                 delete a user from the local store

          semanage_user_exists(3)-
                 check if a user is defined in the persistent policy

          semanage_user_exists_local(3)-
                 check if a user is defined in the local store

          semanage_user_query(3)-
                 query a user in the persistent policy

          semanage_user_query_local(3)-
                 query a user in the local store

          semanage_user_count(3)-
                 count the number of users defined in the persistent policy

          semanage_user_count_local(3)-
                 count the number of users defined in the local store

          semanage_user_iterate(3)-
                 execute a callback for each user in the persistent policy

          semanage_user_iterate_local(3)-
                 execute a callback for each user in the local store

          semanage_user_list(3)-
                 return an array containing all users in the persistent
                 policy

          semanage_user_list_local(3)-
                 return an array containing all users in the local store

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

   ivg2@cornell.edu              16 March 2006             semanage_user(3)

--------------

Pages that refer to this page:
`semanage_seuser(3) <../man3/semanage_seuser.3.html>`__

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
