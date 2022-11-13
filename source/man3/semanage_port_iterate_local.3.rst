.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage_iterate(3) — Linux manual page
=======================================

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

   semanage_iterate(3)   Libsemanage API documentation  semanage_iterate(3)

NAME
-------------------------------------------------

::

          semanage_iterate - SELinux Management API


---------------------------------------------------------

::

          The following iterate function is supported for any semanage
          record.
          Replace the function and object name as necessary.

          extern int ITERATE_FUNCTION (
               semanage_handle_t *handle,
               int (*handler) (
                             const semanage_OBJECT_t *object,
                             void *varg),
               void *handler_arg);


---------------------------------------------------------------

::

          Behavior:
                 The iterate function will execute the specified handler
                 over all objects in the selected location. An arbitrary
                 argument can be passed into the handler function along
                 with each object.

                 The object passed in is property of the libsemanage
                 library, and may not be modified or preserved - use
                 semanage_OBJECT_clone if that is necessary.

                 The handler code may not invoke any semanage write
                 requests for the same object type (i.e. modifying the
                 underlying store is not allowed). The iterate function is
                 reentrant only while inside a transaction (see
                 semanage_begin_transaction ). It is not safe to execute
                 other semanage read or write requests within iterate if
                 not inside a transaction. The handler may return -1 to
                 signal error exit, 0 to signal continue, and 1 to signal
                 successful exit early (the iterate function will stop
                 accordingly).

          Parameters:
                 The handle is used to track persistent state across
                 semanage calls, and for error reporting. The handler is
                 the function to execute, with handler_arg as its second
                 parameter, and each object as its first parameter.

          Requirements:
                 This function requires an semanage connection to be
                 established (see semanage_connect(3) )


-----------------------------------------------------------------

::

          In case of failure, -1 is returned, and the semanage error
          callback is invoked, describing the error.  Otherwise a non-
          negative integer is returned (a commit number). The same number
          will be returned by all other semanage object read calls until
          the next commit.


---------------------------------------------------------

::

          semanage_handle_create(3), semanage_connect(3),

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

   ivg2@cornell.edu              15 March 2006          semanage_iterate(3)

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
