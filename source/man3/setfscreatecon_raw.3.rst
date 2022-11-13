.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getfscreatecon(3) — Linux manual page
=====================================

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

   getfscreatecon(3)       SELinux API documentation      getfscreatecon(3)

NAME
-------------------------------------------------

::

          getfscreatecon, setfscreatecon - get or set the SELinux security
          context used for creating a new file system object


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int getfscreatecon(char **con);

          int getfscreatecon_raw(char **con);

          int setfscreatecon(char *context);

          int setfscreatecon_raw(char *context);


---------------------------------------------------------------

::

          getfscreatecon() retrieves the context used for creating a new
          file system object.  This returned context should be freed with
          freecon(3) if non-NULL.  getfscreatecon() sets *con to NULL if no
          fscreate context has been explicitly set by the program (i.e.
          using the default policy behavior).

          setfscreatecon() sets the context used for creating a new file
          system object.  NULL can be passed to setfscreatecon() to reset
          to the default policy behavior.  The fscreate context is
          automatically reset after the next execve(2), so a program
          doesn't need to explicitly sanitize it upon startup.

          setfscreatecon() can be applied prior to library functions that
          internally perform an file creation, in order to set an file
          context on the objects.

          getfscreatecon_raw() and setfscreatecon_raw() behave identically
          to their non-raw counterparts but do not perform context
          translation.

          Note: Signal handlers that perform a setfscreatecon() must take
          care to save, reset, and restore the fscreate context to avoid
          unexpected behavior.

          Note: Contexts are thread specific.


-----------------------------------------------------------------

::

          On error -1 is returned.  On success 0 is returned.


---------------------------------------------------------

::

          selinux(8), freecon(3), getcon(3), getexeccon(3)

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

   russell@coker.com.au         1 January 2004            getfscreatecon(3)

--------------

Pages that refer to this page:
`getfilecon(3) <../man3/getfilecon.3.html>`__, 
`matchpathcon(3) <../man3/matchpathcon.3.html>`__, 
`matchpathcon_checkmatches(3) <../man3/matchpathcon_checkmatches.3.html>`__, 
`selinux_lsetfilecon_default(3) <../man3/selinux_lsetfilecon_default.3.html>`__, 
`setfilecon(3) <../man3/setfilecon.3.html>`__, 
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
