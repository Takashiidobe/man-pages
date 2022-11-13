.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setfilecon(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   setfilecon(3)           SELinux API documentation          setfilecon(3)

NAME
-------------------------------------------------

::

          setfilecon, fsetfilecon, lsetfilecon - set SELinux security
          context of a file


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int setfilecon(const char *path, char *con);

          int setfilecon_raw(const char *path, char *con);

          int lsetfilecon(const char *path, char *con);

          int lsetfilecon_raw(const char *path, char *con);

          int fsetfilecon(int fd, char *con);

          int fsetfilecon_raw(int fd, char *con);


---------------------------------------------------------------

::

          setfilecon() sets the security context of the file system object.

          lsetfilecon() is identical to setfilecon, except in the case of a
          symbolic link, where the link itself has it's context set, not
          the file that it refers to.

          fsetfilecon() is identical to setfilecon, only the open file
          pointed to by filedes (as returned by open(2)) has it's context
          set in place of path.

          setfilecon_raw(), lsetfilecon_raw(), and fsetfilecon_raw() behave
          identically to their non-raw counterparts but do not perform
          context translation.


-----------------------------------------------------------------

::

          On success, zero is returned. On failure, -1 is returned and
          errno is set appropriately.


-----------------------------------------------------

::

          If there is insufficient space remaining to store the extended
          attribute, errno is set to either ENOSPC, or EDQUOT if quota
          enforcement was the cause.

          If extended attributes are not supported by the filesystem, or
          are disabled, errno is set to ENOTSUP.

          The errors documented for the stat(2) system call are also
          applicable here.


---------------------------------------------------------

::

          selinux(3), freecon(3), getfilecon(3), setfscreatecon(3)

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

   russell@coker.com.au         1 January 2004                setfilecon(3)

--------------

Pages that refer to this page:
`getfilecon(3) <../man3/getfilecon.3.html>`__, 
`matchpathcon(3) <../man3/matchpathcon.3.html>`__, 
`matchpathcon_checkmatches(3) <../man3/matchpathcon_checkmatches.3.html>`__, 
`selinux_lsetfilecon_default(3) <../man3/selinux_lsetfilecon_default.3.html>`__, 
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
