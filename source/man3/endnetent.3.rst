.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getnetent(3) — Linux manual page
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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETNETENT(3)            Linux Programmer's Manual           GETNETENT(3)

NAME
-------------------------------------------------

::

          getnetent, getnetbyname, getnetbyaddr, setnetent, endnetent - get
          network entry


---------------------------------------------------------

::

          #include <netdb.h>

          struct netent *getnetent(void);

          struct netent *getnetbyname(const char *name);
          struct netent *getnetbyaddr(uint32_t net, int type);

          void setnetent(int stayopen);
          void endnetent(void);


---------------------------------------------------------------

::

          The getnetent() function reads the next entry from the networks
          database and returns a netent structure containing the broken-out
          fields from the entry.  A connection is opened to the database if
          necessary.

          The getnetbyname() function returns a netent structure for the
          entry from the database that matches the network name.

          The getnetbyaddr() function returns a netent structure for the
          entry from the database that matches the network number net of
          type type.  The net argument must be in host byte order.

          The setnetent() function opens a connection to the database, and
          sets the next entry to the first entry.  If stayopen is nonzero,
          then the connection to the database will not be closed between
          calls to one of the getnet*() functions.

          The endnetent() function closes the connection to the database.

          The netent structure is defined in <netdb.h> as follows:

              struct netent {
                  char      *n_name;     /* official network name */
                  char     **n_aliases;  /* alias list */
                  int        n_addrtype; /* net address type */
                  uint32_t   n_net;      /* network number */
              }

          The members of the netent structure are:

          n_name The official name of the network.

          n_aliases
                 A NULL-terminated list of alternative names for the
                 network.

          n_addrtype
                 The type of the network number; always AF_INET.

          n_net  The network number in host byte order.


-----------------------------------------------------------------

::

          The getnetent(), getnetbyname(), and getnetbyaddr() functions
          return a pointer to a statically allocated netent structure, or a
          null pointer if an error occurs or the end of the file is
          reached.


---------------------------------------------------

::

          /etc/networks
                 networks database file


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────┬───────────────┬────────────────────────────────┐
          │Interface      │ Attribute     │ Value                          │
          ├───────────────┼───────────────┼────────────────────────────────┤
          │getnetent()    │ Thread safety │ MT-Unsafe race:netent          │
          │               │               │ race:netentbuf env locale      │
          ├───────────────┼───────────────┼────────────────────────────────┤
          │getnetbyname() │ Thread safety │ MT-Unsafe race:netbyname env   │
          │               │               │ locale                         │
          ├───────────────┼───────────────┼────────────────────────────────┤
          │getnetbyaddr() │ Thread safety │ MT-Unsafe race:netbyaddr       │
          │               │               │ locale                         │
          ├───────────────┼───────────────┼────────────────────────────────┤
          │setnetent(),   │ Thread safety │ MT-Unsafe race:netent env      │
          │endnetent()    │               │ locale                         │
          └───────────────┴───────────────┴────────────────────────────────┘
          In the above table, netent in race:netent signifies that if any
          of the functions setnetent(), getnetent(), or endnetent() are
          used in parallel in different threads of a program, then data
          races could occur.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.3BSD.


---------------------------------------------------

::

          In glibc versions before 2.2, the net argument of getnetbyaddr()
          was of type long.


---------------------------------------------------------

::

          getnetent_r(3), getprotoent(3), getservent(3)
          RFC 1101

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   GETNETENT(3)

--------------

Pages that refer to this page: `getent(1) <../man1/getent.1.html>`__, 
`getnetent_r(3) <../man3/getnetent_r.3.html>`__, 
`getprotoent(3) <../man3/getprotoent.3.html>`__, 
`getservent(3) <../man3/getservent.3.html>`__, 
`inet(3) <../man3/inet.3.html>`__, 
`networks(5) <../man5/networks.5.html>`__, 
`nsswitch.conf(5) <../man5/nsswitch.conf.5.html>`__

--------------

`Copyright and license for this manual
page <../man3/getnetent.3.license.html>`__

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
