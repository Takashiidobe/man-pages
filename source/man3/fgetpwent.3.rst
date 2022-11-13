.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fgetpwent(3) — Linux manual page
================================

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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FGETPWENT(3)            Linux Programmer's Manual           FGETPWENT(3)

NAME
-------------------------------------------------

::

          fgetpwent - get password file entry


---------------------------------------------------------

::

          #include <stdio.h>
          #include <sys/types.h>
          #include <pwd.h>

          struct passwd *fgetpwent(FILE *stream);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          fgetpwent():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _SVID_SOURCE


---------------------------------------------------------------

::

          The fgetpwent() function returns a pointer to a structure
          containing the broken out fields of a line in the file stream.
          The first time it is called it returns the first entry;
          thereafter, it returns successive entries.  The file referred to
          by stream must have the same format as /etc/passwd (see
          passwd(5)).

          The passwd structure is defined in <pwd.h> as follows:

              struct passwd {
                  char   *pw_name;       /* username */
                  char   *pw_passwd;     /* user password */
                  uid_t   pw_uid;        /* user ID */
                  gid_t   pw_gid;        /* group ID */
                  char   *pw_gecos;      /* real name */
                  char   *pw_dir;        /* home directory */
                  char   *pw_shell;      /* shell program */
              };


-----------------------------------------------------------------

::

          The fgetpwent() function returns a pointer to a passwd structure,
          or NULL if there are no more entries or an error occurs.  In the
          event of an error, errno is set to indicate the error.


-----------------------------------------------------

::

          ENOMEM Insufficient memory to allocate passwd structure.


---------------------------------------------------

::

          /etc/passwd
                 password database file


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌─────────────────────┬───────────────┬──────────────────────────┐
          │Interface            │ Attribute     │ Value                    │
          ├─────────────────────┼───────────────┼──────────────────────────┤
          │fgetpwent()          │ Thread safety │ MT-Unsafe race:fgetpwent │
          └─────────────────────┴───────────────┴──────────────────────────┘


-------------------------------------------------------------------

::

          SVr4.


---------------------------------------------------------

::

          endpwent(3), fgetpwent_r(3), fopen(3), getpw(3), getpwent(3),
          getpwnam(3), getpwuid(3), putpwent(3), setpwent(3), passwd(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   FGETPWENT(3)

--------------

Pages that refer to this page: `getpw(3) <../man3/getpw.3.html>`__, 
`getpwent(3) <../man3/getpwent.3.html>`__, 
`getpwent_r(3) <../man3/getpwent_r.3.html>`__, 
`getpwnam(3) <../man3/getpwnam.3.html>`__, 
`putpwent(3) <../man3/putpwent.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/fgetpwent.3.license.html>`__

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
