.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rexec(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
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

   REXEC(3)                Linux Programmer's Manual               REXEC(3)

NAME
-------------------------------------------------

::

          rexec, rexec_af - return stream to a remote command


---------------------------------------------------------

::

          #include <netdb.h>

          int rexec(char **restrict ahost, int inport,
                    const char *restrict user, const char *restrict passwd,
                    const char *restrict cmd, int *restrict fd2p);
          int rexec_af(char **restrict ahost, int inport,
                    const char *restrict user, const char *restrict passwd,
                    const char *restrict cmd, int *restrict fd2p,
                    sa_family_t af);

          rexec(), rexec_af():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              In glibc up to and including 2.19:
                  _BSD_SOURCE


---------------------------------------------------------------

::

          This interface is obsoleted by rcmd(3).

          The rexec() function looks up the host *ahost using
          gethostbyname(3), returning -1 if the host does not exist.
          Otherwise, *ahost is set to the standard name of the host.  If a
          username and password are both specified, then these are used to
          authenticate to the foreign host; otherwise the environment and
          then the .netrc file in user's home directory are searched for
          appropriate information.  If all this fails, the user is prompted
          for the information.

          The port inport specifies which well-known DARPA Internet port to
          use for the connection; the call getservbyname("exec", "tcp")
          (see getservent(3)) will return a pointer to a structure that
          contains the necessary port.  The protocol for connection is
          described in detail in rexecd(8).

          If the connection succeeds, a socket in the Internet domain of
          type SOCK_STREAM is returned to the caller, and given to the
          remote command as stdin and stdout.  If fd2p is nonzero, then an
          auxiliary channel to a control process will be setup, and a file
          descriptor for it will be placed in *fd2p.  The control process
          will return diagnostic output from the command (unit 2) on this
          channel, and will also accept bytes on this channel as being UNIX
          signal numbers, to be forwarded to the process group of the
          command.  The diagnostic information returned does not include
          remote authorization failure, as the secondary connection is set
          up after authorization has been verified.  If fd2p is 0, then the
          stderr (unit 2 of the remote command) will be made the same as
          the stdout and no provision is made for sending arbitrary signals
          to the remote process, although you may be able to get its
          attention by using out-of-band data.

      rexec_af()
          The rexec() function works over IPv4 (AF_INET).  By contrast, the
          rexec_af() function provides an extra argument, af, that allows
          the caller to select the protocol.  This argument can be
          specified as AF_INET, AF_INET6, or AF_UNSPEC (to allow the
          implementation to select the protocol).


---------------------------------------------------------

::

          The rexec_af() function was added to glibc in version 2.2.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────────────────────────────┬───────────────┬───────────┐
          │Interface                           │ Attribute     │ Value     │
          ├────────────────────────────────────┼───────────────┼───────────┤
          │rexec(), rexec_af()                 │ Thread safety │ MT-Unsafe │
          └────────────────────────────────────┴───────────────┴───────────┘


-------------------------------------------------------------------

::

          These functions are not in POSIX.1.  The rexec() function first
          appeared in 4.2BSD, and is present on the BSDs, Solaris, and many
          other systems.  The rexec_af() function is more recent, and less
          widespread.


-------------------------------------------------

::

          The rexec() function sends the unencrypted password across the
          network.

          The underlying service is considered a big security hole and
          therefore not enabled on many sites; see rexecd(8) for
          explanations.


---------------------------------------------------------

::

          rcmd(3), rexecd(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       REXEC(3)

--------------

Pages that refer to this page: `rcmd(3) <../man3/rcmd.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/rexec.3.license.html>`__

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
