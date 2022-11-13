.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

audit_encode_nv_string(3) — Linux manual page
=============================================

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

   AUDIT_ENCODE_NV_STRING(3)    Linux Audit API   AUDIT_ENCODE_NV_STRING(3)

NAME
-------------------------------------------------

::

          audit_encode_nv_string - encode a name/value pair in a string


---------------------------------------------------------

::

          #include <libaudit.h>

          char *audit_encode_nv_string(const char *name, const char *value,
          unsigned int vlen)


---------------------------------------------------------------

::

          This function is used to encode a name/value pair. This should be
          used on any field being logged that potentially contains a space,
          a double-quote, or a control character. Any value containing
          those have to be specially encoded for the auparse library to
          correctly handle the value. The encoding method is designed to
          prevent log injection attacks where malicious values could cause
          parsing errors.

          To use this function, pass the name string and value strings on
          their respective arguments. If the value is likely to have a NUL
          value embedded within it, you will need to pass a value length
          that tells in bytes how big the value is. Otherwise, you can pass
          a 0 for vlen and the function will simply use strlen against the
          value pointer. Also be aware that the name of the field will
          cause auparse to do certain things when interpreting the value.
          If the name is uid, a user id value in decimal is expected. Make
          sure that well known names are used for their intended purpose or
          that there is no chance of name collision with something new.


-----------------------------------------------------------------

::

          Returns a freshly malloc'ed string that the caller must free or
          NULL on error.


---------------------------------------------------------

::

          audit_log_user_message(3), audit_log_user_comm_message(3),
          audit_log_user_avc_message(3), audit_log_semanage_message(3).


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

   Red Hat                         Oct 2010       AUDIT_ENCODE_NV_STRING(3)

--------------

Pages that refer to this page:
`audit_encode_value(3) <../man3/audit_encode_value.3.html>`__, 
`audit_value_needs_encoding(3) <../man3/audit_value_needs_encoding.3.html>`__

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
