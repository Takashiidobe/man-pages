.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ftok(3) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FTOK(3)                 Linux Programmer's Manual                FTOK(3)

NAME
-------------------------------------------------

::

          ftok - convert a pathname and a project identifier to a System V
          IPC key


---------------------------------------------------------

::

          #include <sys/ipc.h>

          key_t ftok(const char *pathname, int proj_id);


---------------------------------------------------------------

::

          The ftok() function uses the identity of the file named by the
          given pathname (which must refer to an existing, accessible file)
          and the least significant 8 bits of proj_id (which must be
          nonzero) to generate a key_t type System V IPC key, suitable for
          use with msgget(2), semget(2), or shmget(2).

          The resulting value is the same for all pathnames that name the
          same file, when the same value of proj_id is used.  The value
          returned should be different when the (simultaneously existing)
          files or the project IDs differ.


-----------------------------------------------------------------

::

          On success, the generated key_t value is returned.  On failure -1
          is returned, with errno indicating the error as for the stat(2)
          system call.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │ftok()                                │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          On some ancient systems, the prototype was:

              key_t ftok(char *pathname, char proj_id);

          Today, proj_id is an int, but still only 8 bits are used.
          Typical usage has an ASCII character proj_id, that is why the
          behavior is said to be undefined when proj_id is zero.

          Of course, no guarantee can be given that the resulting key_t is
          unique.  Typically, a best-effort attempt combines the given
          proj_id byte, the lower 16 bits of the inode number, and the
          lower 8 bits of the device number into a 32-bit result.
          Collisions may easily happen, for example between files on
          /dev/hda1 and files on /dev/sda1.


---------------------------------------------------------

::

          See semget(2).


---------------------------------------------------------

::

          msgget(2), semget(2), shmget(2), stat(2), sysvipc(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                        FTOK(3)

--------------

Pages that refer to this page: `ipcrm(1) <../man1/ipcrm.1.html>`__, 
`msgget(2) <../man2/msgget.2.html>`__, 
`semget(2) <../man2/semget.2.html>`__, 
`shmget(2) <../man2/shmget.2.html>`__, 
`sysvipc(7) <../man7/sysvipc.7.html>`__, 
`migratepages(8) <../man8/migratepages.8.html>`__, 
`numactl(8) <../man8/numactl.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/ftok.3.license.html>`__

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
