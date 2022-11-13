.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getprotoent(3) — Linux manual page
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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETPROTOENT(3)          Linux Programmer's Manual         GETPROTOENT(3)

NAME
-------------------------------------------------

::

          getprotoent, getprotobyname, getprotobynumber, setprotoent,
          endprotoent - get protocol entry


---------------------------------------------------------

::

          #include <netdb.h>

          struct protoent *getprotoent(void);

          struct protoent *getprotobyname(const char *name);
          struct protoent *getprotobynumber(int proto);

          void setprotoent(int stayopen);
          void endprotoent(void);


---------------------------------------------------------------

::

          The getprotoent() function reads the next entry from the
          protocols database (see protocols(5)) and returns a protoent
          structure containing the broken-out fields from the entry.  A
          connection is opened to the database if necessary.

          The getprotobyname() function returns a protoent structure for
          the entry from the database that matches the protocol name name.
          A connection is opened to the database if necessary.

          The getprotobynumber() function returns a protoent structure for
          the entry from the database that matches the protocol number
          number.  A connection is opened to the database if necessary.

          The setprotoent() function opens a connection to the database,
          and sets the next entry to the first entry.  If stayopen is
          nonzero, then the connection to the database will not be closed
          between calls to one of the getproto*() functions.

          The endprotoent() function closes the connection to the database.

          The protoent structure is defined in <netdb.h> as follows:

              struct protoent {
                  char  *p_name;       /* official protocol name */
                  char **p_aliases;    /* alias list */
                  int    p_proto;      /* protocol number */
              }

          The members of the protoent structure are:

          p_name The official name of the protocol.

          p_aliases
                 A NULL-terminated list of alternative names for the
                 protocol.

          p_proto
                 The protocol number.


-----------------------------------------------------------------

::

          The getprotoent(), getprotobyname(), and getprotobynumber()
          functions return a pointer to a statically allocated protoent
          structure, or a null pointer if an error occurs or the end of the
          file is reached.


---------------------------------------------------

::

          /etc/protocols
                 protocol database file


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────┬───────────────┬────────────────────────────┐
          │Interface          │ Attribute     │ Value                      │
          ├───────────────────┼───────────────┼────────────────────────────┤
          │getprotoent()      │ Thread safety │ MT-Unsafe race:protoent    │
          │                   │               │ race:protoentbuf locale    │
          ├───────────────────┼───────────────┼────────────────────────────┤
          │getprotobyname()   │ Thread safety │ MT-Unsafe race:protobyname │
          │                   │               │ locale                     │
          ├───────────────────┼───────────────┼────────────────────────────┤
          │getprotobynumber() │ Thread safety │ MT-Unsafe                  │
          │                   │               │ race:protobynumber locale  │
          ├───────────────────┼───────────────┼────────────────────────────┤
          │setprotoent(),     │ Thread safety │ MT-Unsafe race:protoent    │
          │endprotoent()      │               │ locale                     │
          └───────────────────┴───────────────┴────────────────────────────┘
          In the above table, protoent in race:protoent signifies that if
          any of the functions setprotoent(), getprotoent(), or
          endprotoent() are used in parallel in different threads of a
          program, then data races could occur.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.3BSD.


---------------------------------------------------------

::

          getnetent(3), getprotoent_r(3), getservent(3), protocols(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                 GETPROTOENT(3)

--------------

Pages that refer to this page: `getent(1) <../man1/getent.1.html>`__, 
`getsockopt(2) <../man2/getsockopt.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`getnetent(3) <../man3/getnetent.3.html>`__, 
`getprotoent_r(3) <../man3/getprotoent_r.3.html>`__, 
`getservent(3) <../man3/getservent.3.html>`__, 
`setnetgrent(3) <../man3/setnetgrent.3.html>`__, 
`nsswitch.conf(5) <../man5/nsswitch.conf.5.html>`__, 
`protocols(5) <../man5/protocols.5.html>`__, 
`raw(7) <../man7/raw.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/getprotoent.3.license.html>`__

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
