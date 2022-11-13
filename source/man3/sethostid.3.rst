.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gethostid(3) — Linux manual page
================================

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
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETHOSTID(3)            Linux Programmer's Manual           GETHOSTID(3)

NAME
-------------------------------------------------

::

          gethostid, sethostid - get or set the unique identifier of the
          current host


---------------------------------------------------------

::

          #include <unistd.h>

          long gethostid(void);
          int sethostid(long hostid);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          gethostid():
              Since glibc 2.20:
                  _DEFAULT_SOURCE || _XOPEN_SOURCE >= 500
              Up to and including glibc 2.19:
                  _BSD_SOURCE || _XOPEN_SOURCE >= 500

          sethostid():
              Since glibc 2.21:
                  _DEFAULT_SOURCE
              In glibc 2.19 and 2.20:
                  _DEFAULT_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)
              Up to and including glibc 2.19:
                  _BSD_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)


---------------------------------------------------------------

::

          gethostid() and sethostid() respectively get or set a unique
          32-bit identifier for the current machine.  The 32-bit identifier
          was intended to be unique among all UNIX systems in existence.
          This normally resembles the Internet address for the local
          machine, as returned by gethostbyname(3), and thus usually never
          needs to be set.

          The sethostid() call is restricted to the superuser.


-----------------------------------------------------------------

::

          gethostid() returns the 32-bit identifier for the current host as
          set by sethostid().

          On success, sethostid() returns 0; on error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          sethostid() can fail with the following errors:

          EACCES The caller did not have permission to write to the file
                 used to store the host ID.

          EPERM  The calling process's effective user or group ID is not
                 the same as its corresponding real ID.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────┬───────────────┬───────────────────────────────────┐
          │Interface   │ Attribute     │ Value                             │
          ├────────────┼───────────────┼───────────────────────────────────┤
          │gethostid() │ Thread safety │ MT-Safe hostid env locale         │
          ├────────────┼───────────────┼───────────────────────────────────┤
          │sethostid() │ Thread safety │ MT-Unsafe const:hostid            │
          └────────────┴───────────────┴───────────────────────────────────┘


-------------------------------------------------------------------

::

          4.2BSD; these functions were dropped in 4.4BSD.  SVr4 includes
          gethostid() but not sethostid().

          POSIX.1-2001 and POSIX.1-2008 specify gethostid() but not
          sethostid().


---------------------------------------------------

::

          In the glibc implementation, the hostid is stored in the file
          /etc/hostid.  (In glibc versions before 2.2, the file
          /var/adm/hostid was used.)

          In the glibc implementation, if gethostid() cannot open the file
          containing the host ID, then it obtains the hostname using
          gethostname(2), passes that hostname to gethostbyname_r(3) in
          order to obtain the host's IPv4 address, and returns a value
          obtained by bit-twiddling the IPv4 address.  (This value may not
          be unique.)


-------------------------------------------------

::

          It is impossible to ensure that the identifier is globally
          unique.


---------------------------------------------------------

::

          hostid(1), gethostbyname(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                   GETHOSTID(3)

--------------

Pages that refer to this page: `hostid(1) <../man1/hostid.1.html>`__, 
`machine-id(5) <../man5/machine-id.5.html>`__, 
`attributes(7) <../man7/attributes.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/gethostid.3.license.html>`__

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
