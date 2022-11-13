.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getpw(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETPW(3)                Linux Programmer's Manual               GETPW(3)

NAME
-------------------------------------------------

::

          getpw - reconstruct password line entry


---------------------------------------------------------

::

          #define _GNU_SOURCE             /* See feature_test_macros(7) */
          #include <sys/types.h>
          #include <pwd.h>

          int getpw(uid_t uid, char *buf);


---------------------------------------------------------------

::

          The getpw() function reconstructs the password line entry for the
          given user ID uid in the buffer buf.  The returned buffer
          contains a line of format

              name:passwd:uid:gid:gecos:dir:shell

          The passwd structure is defined in <pwd.h> as follows:

              struct passwd {
                  char   *pw_name;       /* username */
                  char   *pw_passwd;     /* user password */
                  uid_t   pw_uid;        /* user ID */
                  gid_t   pw_gid;        /* group ID */
                  char   *pw_gecos;      /* user information */
                  char   *pw_dir;        /* home directory */
                  char   *pw_shell;      /* shell program */
              };

          For more information about the fields of this structure, see
          passwd(5).


-----------------------------------------------------------------

::

          The getpw() function returns 0 on success; on error, it returns
          -1, and errno is set to indicate the error.

          If uid is not found in the password database, getpw() returns -1,
          sets errno to 0, and leaves buf unchanged.


-----------------------------------------------------

::

          0 or ENOENT
                 No user corresponding to uid.

          EINVAL buf is NULL.

          ENOMEM Insufficient memory to allocate passwd structure.


---------------------------------------------------

::

          /etc/passwd
                 password database file


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │getpw()                        │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          SVr2.


-------------------------------------------------

::

          The getpw() function is dangerous as it may overflow the provided
          buffer buf.  It is obsoleted by getpwuid(3).


---------------------------------------------------------

::

          endpwent(3), fgetpwent(3), getpwent(3), getpwnam(3), getpwuid(3),
          putpwent(3), setpwent(3), passwd(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       GETPW(3)

--------------

Pages that refer to this page:
`fgetpwent(3) <../man3/fgetpwent.3.html>`__, 
`getpwent(3) <../man3/getpwent.3.html>`__, 
`getpwent_r(3) <../man3/getpwent_r.3.html>`__, 
`getpwnam(3) <../man3/getpwnam.3.html>`__, 
`putpwent(3) <../man3/putpwent.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/getpw.3.license.html>`__

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
