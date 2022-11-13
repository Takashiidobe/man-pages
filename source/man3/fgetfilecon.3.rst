.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getfilecon(3) — Linux manual page
=================================

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

   getfilecon(3)           SELinux API documentation          getfilecon(3)

NAME
-------------------------------------------------

::

          getfilecon, fgetfilecon, lgetfilecon - get SELinux security
          context of a file


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int getfilecon(const char *path, char **con);

          int getfilecon_raw(const char *path, char **con);

          int lgetfilecon(const char *path, char **con);

          int lgetfilecon_raw(const char *path, char **con);

          int fgetfilecon(int fd, char **con);

          int fgetfilecon_raw(int fd, char **con);


---------------------------------------------------------------

::

          getfilecon() retrieves the context associated with the given path
          in the file system, the length of the context is returned.

          lgetfilecon() is identical to getfilecon(), except in the case of
          a symbolic link, where the link itself is interrogated, not the
          file that it refers to.

          fgetfilecon() is identical to getfilecon(), only the open file
          pointed to by filedes (as returned by open(2)) is interrogated in
          place of path.

          getfilecon_raw(), lgetfilecon_raw() and fgetfilecon_raw() behave
          identically to their non-raw counterparts but do not perform
          context translation.

          The returned context should be freed with freecon(3) if non-NULL.


-----------------------------------------------------------------

::

          On success, a positive number is returned indicating the size of
          the extended attribute value. On failure, -1 is returned and
          errno is  set appropriately.

          If the context does not exist, or the process has no access to
          this attribute, errno is set to ENODATA.

          If extended attributes are not supported by the filesystem, or
          are disabled, errno is set to ENOTSUP.

          The errors documented for the stat(2) system call are also
          applicable here.


---------------------------------------------------------

::

          selinux(8), freecon(3), setfilecon(3), setfscreatecon(3)

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

   russell@coker.com.au         1 January 2004                getfilecon(3)

--------------

Pages that refer to this page:
`security_class_to_string(3) <../man3/security_class_to_string.3.html>`__, 
`setfilecon(3) <../man3/setfilecon.3.html>`__

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
