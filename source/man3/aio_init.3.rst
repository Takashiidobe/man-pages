.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aio_init(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AIO_INIT(3)             Linux Programmer's Manual            AIO_INIT(3)

NAME
-------------------------------------------------

::

          aio_init - asynchronous I/O initialization


---------------------------------------------------------

::

          #define _GNU_SOURCE         /* See feature_test_macros(7) */
          #include <aio.h>

          void aio_init(const struct aioinit *init);

          Link with -lrt.


---------------------------------------------------------------

::

          The GNU-specific aio_init() function allows the caller to provide
          tuning hints to the glibc POSIX AIO implementation.  Use of this
          function is optional, but to be effective, it must be called
          before employing any other functions in the POSIX AIO API.

          The tuning information is provided in the buffer pointed to by
          the argument init.  This buffer is a structure of the following
          form:

              struct aioinit {
                  int aio_threads;    /* Maximum number of threads */
                  int aio_num;        /* Number of expected simultaneous
                                         requests */
                  int aio_locks;      /* Not used */
                  int aio_usedba;     /* Not used */
                  int aio_debug;      /* Not used */
                  int aio_numusers;   /* Not used */
                  int aio_idle_time;  /* Number of seconds before idle thread
                                         terminates (since glibc 2.2) */
                  int aio_reserved;
              };

          The following fields are used in the aioinit structure:

          aio_threads
                 This field specifies the maximum number of worker threads
                 that may be used by the implementation.  If the number of
                 outstanding I/O operations exceeds this limit, then excess
                 operations will be queued until a worker thread becomes
                 free.  If this field is specified with a value less than
                 1, the value 1 is used.  The default value is 20.

          aio_num
                 This field should specify the maximum number of
                 simultaneous I/O requests that the caller expects to
                 enqueue.  If a value less than 32 is specified for this
                 field, it is rounded up to 32.  The default value is 64.

          aio_idle_time
                 This field specifies the amount of time in seconds that a
                 worker thread should wait for further requests before
                 terminating, after having completed a previous request.
                 The default value is 1.


---------------------------------------------------------

::

          The aio_init() function is available since glibc 2.1.


-------------------------------------------------------------------

::

          This function is a GNU extension.


---------------------------------------------------------

::

          aio(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-08-13                    AIO_INIT(3)

--------------

Pages that refer to this page: `aio(7) <../man7/aio.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/aio_init.3.license.html>`__

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
