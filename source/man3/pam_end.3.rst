.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_end(3) — Linux manual page
==============================

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

   PAM_END(3)                  Linux-PAM Manual                  PAM_END(3)

NAME
-------------------------------------------------

::

          pam_end - termination of PAM transaction


---------------------------------------------------------

::

          #include <security/pam_appl.h>

          int pam_end(pam_handle_t *pamh, int pam_status);


---------------------------------------------------------------

::

          The pam_end function terminates the PAM transaction and is the
          last function an application should call in the PAM context. Upon
          return the handle pamh is no longer valid and all memory
          associated with it will be invalid.

          The pam_status argument should be set to the value returned to
          the application by the last PAM library call.

          The value taken by pam_status is used as an argument to the
          module specific callback function, cleanup() (See pam_set_data(3)
          and pam_get_data(3)). In this way the module can be given
          notification of the pass/fail nature of the tear-down process,
          and perform any last minute tasks that are appropriate to the
          module before it is unlinked. This argument can be logically OR'd
          with PAM_DATA_SILENT to indicate to indicate that the module
          should not treat the call too seriously. It is generally used to
          indicate that the current closing of the library is in a
          fork(2)ed process, and that the parent will take care of cleaning
          up things that exist outside of the current process space (files
          etc.).

          This function free's all memory for items associated with the
          pam_set_item(3) and pam_get_item(3) functions. Pointers
          associated with such objects are not valid anymore after pam_end
          was called.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              Transaction was successful terminated.

          PAM_SYSTEM_ERR
              System error, for example a NULL pointer was submitted as PAM
              handle or the function was called by a module.


---------------------------------------------------------

::

          pam_get_data(3), pam_set_data(3), pam_start(3), pam_strerror(3)

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

   Linux-PAM Manual               04/01/2016                     PAM_END(3)

--------------

Pages that refer to this page: `pam(3) <../man3/pam.3.html>`__, 
`pam_authenticate(3) <../man3/pam_authenticate.3.html>`__, 
`pam_get_data(3) <../man3/pam_get_data.3.html>`__, 
`pam_get_user(3) <../man3/pam_get_user.3.html>`__, 
`pam_set_data(3) <../man3/pam_set_data.3.html>`__, 
`pam_start(3) <../man3/pam_start.3.html>`__

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
