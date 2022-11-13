.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage_del(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   semanage_del(3)       Libsemanage API documentation      semanage_del(3)

NAME
-------------------------------------------------

::

          semanage_del - SELinux Management API


---------------------------------------------------------

::

          The following delete function is supported for any semanage
          record.
          Replace the function and object name as necessary.

          extern int DELETE_FUNCTION (
               semanage_handle_t *handle,
               const semanage_OBJECT_key_t *key);


---------------------------------------------------------------

::

          Behavior:
                 The delete function will remove the object corresponding
                 to the provided key from the local store. If no match is
                 found, no action is taken. Changes will become permanent
                 when semanage_commit(3) is invoked. Additional checks may
                 be performed at that time to ensure the system is left in
                 a valid state.

          Parameters:
                 The handle is used to track persistent state across
                 semanage calls, and for error reporting. The key
                 identifies the data object, which will be deleted from the
                 local store. The key is a property of the caller, and will
                 not be stored or modified internally.

          Requirements:
                 This function requires an semanage connection to be
                 established (see semanage_connect(3) ), and must be
                 executed in a transaction (see
                 semanage_begin_transaction(3) ).


-----------------------------------------------------------------

::

          In case of failure, -1 is returned, and the semanage error
          callback is invoked, describing the error.  Otherwise 0 is
          returned.


---------------------------------------------------------

::

          semanage_handle_create(3), semanage_begin_transaction(3),
          semanage_connect(3), semanage_commit(3).

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

   ivg2@cornell.edu              16 March 2006              semanage_del(3)

--------------

Pages that refer to this page:
`semanage_bool(3) <../man3/semanage_bool.3.html>`__, 
`semanage_fcontext(3) <../man3/semanage_fcontext.3.html>`__, 
`semanage_iface(3) <../man3/semanage_iface.3.html>`__, 
`semanage_node(3) <../man3/semanage_node.3.html>`__, 
`semanage_port(3) <../man3/semanage_port.3.html>`__, 
`semanage_seuser(3) <../man3/semanage_seuser.3.html>`__, 
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
