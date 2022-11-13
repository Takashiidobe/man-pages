.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_controls(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDAP_CONTROLS(3)        Library Functions Manual        LDAP_CONTROLS(3)

NAME
-------------------------------------------------

::

          ldap_control_create, ldap_control_find, ldap_control_dup,
          ldap_controls_dup, ldap_control_free, ldap_controls_free - LDAP
          control manipulation routines


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_control_create(const char *oid, int iscritical, struct
          berval *value, int dupval, LDAPControl **ctrlp);

          LDAPControl *ldap_control_find( const char *oid, LDAPControl
          **ctrls, LDAPControl ***nextctrlp);

          LDAPControl *ldap_control_dup(LDAPControl *ctrl);

          LDAPControl **ldap_controls_dup(LDAPControl **ctrls);

          void ldap_control_free(LDAPControl *ctrl);

          void ldap_controls_free(LDAPControl **ctrls);


---------------------------------------------------------------

::

          These routines are used to manipulate structures used for LDAP
          controls.

          ldap_control_create() creates a control with the specified OID
          using the contents of the value parameter for the control value,
          if any.  The content of value is duplicated if dupval is non-
          zero.  The iscritical parameter must be non-zero for a critical
          control. The created control is returned in the ctrlp parameter.
          The routine returns LDAP_SUCCESS on success or some other error
          code on failure.  The content of value, for supported control
          types, can be prepared using helpers provided by this
          implementation of libldap, usually in the form
          ldap_create_<control name>_control_value().  Otherwise, it can be
          BER-encoded using the functionalities of liblber.

          ldap_control_find() searches the NULL-terminated ctrls array for
          a control whose OID matches the oid parameter.  The routine
          returns a pointer to the control if found, NULL otherwise.  If
          the parameter nextctrlp is not NULL, on return it will point to
          the next control in the array, and can be passed to the
          ldap_control_find() routine for subsequent calls, to find further
          occurrences of the same control type.  The use of this function
          is discouraged; the recommended way of handling controls in
          responses consists in going through the array of controls,
          dealing with each of them in the returned order, since it could
          matter.

          ldap_control_dup() duplicates an individual control structure,
          and ldap_controls_dup() duplicates a NULL-terminated array of
          controls.

          ldap_control_free() frees an individual control structure, and
          ldap_controls_free() frees a NULL-terminated array of controls.


---------------------------------------------------------

::

          ldap(3), ldap_error(3)


-------------------------------------------------------------------------

::

          OpenLDAP Software is developed and maintained by The OpenLDAP
          Project <http://www.openldap.org/>.  OpenLDAP Software is derived
          from the University of Michigan LDAP 3.3 Release.

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

   OpenLDAP LDVERSION             RELEASEDATE              LDAP_CONTROLS(3)

--------------

Pages that refer to this page: `ldap(3) <../man3/ldap.3.html>`__, 
`ldap_get_option(3) <../man3/ldap_get_option.3.html>`__, 
`ldap_parse_reference(3) <../man3/ldap_parse_reference.3.html>`__, 
`ldap_parse_result(3) <../man3/ldap_parse_result.3.html>`__, 
`ldap_parse_sort_control(3) <../man3/ldap_parse_sort_control.3.html>`__

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
