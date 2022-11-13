.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage_fcontext(3) — Linux manual page
========================================

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

   semanage_fcontext(3)  Libsemanage API documentation semanage_fcontext(3)

NAME
-------------------------------------------------

::

          semanage_fcontext - SELinux File Context Management API


---------------------------------------------------------

::

          #include <semanage/fcontext_record.h>
          #include <semanage/fcontexts_policy.h>
          #include <semanage/fcontexts_local.h>

          This object contains properties associated with a SELinux file
          context specification

          For details on a specific function, see its manual page.


-------------------------------------------------------------------------------

::

          semanage_fcontext_create(3)-
                 create a file context spec

          semanage_fcontext_free(3)-
                 release resources for this file context spec

          semanage_fcontext_key_create(3)-
                 create a key, which can be used to identify a file context
                 spec

          semanage_fcontext_key_free(3)-
                 release resources for this file context spec key

          semanage_fcontext_key_extract(3)-
                 create a key matching this file context spec

          semanage_fcontext_clone(3)-
                 create an identical file context spec (deep-copy clone)

          semanage_fcontext_compare(3)-
                 compare this file context spec to the provided key

          semanage_fcontext_compare2(3)-
                 compare this file context spec to another


---------------------------------------------------------------------------------------

::

          semanage_fcontext_get_expr(3)-
                 return the regular expression for this file context spec

          semanage_fcontext_set_expr(3)-
                 set the regular expression for this file context spec

          semanage_fcontext_get_type(3)-
                 return the file type for this file context spec

          semanage_fcontext_get_type_str(3)-
                 return a string representation for this file context spec
                 type

          semanage_fcontext_set_type(3)-
                 set the file type for this file context spec

          semanage_fcontext_get_con(3)-
                 return the SELinux context for this file context spec

          semanage_fcontext_set_expr(3)-
                 set the SELinux context for this file context spec


-------------------------------------------------------------------------------------------

::

          semanage_fcontext_modify_local(3)-
                 add or update a file context spec in the local store

          semanage_fcontext_del_local(3)-
                 delete a file context spec from the local store

          semanage_fcontext_exists(3)-
                 check if a file context spec is defined in the persistent
                 policy

          semanage_fcontext_exists_local(3)-
                 check if a file context spec is defined in the local store

          semanage_fcontext_query(3)-
                 query a file context spec in the persistent policy

          semanage_fcontext_query_local(3)-
                 query a file context spec in the local store

          semanage_fcontext_count(3)-
                 count the number of file context specs defined in the
                 persistent policy

          semanage_fcontext_count_local(3)-
                 count the number of file context specs defined in the
                 local store

          semanage_fcontext_iterate(3)-
                 execute a callback for each file context spec in the
                 persistent policy

          semanage_fcontext_iterate_local(3)-
                 execute a callback for each file context spec in the local
                 store

          semanage_fcontext_list(3)-
                 return an array containing all file context specs in the
                 persistent policy

          semanage_fcontext_list_local(3)-
                 return an array containing all file context specs in the
                 local store

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

   ivg2@cornell.edu              16 March 2006         semanage_fcontext(3)

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
