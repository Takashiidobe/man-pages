.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fgetgrent(3) — Linux manual page
================================

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

   FGETGRENT(3)            Linux Programmer's Manual           FGETGRENT(3)

NAME
-------------------------------------------------

::

          fgetgrent - get group file entry


---------------------------------------------------------

::

          #include <stdio.h>
          #include <sys/types.h>
          #include <grp.h>

          struct group *fgetgrent(FILE *stream);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          fgetgrent():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _SVID_SOURCE


---------------------------------------------------------------

::

          The fgetgrent() function returns a pointer to a structure
          containing the group information from the file referred to by
          stream.  The first time it is called it returns the first entry;
          thereafter, it returns successive entries.  The file referred to
          by stream must have the same format as /etc/group (see group(5)).

          The group structure is defined in <grp.h> as follows:

              struct group {
                  char   *gr_name;        /* group name */
                  char   *gr_passwd;      /* group password */
                  gid_t   gr_gid;         /* group ID */
                  char  **gr_mem;         /* NULL-terminated array of pointers
                                             to names of group members */
              };


-----------------------------------------------------------------

::

          The fgetgrent() function returns a pointer to a group structure,
          or NULL if there are no more entries or an error occurs.  In the
          event of an error, errno is set to indicate the error.


-----------------------------------------------------

::

          ENOMEM Insufficient memory to allocate group structure.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌─────────────────────┬───────────────┬──────────────────────────┐
          │Interface            │ Attribute     │ Value                    │
          ├─────────────────────┼───────────────┼──────────────────────────┤
          │fgetgrent()          │ Thread safety │ MT-Unsafe race:fgetgrent │
          └─────────────────────┴───────────────┴──────────────────────────┘


-------------------------------------------------------------------

::

          SVr4.


---------------------------------------------------------

::

          endgrent(3), fgetgrent_r(3), fopen(3), getgrent(3), getgrgid(3),
          getgrnam(3), putgrent(3), setgrent(3), group(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   FGETGRENT(3)

--------------

Pages that refer to this page:
`getgrent(3) <../man3/getgrent.3.html>`__, 
`getgrent_r(3) <../man3/getgrent_r.3.html>`__, 
`getgrnam(3) <../man3/getgrnam.3.html>`__, 
`putgrent(3) <../man3/putgrent.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/fgetgrent.3.license.html>`__

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
