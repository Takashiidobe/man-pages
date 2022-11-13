.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_dup(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDAP_OPEN(3)            Library Functions Manual            LDAP_OPEN(3)

NAME
-------------------------------------------------

::

          ldap_dup, ldap_destroy, - Duplicate and destroy LDAP session
          handles


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          LDAP *ldap_dup(
                 LDAP *old );

          int ldap_destroy(
                 LDAP *old );


---------------------------------------------------------------

::

          ldap_dup() duplicates an existing LDAP (LDAP *) session handle.
          The new session handle may be used concurrently with the original
          session handle.  In a threaded environment, different threads may
          execute concurrent requests on the same connection/session
          without fear of contamination.  Each session handle manages its
          own private error results.

          ldap_destroy() destroys an existing session handle.

          The ldap_dup() and ldap_destroy() functions are used in
          conjunction with a "thread safe" version of libldap to enable
          operation thread safe API calls, so that a single session may be
          simultaneously used across multiple threads with consistent error
          handling.

          When a session is created through the use of one of the session
          creation functions including ldap_open(3), ldap_init(3),
          ldap_initialize(3) or ldap_init_fd(3) an LDAP * session handle is
          returned to the application.  The session handle may be shared
          amongst threads, however the error codes are unique to a session
          handle.  Multiple threads performing different operations using
          the same session handle will result in inconsistent error codes
          and return values.

          To prevent this confusion, ldap_dup() is used duplicate an
          existing session handle so that multiple threads can share the
          session, and maintain consistent error information and results.

          The message queues for a session are shared between sibling
          session handles.  Results of operations on a sibling session
          handles are accessible to all the sibling session handles.
          Applications desiring results associated with a specific
          operation should provide the appropriate msgid to ldap_result().
          Applications should avoid calling ldap_result() with LDAP_RES_ANY
          as that may "steal" and return results in the calling thread that
          another operation in a different thread, using a different
          session handle, may require to complete.

          When ldap_unbind() is called on a session handle with siblings,
          all the siblings become invalid.

          Siblings must be destroyed using ldap_destroy().  Session handle
          resources associated with the original (LDAP *) will be freed
          when the last session handle is destroyed or when ldap_unbind()
          is called, if no other session handles currently exist.


-----------------------------------------------------

::

          If an error occurs, ldap_dup() will return NULL and errno should
          be set appropriately.  ldap_destroy() will directly return the
          LDAP code associated to the error (or LDAP_SUCCESS in case of
          success); errno should be set as well whenever appropriate.


---------------------------------------------------------

::

          ldap_open(3), ldap_init(3), ldap_initialize(3), ldap_init_fd(3),
          errno(3)


-------------------------------------------------------------------------

::

          This work is based on the previously proposed LDAP C API
          Concurrency Extensions draft (draft-zeilenga-ldap-c-api-
          concurrency-00.txt) effort.  OpenLDAP Software is developed and
          maintained by The OpenLDAP Project <http://www.openldap.org/>.
          OpenLDAP Software is derived from the University of Michigan LDAP
          3.3 Release.

COLOPHON
---------------------------------------------------------

::

          This page is part of the OpenLDAP (an open source implementation
          of the Lightweight Directory Access Protocol) project.
          Information about the project can be found at 
          ⟨http://www.openldap.org/⟩.  If you have a bug report for this
          manual page, see ⟨http://www.openldap.org/its/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.openldap.org/openldap/openldap.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   OpenLDAP LDVERSION             RELEASEDATE                  LDAP_OPEN(3)

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
