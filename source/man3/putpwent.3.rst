.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

putpwent(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PUTPWENT(3)             Linux Programmer's Manual            PUTPWENT(3)

NAME
-------------------------------------------------

::

          putpwent - write a password file entry


---------------------------------------------------------

::

          #include <stdio.h>
          #include <sys/types.h>
          #include <pwd.h>

          int putpwent(const struct passwd *restrict p, FILE *restrict stream);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          putpwent():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _SVID_SOURCE


---------------------------------------------------------------

::

          The putpwent() function writes a password entry from the
          structure p in the file associated with stream.

          The passwd structure is defined in <pwd.h> as follows:

              struct passwd {
                  char    *pw_name;        /* username */
                  char    *pw_passwd;      /* user password */
                  uid_t    pw_uid;         /* user ID */
                  gid_t    pw_gid;         /* group ID */
                  char    *pw_gecos;       /* real name */
                  char    *pw_dir;         /* home directory */
                  char    *pw_shell;       /* shell program */
              };


-----------------------------------------------------------------

::

          The putpwent() function returns 0 on success.  On failure, it
          returns -1, and errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL Invalid (NULL) argument given.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │putpwent()                     │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          SVr4.


---------------------------------------------------------

::

          endpwent(3), fgetpwent(3), getpw(3), getpwent(3), getpwnam(3),
          getpwuid(3), setpwent(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                    PUTPWENT(3)

--------------

Pages that refer to this page:
`fgetpwent(3) <../man3/fgetpwent.3.html>`__, 
`getpw(3) <../man3/getpw.3.html>`__, 
`getpwent(3) <../man3/getpwent.3.html>`__, 
`getpwent_r(3) <../man3/getpwent_r.3.html>`__, 
`getpwnam(3) <../man3/getpwnam.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/putpwent.3.license.html>`__

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
