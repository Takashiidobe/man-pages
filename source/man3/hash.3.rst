.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

hash(3) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   HASH(3)                 Linux Programmer's Manual                HASH(3)

NAME
-------------------------------------------------

::

          hash - hash database access method


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <db.h>


---------------------------------------------------------------

::

          Note well: This page documents interfaces provided in glibc up
          until version 2.1.  Since version 2.2, glibc no longer provides
          these interfaces.  Probably, you are looking for the APIs
          provided by the libdb library instead.

          The routine dbopen(3) is the library interface to database files.
          One of the supported file formats is hash files.  The general
          description of the database access methods is in dbopen(3), this
          manual page describes only the hash-specific information.

          The hash data structure is an extensible, dynamic hashing scheme.

          The access-method-specific data structure provided to dbopen(3)
          is defined in the <db.h> include file as follows:

              typedef struct {
                  unsigned int       bsize;
                  unsigned int       ffactor;
                  unsigned int       nelem;
                  unsigned int       cachesize;
                  uint32_t         (*hash)(const void *, size_t);
                  int         lorder;
              } HASHINFO;

          The elements of this structure are as follows:

          bsize  defines the hash table bucket size, and is, by default,
                 256 bytes.  It may be preferable to increase the page size
                 for disk-resident tables and tables with large data items.

          ffactor
                 indicates a desired density within the hash table.  It is
                 an approximation of the number of keys allowed to
                 accumulate in any one bucket, determining when the hash
                 table grows or shrinks.  The default value is 8.

          nelem  is an estimate of the final size of the hash table.  If
                 not set or set too low, hash tables will expand gracefully
                 as keys are entered, although a slight performance
                 degradation may be noticed.  The default value is 1.

          cachesize
                 is the suggested maximum size, in bytes, of the memory
                 cache.  This value is only advisory, and the access method
                 will allocate more memory rather than fail.

          hash   is a user-defined hash function.  Since no hash function
                 performs equally well on all possible data, the user may
                 find that the built-in hash function does poorly on a
                 particular data set.  A user-specified hash functions must
                 take two arguments (a pointer to a byte string and a
                 length) and return a 32-bit quantity to be used as the
                 hash value.

          lorder is the byte order for integers in the stored database
                 metadata.  The number should represent the order as an
                 integer; for example, big endian order would be the number
                 4,321.  If lorder is 0 (no order is specified), the
                 current host order is used.  If the file already exists,
                 the specified value is ignored and the value specified
                 when the tree was created is used.

          If the file already exists (and the O_TRUNC flag is not
          specified), the values specified for bsize, ffactor, lorder, and
          nelem are ignored and the values specified when the tree was
          created are used.

          If a hash function is specified, hash_open attempts to determine
          if the hash function specified is the same as the one with which
          the database was created, and fails if it is not.

          Backward-compatible interfaces to the routines described in
          dbm(3), and ndbm(3) are provided, however these interfaces are
          not compatible with previous file formats.


-----------------------------------------------------

::

          The hash access method routines may fail and set errno for any of
          the errors specified for the library routine dbopen(3).


-------------------------------------------------

::

          Only big and little endian byte order are supported.


---------------------------------------------------------

::

          btree(3), dbopen(3), mpool(3), recno(3)

          Dynamic Hash Tables, Per-Ake Larson, Communications of the ACM,
          April 1988.

          A New Hash Package for UNIX, Margo Seltzer, USENIX Proceedings,
          Winter 1991.

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   4.4 Berkeley Distribution      2017-09-15                        HASH(3)

--------------

Pages that refer to this page: `btree(3) <../man3/btree.3.html>`__, 
`dbopen(3) <../man3/dbopen.3.html>`__, 
`mpool(3) <../man3/mpool.3.html>`__, 
`recno(3) <../man3/recno.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/hash.3.license.html>`__

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
