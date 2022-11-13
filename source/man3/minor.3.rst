.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

makedev(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   MAKEDEV(3)              Linux Programmer's Manual             MAKEDEV(3)

NAME
-------------------------------------------------

::

          makedev, major, minor - manage a device number


---------------------------------------------------------

::

          #include <sys/sysmacros.h>

          dev_t makedev(unsigned int maj, unsigned int min);

          unsigned int major(dev_t dev);
          unsigned int minor(dev_t dev);


---------------------------------------------------------------

::

          A device ID consists of two parts: a major ID, identifying the
          class of the device, and a minor ID, identifying a specific
          instance of a device in that class.  A device ID is represented
          using the type dev_t.

          Given major and minor device IDs, makedev() combines these to
          produce a device ID, returned as the function result.  This
          device ID can be given to mknod(2), for example.

          The major() and minor() functions perform the converse task:
          given a device ID, they return, respectively, the major and minor
          components.  These macros can be useful to, for example,
          decompose the device IDs in the structure returned by stat(2).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │makedev(), major(), minor()           │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          The makedev(), major(), and minor() functions are not specified
          in POSIX.1, but are present on many other systems.


---------------------------------------------------

::

          These interfaces are defined as macros.  Since glibc 2.3.3, they
          have been aliases for three GNU-specific functions:
          gnu_dev_makedev(), gnu_dev_major(), and gnu_dev_minor().  The
          latter names are exported, but the traditional names are more
          portable.

          The BSDs expose the definitions for these macros via
          <sys/types.h>.  Depending on the version, glibc also exposes
          definitions for these macros from that header file if suitable
          feature test macros are defined.  However, this behavior was
          deprecated in glibc 2.25, and since glibc 2.28, <sys/types.h> no
          longer provides these definitions.


---------------------------------------------------------

::

          mknod(2), stat(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     MAKEDEV(3)

--------------

Pages that refer to this page: `mknod(2) <../man2/mknod.2.html>`__, 
`stat(2) <../man2/stat.2.html>`__, 
`udev_device_new_from_syspath(3) <../man3/udev_device_new_from_syspath.3.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/makedev.3.license.html>`__

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
