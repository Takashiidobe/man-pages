.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_attr_setstackaddr(3) — Linux manual page
================================================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_ATTR_SETSTACKADDR(3)x Programmer's ManualAD_ATTR_SETSTACKADDR(3)

NAME
-------------------------------------------------

::

          pthread_attr_setstackaddr, pthread_attr_getstackaddr - set/get
          stack address attribute in thread attributes object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_attr_setstackaddr(pthread_attr_t *attr, void *stackaddr);
          int pthread_attr_getstackaddr(const pthread_attr_t *restrict attr,
                                        void **restrict stackaddr);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          These functions are obsolete: do not use them.  Use
          pthread_attr_setstack(3) and pthread_attr_getstack(3) instead.

          The pthread_attr_setstackaddr() function sets the stack address
          attribute of the thread attributes object referred to by attr to
          the value specified in stackaddr.  This attribute specifies the
          location of the stack that should be used by a thread that is
          created using the thread attributes object attr.

          stackaddr should point to a buffer of at least PTHREAD_STACK_MIN
          bytes that was allocated by the caller.  The pages of the
          allocated buffer should be both readable and writable.

          The pthread_attr_getstackaddr() function returns the stack
          address attribute of the thread attributes object referred to by
          attr in the buffer pointed to by stackaddr.


-----------------------------------------------------------------

::

          On success, these functions return 0; on error, they return a
          nonzero error number.


-----------------------------------------------------

::

          No errors are defined (but applications should nevertheless
          handle a possible error return).


---------------------------------------------------------

::

          These functions are provided by glibc since version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_attr_setstackaddr(),          │ Thread safety │ MT-Safe │
          │pthread_attr_getstackaddr()           │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001 specifies these functions but marks them as
          obsolete.  POSIX.1-2008 removes the specification of these
          functions.


---------------------------------------------------

::

          Do not use these functions!  They cannot be portably used, since
          they provide no way of specifying the direction of growth or the
          range of the stack.  For example, on architectures with a stack
          that grows downward, stackaddr specifies the next address past
          the highest address of the allocated stack area.  However, on
          architectures with a stack that grows upward, stackaddr specifies
          the lowest address in the allocated stack area.  By contrast, the
          stackaddr used by pthread_attr_setstack(3) and
          pthread_attr_getstack(3), is always a pointer to the lowest
          address in the allocated stack area (and the stacksize argument
          specifies the range of the stack).


---------------------------------------------------------

::

          pthread_attr_init(3), pthread_attr_setstack(3),
          pthread_attr_setstacksize(3), pthread_create(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22   PTHREAD_ATTR_SETSTACKADDR(3)

--------------

Pages that refer to this page:
`pthread_attr_init(3) <../man3/pthread_attr_init.3.html>`__, 
`pthread_attr_setguardsize(3) <../man3/pthread_attr_setguardsize.3.html>`__, 
`pthread_attr_setstack(3) <../man3/pthread_attr_setstack.3.html>`__, 
`pthread_getattr_default_np(3) <../man3/pthread_getattr_default_np.3.html>`__, 
`pthread_getattr_np(3) <../man3/pthread_getattr_np.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_attr_setstackaddr.3.license.html>`__

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
