.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bindresvport(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   BINDRESVPORT(3)         Linux Programmer's Manual        BINDRESVPORT(3)

NAME
-------------------------------------------------

::

          bindresvport - bind a socket to a privileged IP port


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <netinet/in.h>

          int bindresvport(int sockfd, struct sockaddr_in *sin);


---------------------------------------------------------------

::

          bindresvport() is used to bind the socket referred to by the file
          descriptor sockfd to a privileged anonymous IP port, that is, a
          port number arbitrarily selected from the range 512 to 1023.

          If the bind(2) performed by bindresvport() is successful, and sin
          is not NULL, then sin->sin_port returns the port number actually
          allocated.

          sin can be NULL, in which case sin->sin_family is implicitly
          taken to be AF_INET.  However, in this case, bindresvport() has
          no way to return the port number actually allocated.  (This
          information can later be obtained using getsockname(2).)


-----------------------------------------------------------------

::

          bindresvport() returns 0 on success; otherwise -1 is returned and
          errno is set to indicate the error.


-----------------------------------------------------

::

          bindresvport() can fail for any of the same reasons as bind(2).
          In addition, the following errors may occur:

          EACCES The calling process was not privileged (on Linux: the
                 calling process did not have the CAP_NET_BIND_SERVICE
                 capability in the user namespace governing its network
                 namespace).

          EADDRINUSE
                 All privileged ports are in use.

          EAFNOSUPPORT (EPFNOSUPPORT in glibc 2.7 and earlier)
                 sin is not NULL and sin->sin_family is not AF_INET.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────┬───────────────┬────────────────────────────────┐
          │Interface      │ Attribute     │ Value                          │
          ├───────────────┼───────────────┼────────────────────────────────┤
          │bindresvport() │ Thread safety │ glibc >= 2.17: MT-Safe;        │
          │               │               │ glibc < 2.17: MT-Unsafe        │
          └───────────────┴───────────────┴────────────────────────────────┘

          The bindresvport() function uses a static variable that was not
          protected by a lock before glibc 2.17, rendering the function MT-
          Unsafe.


-------------------------------------------------------------------

::

          Not in POSIX.1.  Present on the BSDs, Solaris, and many other
          systems.


---------------------------------------------------

::

          Unlike some bindresvport() implementations, the glibc
          implementation ignores any value that the caller supplies in
          sin->sin_port.


---------------------------------------------------------

::

          bind(2), getsockname(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                BINDRESVPORT(3)

--------------

`Copyright and license for this manual
page <../man3/bindresvport.3.license.html>`__

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
