.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

if_nameindex(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
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

   IF_NAMEINDEX(3)         Linux Programmer's Manual        IF_NAMEINDEX(3)

NAME
-------------------------------------------------

::

          if_nameindex, if_freenameindex - get network interface names and
          indexes


---------------------------------------------------------

::

          #include <net/if.h>

          struct if_nameindex *if_nameindex(void);
          void if_freenameindex(struct if_nameindex *ptr);


---------------------------------------------------------------

::

          The if_nameindex() function returns an array of if_nameindex
          structures, each containing information about one of the network
          interfaces on the local system.  The if_nameindex structure
          contains at least the following entries:

              unsigned int if_index; /* Index of interface (1, 2, ...) */
              char        *if_name;  /* Null-terminated name ("eth0", etc.) */

          The if_index field contains the interface index.  The if_name
          field points to the null-terminated interface name.  The end of
          the array is indicated by entry with if_index set to zero and
          if_name set to NULL.

          The data structure returned by if_nameindex() is dynamically
          allocated and should be freed using if_freenameindex() when no
          longer needed.


-----------------------------------------------------------------

::

          On success, if_nameindex() returns pointer to the array; on
          error, NULL is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          if_nameindex() may fail and set errno if:

          ENOBUFS
                 Insufficient resources available.

          if_nameindex() may also fail for any of the errors specified for
          socket(2), bind(2), ioctl(2), getsockname(2), recvmsg(2),
          sendto(2), or malloc(3).


---------------------------------------------------------

::

          The if_nameindex() function first appeared in glibc 2.1, but
          before glibc 2.3.4, the implementation supported only interfaces
          with IPv4 addresses.  Support of interfaces that don't have IPv4
          addresses is available only on kernels that support netlink.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │if_nameindex(), if_freenameindex()    │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, RFC 3493.

          This function first appeared in BSDi.


---------------------------------------------------------

::

          The program below demonstrates the use of the functions described
          on this page.  An example of the output this program might
          produce is the following:

              $ ./a.out
              1: lo
              2: wlan0
              3: em1

      Program source
          #include <net/if.h>
          #include <stdio.h>
          #include <stdlib.h>
          #include <unistd.h>

          int
          main(int argc, char *argv[])
          {
              struct if_nameindex *if_ni, *i;

              if_ni = if_nameindex();
              if (if_ni == NULL) {
                  perror("if_nameindex");
                  exit(EXIT_FAILURE);
              }

              for (i = if_ni; ! (i->if_index == 0 && i->if_name == NULL); i++)
                  printf("%u: %s\n", i->if_index, i->if_name);

              if_freenameindex(if_ni);

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          getsockopt(2), setsockopt(2), getifaddrs(3), if_indextoname(3),
          if_nametoindex(3), ifconfig(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                IF_NAMEINDEX(3)

--------------

Pages that refer to this page:
`if_nametoindex(3) <../man3/if_nametoindex.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/if_nameindex.3.license.html>`__

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
