.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

set_matchpathcon_flags(3) — Linux manual page
=============================================

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

   set_matchpathcon_flags(3)ELinux API documentationt_matchpathcon_flags(3)

NAME
-------------------------------------------------

::

          set_matchpathcon_flags, set_matchpathcon_invalidcon,
          set_matchpathcon_printf - set flags controlling the operation of
          matchpathcon or matchpathcon_index and configure the behaviour of
          validity checking and error displaying


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          void set_matchpathcon_flags(unsigned int flags);

          void set_matchpathcon_invalidcon(int (*f)(const char *path,
          unsigned lineno, char *context));

          void set_matchpathcon_printf(void (*f)(const char *fmt, ...));


---------------------------------------------------------------

::

          set_matchpathcon_flags() sets the flags controlling the operation
          of matchpathcon_init(3) and subsequently matchpathcon_index(3) or
          matchpathcon(3).  If the MATCHPATHCON_BASEONLY flag is set, then
          only the base file contexts configuration file will be processed,
          not any dynamically generated entries or local customizations.

          set_matchpathcon_invalidcon() sets the function used by
          matchpathcon_init(3) when checking the validity of a context in
          the file contexts configuration.  If not set, then this defaults
          to a test based on security_check_context(3), which checks
          validity against the active policy on a SELinux system.  This can
          be set to instead perform checking based on a binary policy file,
          e.g. using sepol_check_context(3), as is done by setfiles -c.
          The function is also responsible for reporting any such error,
          and may include the path and lineno in such error messages.

          set_matchpathcon_printf() sets the function used by
          matchpathcon_init(3) when displaying errors about the file
          contexts configuration.  If not set, then this defaults to
          fprintf(stderr, fmt, ...).  This can be set to redirect error
          reporting to a different destination.


-----------------------------------------------------------------

::

          Returns zero on success or -1 otherwise.


---------------------------------------------------------

::

          selinux(8), matchpathcon(3), matchpathcon_index(3),
          set_matchpathcon_invalidcon(3), set_matchpathcon_printf(3),
          freecon(3), setfilecon(3), setfscreatecon(3)

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

   sds@tycho.nsa.gov           21 November 2009   set_matchpathcon_flags(3)

--------------

Pages that refer to this page:
`matchpathcon(3) <../man3/matchpathcon.3.html>`__, 
`set_matchpathcon_flags(3) <../man3/set_matchpathcon_flags.3.html>`__

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
