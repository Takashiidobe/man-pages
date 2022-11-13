.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setaliasent(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETALIASENT(3)          Linux Programmer's Manual         SETALIASENT(3)

NAME
-------------------------------------------------

::

          setaliasent, endaliasent, getaliasent, getaliasent_r,
          getaliasbyname, getaliasbyname_r - read an alias entry


---------------------------------------------------------

::

          #include <aliases.h>

          void setaliasent(void);
          void endaliasent(void);

          struct aliasent *getaliasent(void);
          int getaliasent_r(struct aliasent *restrict result,
                               char *restrict buffer, size_t buflen,
                               struct aliasent **restrict res);

          struct aliasent *getaliasbyname(const char *name);
          int getaliasbyname_r(const char *restrict name,
                               struct aliasent *restrict result,
                               char *restrict buffer, size_t buflen,
                               struct aliasent **restrict res);


---------------------------------------------------------------

::

          One of the databases available with the Name Service Switch (NSS)
          is the aliases database, that contains mail aliases.  (To find
          out which databases are supported, try getent --help.)  Six
          functions are provided to access the aliases database.

          The getaliasent() function returns a pointer to a structure
          containing the group information from the aliases database.  The
          first time it is called it returns the first entry; thereafter,
          it returns successive entries.

          The setaliasent() function rewinds the file pointer to the
          beginning of the aliases database.

          The endaliasent() function closes the aliases database.

          getaliasent_r() is the reentrant version of the previous
          function.  The requested structure is stored via the first
          argument but the programmer needs to fill the other arguments
          also.  Not providing enough space causes the function to fail.

          The function getaliasbyname() takes the name argument and
          searches the aliases database.  The entry is returned as a
          pointer to a struct aliasent.

          getaliasbyname_r() is the reentrant version of the previous
          function.  The requested structure is stored via the second
          argument but the programmer needs to fill the other arguments
          also.  Not providing enough space causes the function to fail.

          The struct aliasent is defined in <aliases.h>:

              struct aliasent {
                  char    *alias_name;             /* alias name */
                  size_t   alias_members_len;
                  char   **alias_members;          /* alias name list */
                  int      alias_local;
              };


-----------------------------------------------------------------

::

          The functions getaliasent_r() and getaliasbyname_r() return a
          nonzero value on error.


---------------------------------------------------

::

          The default alias database is the file /etc/aliases.  This can be
          changed in the /etc/nsswitch.conf file.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │setaliasent(), endaliasent(),  │ Thread safety │ MT-Safe locale │
          │getaliasent_r(),               │               │                │
          │getaliasbyname_r()             │               │                │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │getaliasent(),                 │ Thread safety │ MT-Unsafe      │
          │getaliasbyname()               │               │                │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          These routines are glibc-specific.  The NeXT system has similar
          routines:

              #include <aliasdb.h>

              void alias_setent(void);
              void alias_endent(void);
              alias_ent *alias_getent(void);
              alias_ent *alias_getbyname(char *name);


---------------------------------------------------------

::

          The following example compiles with gcc example.c -o example.  It
          will dump all names in the alias database.

          #include <aliases.h>
          #include <stdio.h>
          #include <stdlib.h>
          #include <errno.h>

          int
          main(void)
          {
              struct aliasent *al;
              setaliasent();
              for (;;) {
                  al = getaliasent();
                  if (al == NULL)
                      break;
                  printf("Name: %s\n", al->alias_name);
              }
              if (errno) {
                  perror("reading alias");
                  exit(EXIT_FAILURE);
              }
              endaliasent();
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          getgrent(3), getpwent(3), getspent(3), aliases(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                 SETALIASENT(3)

--------------

Pages that refer to this page: `getent(1) <../man1/getent.1.html>`__, 
`nsswitch.conf(5) <../man5/nsswitch.conf.5.html>`__

--------------

`Copyright and license for this manual
page <../man3/setaliasent.3.license.html>`__

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
