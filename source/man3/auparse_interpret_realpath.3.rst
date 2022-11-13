.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

auparse_interpret_field(3) — Linux manual page
==============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUPARSE_INTERPRET_FIELD(3)   Linux Audit API  AUPARSE_INTERPRET_FIELD(3)

NAME
-------------------------------------------------

::

          auparse_interpret_field, auparse_interpret_realpath,auparse_interpret_sock_family,auparse_interpret_sock_port,auparse_interpret_sock_address - get current field's interpreted value


---------------------------------------------------------

::

          #include <auparse.h>

          const char *auparse_interpret_field(auparse_state_t *au);
          const char *auparse_interpret_realpath(auparse_state_t *au);
          const char *auparse_interpret_sock_family(auparse_state_t *au);
          const char *auparse_interpret_sock_port(auparse_state_t *au);
          const char *auparse_interpret_sock_address(auparse_state_t *au);


---------------------------------------------------------------

::

          auparse_interpret_field allows access to the interpreted value in
          the current field of the current record in the current event. The
          returned string is escaped using the chosen method. The returned
          value will be destroyed if you call this function again. If you
          need to interpret another field and keep this value, you will
          have to copy it for later use.

          Examples of things that could be interpreted are: uid, gid,
          syscall numbers, exit codes, file paths, socket addresses,
          permissions, modes, and capabilities. There are likely to be more
          in the future. If a value cannot be interpreted, its original
          value is returned.

          auparse_interpret_realpath is like auparse_interpret_field except
          that it will call realpath on the results of gluing the cwd and
          file together. This also implies that it only valid to be called
          for the file name given in a PATH record.

          auparse_interpret_sock_family will only return the socket family
          portion of a socket address.

          auparse_interpret_sock_port will only return the port portion of
          a socket address. Not all socket families have a port. If that is
          the case, you will get a NULL value in which case your best
          option is to use the normal interpretation function.

          auparse_interpret_sock_address will only return the address
          portion of a socket address. Not all socket families have an ip
          address. If that is the case, you will get a NULL value in which
          case your best option is to use the normal interpretation
          function.


-----------------------------------------------------------------

::

          Returns NULL if there is an error otherwise a pointer to the
          interpreted value.


---------------------------------------------------------

::

          auparse_get_field_int(3), auparse_get_field_str(3),
          auparse_set_escape_mode(3).


-----------------------------------------------------

::

          Steve Grubb

COLOPHON
---------------------------------------------------------

::

          This page is part of the audit (Linux Audit) project.
          Information about the project can be found at 
          ⟨http://people.redhat.com/sgrubb/audit/⟩.  If you have a bug
          report for this manual page, send it to linux-audit@redhat.com.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/linux-audit/audit-userspace.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Red Hat                        August 2017    AUPARSE_INTERPRET_FIELD(3)

--------------

Pages that refer to this page:
`auparse_get_field_name(3) <../man3/auparse_get_field_name.3.html>`__, 
`auparse_get_field_str(3) <../man3/auparse_get_field_str.3.html>`__, 
`auparse_normalize_functions(3) <../man3/auparse_normalize_functions.3.html>`__, 
`auparse_set_escape_mode(3) <../man3/auparse_set_escape_mode.3.html>`__, 
`ausearch_add_interpreted_item(3) <../man3/ausearch_add_interpreted_item.3.html>`__, 
`ausearch-expression(5) <../man5/ausearch-expression.5.html>`__

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
