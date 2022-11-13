.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_set_data(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_SET_DATA(3)             Linux-PAM Manual             PAM_SET_DATA(3)

NAME
-------------------------------------------------

::

          pam_set_data - set module internal data


---------------------------------------------------------

::

          #include <security/pam_modules.h>

          int pam_set_data(pam_handle_t *pamh,
                           const char *module_data_name, void *data,
                           void (*cleanup)(pam_handle_t *pamh, void *data, int error_status));


---------------------------------------------------------------

::

          The pam_set_data function associates a pointer to an object with
          the (hopefully) unique string module_data_name in the PAM context
          specified by the pamh argument.

          PAM modules may be dynamically loadable objects. In general such
          files should not contain static variables. This function and its
          counterpart pam_get_data(3), provide a mechanism for a module to
          associate some data with the handle pamh. Typically a module will
          call the pam_set_data function to register some data under a
          (hopefully) unique module_data_name. The data is available for
          use by other modules too but not by an application. Since this
          functions stores only a pointer to the data, the module should
          not modify or free the content of it.

          The function cleanup() is associated with the data and, if
          non-NULL, it is called when this data is over-written or
          following a call to pam_end(3).

          The error_status argument is used to indicate to the module the
          sort of action it is to take in cleaning this data item. As an
          example, Kerberos creates a ticket file during the authentication
          phase, this file might be associated with a data item. When
          pam_end(3) is called by the module, the error_status carries the
          return value of the pam_authenticate(3) or other libpam function
          as appropriate. Based on this value the Kerberos module may
          choose to delete the ticket file (authentication failure) or
          leave it in place.

          The error_status may have been logically OR'd with either of the
          following two values:

          PAM_DATA_REPLACE
              When a data item is being replaced (through a second call to
              pam_set_data) this mask is used. Otherwise, the call is
              assumed to be from pam_end(3).

          PAM_DATA_SILENT
              Which indicates that the process would prefer to perform the
              cleanup() quietly. That is, discourages logging/messages to
              the user.


-------------------------------------------------------------------

::

          PAM_BUF_ERR
              Memory buffer error.

          PAM_SUCCESS
              Data was successful stored.

          PAM_SYSTEM_ERR
              A NULL pointer was submitted as PAM handle or the function
              was called by an application.


---------------------------------------------------------

::

          pam_end(3), pam_get_data(3), pam_strerror(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the linux-pam (Pluggable Authentication
          Modules for Linux) project.  Information about the project can be
          found at ⟨http://www.linux-pam.org/⟩.  If you have a bug report
          for this manual page, see ⟨//www.linux-pam.org/⟩.  This page was
          obtained from the tarball Linux-PAM-1.3.0.tar.bz2 fetched from
          ⟨http://www.linux-pam.org/library/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Linux-PAM Manual               04/01/2016                PAM_SET_DATA(3)

--------------

Pages that refer to this page: `pam(3) <../man3/pam.3.html>`__, 
`pam_end(3) <../man3/pam_end.3.html>`__, 
`pam_get_data(3) <../man3/pam_get_data.3.html>`__, 
`pam_start(3) <../man3/pam_start.3.html>`__, 
`pam_systemd(8) <../man8/pam_systemd.8.html>`__

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
