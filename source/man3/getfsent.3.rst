.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getfsent(3) — Linux manual page
===============================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETFSENT(3)             Linux Programmer's Manual            GETFSENT(3)

NAME
-------------------------------------------------

::

          getfsent, getfsspec, getfsfile, setfsent, endfsent - handle fstab
          entries


---------------------------------------------------------

::

          #include <fstab.h>

          int setfsent(void);
          struct fstab *getfsent(void);
          void endfsent(void);

          struct fstab *getfsfile(const char *mount_point);
          struct fstab *getfsspec(const char *special_file);


---------------------------------------------------------------

::

          These functions read from the file /etc/fstab.  The struct fstab
          is defined by:

              struct fstab {
                  char       *fs_spec;       /* block device name */
                  char       *fs_file;       /* mount point */
                  char       *fs_vfstype;    /* filesystem type */
                  char       *fs_mntops;     /* mount options */
                  const char *fs_type;       /* rw/rq/ro/sw/xx option */
                  int         fs_freq;       /* dump frequency, in days */
                  int         fs_passno;     /* pass number on parallel dump */
              };

          Here the field fs_type contains (on a *BSD system) one of the
          five strings "rw", "rq", "ro", "sw", "xx" (read-write, read-write
          with quota, read-only, swap, ignore).

          The function setfsent() opens the file when required and
          positions it at the first line.

          The function getfsent() parses the next line from the file.
          (After opening it when required.)

          The function endfsent() closes the file when required.

          The function getfsspec() searches the file from the start and
          returns the first entry found for which the fs_spec field matches
          the special_file argument.

          The function getfsfile() searches the file from the start and
          returns the first entry found for which the fs_file field matches
          the mount_point argument.


-----------------------------------------------------------------

::

          Upon success, the functions getfsent(), getfsfile(), and
          getfsspec() return a pointer to a struct fstab, while setfsent()
          returns 1.  Upon failure or end-of-file, these functions return
          NULL and 0, respectively.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌─────────────┬───────────────┬──────────────────────────────────┐
          │Interface    │ Attribute     │ Value                            │
          ├─────────────┼───────────────┼──────────────────────────────────┤
          │endfsent(),  │ Thread safety │ MT-Unsafe race:fsent             │
          │setfsent()   │               │                                  │
          ├─────────────┼───────────────┼──────────────────────────────────┤
          │getfsent(),  │ Thread safety │ MT-Unsafe race:fsent locale      │
          │getfsspec(), │               │                                  │
          │getfsfile()  │               │                                  │
          └─────────────┴───────────────┴──────────────────────────────────┘


-------------------------------------------------------------------

::

          These functions are not in POSIX.1.  Several operating systems
          have them, for example, *BSD, SunOS, Digital UNIX, AIX (which
          also has a getfstype()).  HP-UX has functions of the same names,
          that however use a struct checklist instead of a struct fstab,
          and calls these functions obsolete, superseded by getmntent(3).


---------------------------------------------------

::

          These functions are not thread-safe.

          Since Linux allows mounting a block special device in several
          places, and since several devices can have the same mount point,
          where the last device with a given mount point is the interesting
          one, while getfsfile() and getfsspec() only return the first
          occurrence, these two functions are not suitable for use under
          Linux.


---------------------------------------------------------

::

          getmntent(3), fstab(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                    GETFSENT(3)

--------------

`Copyright and license for this manual
page <../man3/getfsent.3.license.html>`__

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
