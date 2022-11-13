.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sockatmark(3) — Linux manual page
=================================

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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SOCKATMARK(3)           Linux Programmer's Manual          SOCKATMARK(3)

NAME
-------------------------------------------------

::

          sockatmark - determine whether socket is at out-of-band mark


---------------------------------------------------------

::

          #include <sys/socket.h>

          int sockatmark(int sockfd);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          sockatmark():
              _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          sockatmark() returns a value indicating whether or not the socket
          referred to by the file descriptor sockfd is at the out-of-band
          mark.  If the socket is at the mark, then 1 is returned; if the
          socket is not at the mark, 0 is returned.  This function does not
          remove the out-of-band mark.


-----------------------------------------------------------------

::

          A successful call to sockatmark() returns 1 if the socket is at
          the out-of-band mark, or 0 if it is not.  On error, -1 is
          returned and errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  sockfd is not a valid file descriptor.

          EINVAL sockfd is not a file descriptor to which sockatmark() can
                 be applied.


---------------------------------------------------------

::

          sockatmark() was added to glibc in version 2.2.4.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │sockatmark()                          │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          If sockatmark() returns 1, then the out-of-band data can be read
          using the MSG_OOB flag of recv(2).

          Out-of-band data is supported only on some stream socket
          protocols.

          sockatmark() can safely be called from a handler for the SIGURG
          signal.

          sockatmark() is implemented using the SIOCATMARK ioctl(2)
          operation.


-------------------------------------------------

::

          Prior to glibc 2.4, sockatmark() did not work.


---------------------------------------------------------

::

          The following code can be used after receipt of a SIGURG signal
          to read (and discard) all data up to the mark, and then read the
          byte of data at the mark:

              char buf[BUF_LEN];
              char oobdata;
              int atmark, s;

              for (;;) {
                  atmark = sockatmark(sockfd);
                  if (atmark == -1) {
                      perror("sockatmark");
                      break;
                  }

                  if (atmark)
                      break;

                  s = read(sockfd, buf, BUF_LEN);
                  if (s == -1)
                      perror("read");
                  if (s <= 0)
                      break;
              }

              if (atmark == 1) {
                  if (recv(sockfd, &oobdata, 1, MSG_OOB) == -1) {
                      perror("recv");
                      ...
                  }
              }


---------------------------------------------------------

::

          fcntl(2), recv(2), send(2), tcp(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  SOCKATMARK(3)

--------------

Pages that refer to this page: `recv(2) <../man2/recv.2.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/sockatmark.3.license.html>`__

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
