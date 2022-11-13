.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setnetgrent(3) — Linux manual page
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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETNETGRENT(3)          Linux Programmer's Manual         SETNETGRENT(3)

NAME
-------------------------------------------------

::

          setnetgrent, endnetgrent, getnetgrent, getnetgrent_r, innetgr -
          handle network group entries


---------------------------------------------------------

::

          #include <netdb.h>

          int setnetgrent(const char *netgroup);
          void endnetgrent(void);

          int getnetgrent(char **restrict host,
                      char **restrict user, char **restrict domain);
          int getnetgrent_r(char **restrict host,
                      char **restrict user, char **restrict domain,
                      char *restrict buf, size_t buflen);

          int innetgr(const char *netgroup, const char *host,
                      const char *user, const char *domain);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          setnetgrent(), endnetgrent(), getnetgrent(), getnetgrent_r(),
          innetgr():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The netgroup is a SunOS invention.  A netgroup database is a list
          of string triples (hostname, username, domainname) or other
          netgroup names.  Any of the elements in a triple can be empty,
          which means that anything matches.  The functions described here
          allow access to the netgroup databases.  The file
          /etc/nsswitch.conf defines what database is searched.

          The setnetgrent() call defines the netgroup that will be searched
          by subsequent getnetgrent() calls.  The getnetgrent() function
          retrieves the next netgroup entry, and returns pointers in host,
          user, domain.  A null pointer means that the corresponding entry
          matches any string.  The pointers are valid only as long as there
          is no call to other netgroup-related functions.  To avoid this
          problem you can use the GNU function getnetgrent_r() that stores
          the strings in the supplied buffer.  To free all allocated
          buffers use endnetgrent().

          In most cases you want to check only if the triplet (hostname,
          username, domainname) is a member of a netgroup.  The function
          innetgr() can be used for this without calling the above three
          functions.  Again, a null pointer is a wildcard and matches any
          string.  The function is thread-safe.


-----------------------------------------------------------------

::

          These functions return 1 on success and 0 for failure.


---------------------------------------------------

::

          /etc/netgroup
          /etc/nsswitch.conf


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌─────────────────┬───────────────┬──────────────────────────────┐
          │Interface        │ Attribute     │ Value                        │
          ├─────────────────┼───────────────┼──────────────────────────────┤
          │setnetgrent(),   │ Thread safety │ MT-Unsafe race:netgrent      │
          │getnetgrent_r(), │               │ locale                       │
          │innetgr()        │               │                              │
          ├─────────────────┼───────────────┼──────────────────────────────┤
          │endnetgrent()    │ Thread safety │ MT-Unsafe race:netgrent      │
          ├─────────────────┼───────────────┼──────────────────────────────┤
          │getnetgrent()    │ Thread safety │ MT-Unsafe race:netgrent      │
          │                 │               │ race:netgrentbuf locale      │
          └─────────────────┴───────────────┴──────────────────────────────┘
          In the above table, netgrent in race:netgrent signifies that if
          any of the functions setnetgrent(), getnetgrent_r(), innetgr(),
          getnetgrent(), or endnetgrent() are used in parallel in different
          threads of a program, then data races could occur.


-------------------------------------------------------------------

::

          These functions are not in POSIX.1, but setnetgrent(),
          endnetgrent(), getnetgrent(), and innetgr() are available on most
          UNIX systems.  getnetgrent_r() is not widely available on other
          systems.


---------------------------------------------------

::

          In the BSD implementation, setnetgrent() returns void.


---------------------------------------------------------

::

          sethostent(3), setprotoent(3), setservent(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                 SETNETGRENT(3)

--------------

Pages that refer to this page: `getent(1) <../man1/getent.1.html>`__

--------------

`Copyright and license for this manual
page <../man3/setnetgrent.3.license.html>`__

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
