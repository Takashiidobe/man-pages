.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

shm_overview(7) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SHM_OVERVIEW(7)         Linux Programmer's Manual        SHM_OVERVIEW(7)

NAME
-------------------------------------------------

::

          shm_overview - overview of POSIX shared memory


---------------------------------------------------------------

::

          The POSIX shared memory API allows processes to communicate
          information by sharing a region of memory.

          The interfaces employed in the API are:

          shm_open(3)
                 Create and open a new object, or open an existing object.
                 This is analogous to open(2).  The call returns a file
                 descriptor for use by the other interfaces listed below.

          ftruncate(2)
                 Set the size of the shared memory object.  (A newly
                 created shared memory object has a length of zero.)

          mmap(2)
                 Map the shared memory object into the virtual address
                 space of the calling process.

          munmap(2)
                 Unmap the shared memory object from the virtual address
                 space of the calling process.

          shm_unlink(3)
                 Remove a shared memory object name.

          close(2)
                 Close the file descriptor allocated by shm_open(3) when it
                 is no longer needed.

          fstat(2)
                 Obtain a stat structure that describes the shared memory
                 object.  Among the information returned by this call are
                 the object's size (st_size), permissions (st_mode), owner
                 (st_uid), and group (st_gid).

          fchown(2)
                 To change the ownership of a shared memory object.

          fchmod(2)
                 To change the permissions of a shared memory object.

      Versions
          POSIX shared memory is supported since Linux 2.4 and glibc 2.2.

      Persistence
          POSIX shared memory objects have kernel persistence: a shared
          memory object will exist until the system is shut down, or until
          all processes have unmapped the object and it has been deleted
          with shm_unlink(3)

      Linking
          Programs using the POSIX shared memory API must be compiled with
          cc -lrt to link against the real-time library, librt.

      Accessing shared memory objects via the filesystem
          On Linux, shared memory objects are created in a (tmpfs(5))
          virtual filesystem, normally mounted under /dev/shm.  Since
          kernel 2.6.19, Linux supports the use of access control lists
          (ACLs) to control the permissions of objects in the virtual
          filesystem.


---------------------------------------------------

::

          Typically, processes must synchronize their access to a shared
          memory object, using, for example, POSIX semaphores.

          System V shared memory (shmget(2), shmop(2), etc.) is an older
          shared memory API.  POSIX shared memory provides a simpler, and
          better designed interface; on the other hand POSIX shared memory
          is somewhat less widely available (especially on older systems)
          than System V shared memory.


---------------------------------------------------------

::

          fchmod(2), fchown(2), fstat(2), ftruncate(2), memfd_create(2),
          mmap(2), mprotect(2), munmap(2), shmget(2), shmop(2),
          shm_open(3), shm_unlink(3), sem_overview(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                SHM_OVERVIEW(7)

--------------

Pages that refer to this page: `intro(2) <../man2/intro.2.html>`__, 
`mmap(2) <../man2/mmap.2.html>`__, 
`shmget(2) <../man2/shmget.2.html>`__, 
`shmop(2) <../man2/shmop.2.html>`__, 
`shm_open(3) <../man3/shm_open.3.html>`__, 
`tmpfs(5) <../man5/tmpfs.5.html>`__, 
`sem_overview(7) <../man7/sem_overview.7.html>`__, 
`sysvipc(7) <../man7/sysvipc.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/shm_overview.7.license.html>`__

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
