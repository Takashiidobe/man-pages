.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getservent(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETSERVENT(3)           Linux Programmer's Manual          GETSERVENT(3)

NAME
-------------------------------------------------

::

          getservent, getservbyname, getservbyport, setservent, endservent
          - get service entry


---------------------------------------------------------

::

          #include <netdb.h>

          struct servent *getservent(void);

          struct servent *getservbyname(const char *name, const char *proto);
          struct servent *getservbyport(int port, const char *proto);

          void setservent(int stayopen);
          void endservent(void);


---------------------------------------------------------------

::

          The getservent() function reads the next entry from the services
          database (see services(5)) and returns a servent structure
          containing the broken-out fields from the entry.  A connection is
          opened to the database if necessary.

          The getservbyname() function returns a servent structure for the
          entry from the database that matches the service name using
          protocol proto.  If proto is NULL, any protocol will be matched.
          A connection is opened to the database if necessary.

          The getservbyport() function returns a servent structure for the
          entry from the database that matches the port port (given in
          network byte order) using protocol proto.  If proto is NULL, any
          protocol will be matched.  A connection is opened to the database
          if necessary.

          The setservent() function opens a connection to the database, and
          sets the next entry to the first entry.  If stayopen is nonzero,
          then the connection to the database will not be closed between
          calls to one of the getserv*() functions.

          The endservent() function closes the connection to the database.

          The servent structure is defined in <netdb.h> as follows:

              struct servent {
                  char  *s_name;       /* official service name */
                  char **s_aliases;    /* alias list */
                  int    s_port;       /* port number */
                  char  *s_proto;      /* protocol to use */
              }

          The members of the servent structure are:

          s_name The official name of the service.

          s_aliases
                 A NULL-terminated list of alternative names for the
                 service.

          s_port The port number for the service given in network byte
                 order.

          s_proto
                 The name of the protocol to use with this service.


-----------------------------------------------------------------

::

          The getservent(), getservbyname(), and getservbyport() functions
          return a pointer to a statically allocated servent structure, or
          NULL if an error occurs or the end of the file is reached.


---------------------------------------------------

::

          /etc/services
                 services database file


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────────┬───────────────┬───────────────────────────────┐
          │Interface       │ Attribute     │ Value                         │
          ├────────────────┼───────────────┼───────────────────────────────┤
          │getservent()    │ Thread safety │ MT-Unsafe race:servent        │
          │                │               │ race:serventbuf locale        │
          ├────────────────┼───────────────┼───────────────────────────────┤
          │getservbyname() │ Thread safety │ MT-Unsafe race:servbyname     │
          │                │               │ locale                        │
          ├────────────────┼───────────────┼───────────────────────────────┤
          │getservbyport() │ Thread safety │ MT-Unsafe race:servbyport     │
          │                │               │ locale                        │
          ├────────────────┼───────────────┼───────────────────────────────┤
          │setservent(),   │ Thread safety │ MT-Unsafe race:servent locale │
          │endservent()    │               │                               │
          └────────────────┴───────────────┴───────────────────────────────┘
          In the above table, servent in race:servent signifies that if any
          of the functions setservent(), getservent(), or endservent() are
          used in parallel in different threads of a program, then data
          races could occur.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.3BSD.


---------------------------------------------------------

::

          getnetent(3), getprotoent(3), getservent_r(3), services(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                  GETSERVENT(3)

--------------

Pages that refer to this page: `getent(1) <../man1/getent.1.html>`__, 
`byteorder(3) <../man3/byteorder.3.html>`__, 
`getaddrinfo(3) <../man3/getaddrinfo.3.html>`__, 
`getnameinfo(3) <../man3/getnameinfo.3.html>`__, 
`getnetent(3) <../man3/getnetent.3.html>`__, 
`getprotoent(3) <../man3/getprotoent.3.html>`__, 
`getservent_r(3) <../man3/getservent_r.3.html>`__, 
`rexec(3) <../man3/rexec.3.html>`__, 
`setnetgrent(3) <../man3/setnetgrent.3.html>`__, 
`nss(5) <../man5/nss.5.html>`__, 
`nsswitch.conf(5) <../man5/nsswitch.conf.5.html>`__, 
`services(5) <../man5/services.5.html>`__

--------------

`Copyright and license for this manual
page <../man3/getservent.3.license.html>`__

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
