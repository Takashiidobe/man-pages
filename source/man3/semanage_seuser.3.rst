.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage_seuser(3) — Linux manual page
======================================

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

   semanage_seuser(3)    Libsemanage API documentation   semanage_seuser(3)

NAME
-------------------------------------------------

::

          semanage_seuser - Linux UID to SELinux User Management API


---------------------------------------------------------

::

          #include <semanage/seuser_record.h>
          #include <semanage/seusers_policy.h>
          #include <semanage/seusers_local.h>

          This object contains properties associated with a Unix user.
          Typically many Unix users are mapped to the same SELinux user.
          See semanage_user(3) for overview of the SELinux user API.

          For details on a specific function, see its manual page.


-------------------------------------------------------------------------------

::

          semanage_seuser_create(3)-
                 create a seuser

          semanage_seuser_free(3)-
                 release resources for this seuser

          semanage_seuser_key_create(3)-
                 create a key, which can be used to identify a seuser

          semanage_seuser_key_free(3)-
                 release resources for this seuser key

          semanage_seuser_key_extract(3)-
                 create a key matching this seuser

          semanage_seuser_clone(3)-
                 create an identical seuser (deep-copy clone)

          semanage_seuser_compare(3)-
                 compare this seuser to the provided key

          semanage_seuser_compare2(3)-
                 compare this seuser to another


---------------------------------------------------------------------------------------

::

          semanage_seuser_get_name(3)-
                 return the name of this seuser

          semanage_user_set_name(3)-
                 set the name of this seuser

          semanage_seuser_get_sename(3)-
                 return the name of the (SELinux) user mapped to this
                 seuser

          semanage_user_set_sename(3)-
                 set the name of the (SELinux) user mapped to this seuser

          semanage_user_get_mlsrange(3)-
                 return a the range of valid MLS sensitivities and
                 categories for this user

          semanage_user_set_mlsrange(3)-
                 set the range of valid MLS sensitivities and categories
                 for this user


-------------------------------------------------------------------------------------------

::

          semanage_seuser_modify_local(3)-
                 add or update a seuser in the local store

          semanage_seuser_del_local(3)-
                 delete a seuser from the local store

          semanage_seuser_exists(3)-
                 check if a seuser is defined in the persistent policy

          semanage_seuser_exists_local(3)-
                 check if a seuser is defined in the local store

          semanage_seuser_query(3)-
                 query a seuser in the persistent policy

          semanage_seuser_query_local(3)-
                 query a seuser in the local store

          semanage_seuser_count(3)-
                 count the number of seusers defined in the persistent
                 policy

          semanage_seuser_count_local(3)-
                 count the number of seusers defined in the local store

          semanage_seuser_iterate(3)-
                 execute a callback for each seuser in the persistent
                 policy

          semanage_seuser_iterate_local(3)-
                 execute a callback for each seuser in the local store

          semanage_seuser_list(3)-
                 return an array containing all seusers in the persistent
                 policy

          semanage_seuser_list_local(3)-
                 return an array containing all seusers in the local store

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

   ivg2@cornell.edu              16 March 2006           semanage_seuser(3)

--------------

Pages that refer to this page:
`semanage_user(3) <../man3/semanage_user.3.html>`__

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
