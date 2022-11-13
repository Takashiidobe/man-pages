.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getrpcent(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
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

   GETRPCENT(3)            Linux Programmer's Manual           GETRPCENT(3)

NAME
-------------------------------------------------

::

          getrpcent, getrpcbyname, getrpcbynumber, setrpcent, endrpcent -
          get RPC entry


---------------------------------------------------------

::

          #include <netdb.h>

          struct rpcent *getrpcent(void);

          struct rpcent *getrpcbyname(const char *name);
          struct rpcent *getrpcbynumber(int number);

          void setrpcent(int stayopen);
          void endrpcent(void);


---------------------------------------------------------------

::

          The getrpcent(), getrpcbyname(), and getrpcbynumber() functions
          each return a pointer to an object with the following structure
          containing the broken-out fields of an entry in the RPC program
          number data base.

              struct rpcent {
                  char  *r_name;     /* name of server for this RPC program */
                  char **r_aliases;  /* alias list */
                  long   r_number;   /* RPC program number */
              };

          The members of this structure are:

          r_name The name of the server for this RPC program.

          r_aliases
                 A NULL-terminated list of alternate names for the RPC
                 program.

          r_number
                 The RPC program number for this service.

          The getrpcent() function reads the next entry from the database.
          A connection is opened to the database if necessary.

          The setrpcent() function opens a connection to the database, and
          sets the next entry to the first entry.  If stayopen is nonzero,
          then the connection to the database will not be closed between
          calls to one of the getrpc*() functions.

          The endrpcent() function closes the connection to the database.

          The getrpcbyname() and getrpcbynumber() functions sequentially
          search from the beginning of the file until a matching RPC
          program name or program number is found, or until end-of-file is
          encountered.


-----------------------------------------------------------------

::

          On success, getrpcent(), getrpcbyname(), and getrpcbynumber()
          return a pointer to a statically allocated rpcent structure.
          NULL is returned on EOF or error.


---------------------------------------------------

::

          /etc/rpc
                 RPC program number database.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │getrpcent(), getrpcbyname(),   │ Thread safety │ MT-Unsafe      │
          │getrpcbynumber()               │               │                │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │setrpcent(), endrpcent()       │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          Not in POSIX.1.  Present on the BSDs, Solaris, and many other
          systems.


-------------------------------------------------

::

          All information is contained in a static area so it must be
          copied if it is to be saved.


---------------------------------------------------------

::

          getrpcent_r(3), rpc(5), rpcinfo(8), ypserv(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                   GETRPCENT(3)

--------------

Pages that refer to this page: `getent(1) <../man1/getent.1.html>`__, 
`getrpcent_r(3) <../man3/getrpcent_r.3.html>`__, 
`nsswitch.conf(5) <../man5/nsswitch.conf.5.html>`__, 
`rpc(5) <../man5/rpc.5.html>`__

--------------

`Copyright and license for this manual
page <../man3/getrpcent.3.license.html>`__

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
