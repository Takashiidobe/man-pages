.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_getenvlist(3) — Linux manual page
=====================================

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

   PAM_GETENVLIST(3)           Linux-PAM Manual           PAM_GETENVLIST(3)

NAME
-------------------------------------------------

::

          pam_getenvlist - getting the PAM environment


---------------------------------------------------------

::

          #include <security/pam_appl.h>

          char **pam_getenvlist(pam_handle_t *pamh);


---------------------------------------------------------------

::

          The pam_getenvlist function returns a complete copy of the PAM
          environment as associated with the handle pamh. The PAM
          environment variables represent the contents of the regular
          environment variables of the authenticated user when service is
          granted.

          The format of the memory is a malloc()'d array of char pointers,
          the last element of which is set to NULL. Each of the non-NULL
          entries in this array point to a NUL terminated and malloc()'d
          char string of the form: "name=value".

          It should be noted that this memory will never be free()'d by
          libpam. Once obtained by a call to pam_getenvlist, it is the
          responsibility of the calling application to free() this memory.

          It is by design, and not a coincidence, that the format and
          contents of the returned array matches that required for the
          third argument of the execle(3) function call.


-------------------------------------------------------------------

::

          The pam_getenvlist function returns NULL on failure.


---------------------------------------------------------

::

          pam_start(3), pam_getenv(3), pam_putenv(3), pam(8)

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

   Linux-PAM Manual               04/01/2016              PAM_GETENVLIST(3)

--------------

Pages that refer to this page: `su(1) <../man1/su.1.html>`__, 
`pam(3) <../man3/pam.3.html>`__, 
`pam_getenv(3) <../man3/pam_getenv.3.html>`__, 
`pam_misc_drop_env(3) <../man3/pam_misc_drop_env.3.html>`__, 
`pam_putenv(3) <../man3/pam_putenv.3.html>`__, 
`pam_exec(8) <../man8/pam_exec.8.html>`__

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
