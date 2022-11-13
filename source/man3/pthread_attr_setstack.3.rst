.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_attr_setstack(3) — Linux manual page
============================================

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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_ATTR_SETSTACK(3)Linux Programmer's ManualTHREAD_ATTR_SETSTACK(3)

NAME
-------------------------------------------------

::

          pthread_attr_setstack, pthread_attr_getstack - set/get stack
          attributes in thread attributes object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_attr_setstack(pthread_attr_t *attr,
                                    void *stackaddr, size_t stacksize);
          int pthread_attr_getstack(const pthread_attr_t *restrict attr,
                                    void **restrict stackaddr,
                                    size_t *restrict stacksize);

          Compile and link with -pthread.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          pthread_attr_getstack(), pthread_attr_setstack():
              _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          The pthread_attr_setstack() function sets the stack address and
          stack size attributes of the thread attributes object referred to
          by attr to the values specified in stackaddr and stacksize,
          respectively.  These attributes specify the location and size of
          the stack that should be used by a thread that is created using
          the thread attributes object attr.

          stackaddr should point to the lowest addressable byte of a buffer
          of stacksize bytes that was allocated by the caller.  The pages
          of the allocated buffer should be both readable and writable.

          The pthread_attr_getstack() function returns the stack address
          and stack size attributes of the thread attributes object
          referred to by attr in the buffers pointed to by stackaddr and
          stacksize, respectively.


-----------------------------------------------------------------

::

          On success, these functions return 0; on error, they return a
          nonzero error number.


-----------------------------------------------------

::

          pthread_attr_setstack() can fail with the following error:

          EINVAL stacksize is less than PTHREAD_STACK_MIN (16384) bytes.
                 On some systems, this error may also occur if stackaddr or
                 stackaddr + stacksize is not suitably aligned.

          POSIX.1 also documents an EACCES error if the stack area
          described by stackaddr and stacksize is not both readable and
          writable by the caller.


---------------------------------------------------------

::

          These functions are provided by glibc since version 2.2.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_attr_setstack(),              │ Thread safety │ MT-Safe │
          │pthread_attr_getstack()               │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          These functions are provided for applications that must ensure
          that a thread's stack is placed in a particular location.  For
          most applications, this is not necessary, and the use of these
          functions should be avoided.  (Use pthread_attr_setstacksize(3)
          if an application simply requires a stack size other than the
          default.)

          When an application employs pthread_attr_setstack(), it takes
          over the responsibility of allocating the stack.  Any guard size
          value that was set using pthread_attr_setguardsize(3) is ignored.
          If deemed necessary, it is the application's responsibility to
          allocate a guard area (one or more pages protected against
          reading and writing) to handle the possibility of stack overflow.

          The address specified in stackaddr should be suitably aligned:
          for full portability, align it on a page boundary
          (sysconf(_SC_PAGESIZE)).  posix_memalign(3) may be useful for
          allocation.  Probably, stacksize should also be a multiple of the
          system page size.

          If attr is used to create multiple threads, then the caller must
          change the stack address attribute between calls to
          pthread_create(3); otherwise, the threads will attempt to use the
          same memory area for their stacks, and chaos will ensue.


---------------------------------------------------------

::

          See pthread_attr_init(3).


---------------------------------------------------------

::

          mmap(2), mprotect(2), posix_memalign(3), pthread_attr_init(3),
          pthread_attr_setguardsize(3), pthread_attr_setstackaddr(3),
          pthread_attr_setstacksize(3), pthread_create(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22       PTHREAD_ATTR_SETSTACK(3)

--------------

Pages that refer to this page:
`pthread_attr_init(3) <../man3/pthread_attr_init.3.html>`__, 
`pthread_attr_setguardsize(3) <../man3/pthread_attr_setguardsize.3.html>`__, 
`pthread_attr_setstackaddr(3) <../man3/pthread_attr_setstackaddr.3.html>`__, 
`pthread_attr_setstacksize(3) <../man3/pthread_attr_setstacksize.3.html>`__, 
`pthread_getattr_default_np(3) <../man3/pthread_getattr_default_np.3.html>`__, 
`pthread_getattr_np(3) <../man3/pthread_getattr_np.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_attr_setstack.3.license.html>`__

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
