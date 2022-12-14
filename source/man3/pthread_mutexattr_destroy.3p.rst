.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_mutexattr_destroy(3p) — Linux manual page
=================================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_MUTEXATTR_DESTROY(3P) Programmer's ManualD_MUTEXATTR_DESTROY(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_mutexattr_destroy, pthread_mutexattr_init — destroy and
          initialize the mutex attributes object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_mutexattr_destroy(pthread_mutexattr_t *attr);
          int pthread_mutexattr_init(pthread_mutexattr_t *attr);


---------------------------------------------------------------

::

          The pthread_mutexattr_destroy() function shall destroy a mutex
          attributes object; the object becomes, in effect, uninitialized.
          An implementation may cause pthread_mutexattr_destroy() to set
          the object referenced by attr to an invalid value.

          A destroyed attr attributes object can be reinitialized using
          pthread_mutexattr_init(); the results of otherwise referencing
          the object after it has been destroyed are undefined.

          The pthread_mutexattr_init() function shall initialize a mutex
          attributes object attr with the default value for all of the
          attributes defined by the implementation.

          Results are undefined if pthread_mutexattr_init() is called
          specifying an already initialized attr attributes object.

          After a mutex attributes object has been used to initialize one
          or more mutexes, any function affecting the attributes object
          (including destruction) shall not affect any previously
          initialized mutexes.

          The behavior is undefined if the value specified by the attr
          argument to pthread_mutexattr_destroy() does not refer to an
          initialized mutex attributes object.


-----------------------------------------------------------------

::

          Upon successful completion, pthread_mutexattr_destroy() and
          pthread_mutexattr_init() shall return zero; otherwise, an error
          number shall be returned to indicate the error.


-----------------------------------------------------

::

          The pthread_mutexattr_init() function shall fail if:

          ENOMEM Insufficient memory exists to initialize the mutex
                 attributes object.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the attr
          argument to pthread_mutexattr_destroy() does not refer to an
          initialized mutex attributes object, it is recommended that the
          function should fail and report an [EINVAL] error.

          See pthread_attr_destroy(3p) for a general explanation of
          attributes. Attributes objects allow implementations to
          experiment with useful extensions and permit extension of this
          volume of POSIX.1‐2017 without changing the existing functions.
          Thus, they provide for future extensibility of this volume of
          POSIX.1‐2017 and reduce the temptation to standardize prematurely
          on semantics that are not yet widely implemented or understood.

          Examples of possible additional mutex attributes that have been
          discussed are spin_only, limited_spin, no_spin, recursive, and
          metered.  (To explain what the latter attributes might mean:
          recursive mutexes would allow for multiple re-locking by the
          current owner; metered mutexes would transparently keep records
          of queue length, wait time, and so on.) Since there is not yet
          wide agreement on the usefulness of these resulting from shared
          implementation and usage experience, they are not yet specified
          in this volume of POSIX.1‐2017. Mutex attributes objects,
          however, make it possible to test out these concepts for possible
          standardization at a later time.

      Mutex Attributes and Performance
          Care has been taken to ensure that the default values of the
          mutex attributes have been defined such that mutexes initialized
          with the defaults have simple enough semantics so that the
          locking and unlocking can be done with the equivalent of a test-
          and-set instruction (plus possibly a few other basic
          instructions).

          There is at least one implementation method that can be used to
          reduce the cost of testing at lock-time if a mutex has non-
          default attributes. One such method that an implementation can
          employ (and this can be made fully transparent to fully
          conforming POSIX applications) is to secretly pre-lock any
          mutexes that are initialized to non-default attributes. Any later
          attempt to lock such a mutex causes the implementation to branch
          to the ``slow path'' as if the mutex were unavailable; then, on
          the slow path, the implementation can do the ``real work'' to
          lock a non-default mutex. The underlying unlock operation is more
          complicated since the implementation never really wants to
          release the pre-lock on this kind of mutex. This illustrates
          that, depending on the hardware, there may be certain
          optimizations that can be used so that whatever mutex attributes
          are considered ``most frequently used'' can be processed most
          efficiently.

      Process Shared Memory and Synchronization
          The existence of memory mapping functions in this volume of
          POSIX.1‐2017 leads to the possibility that an application may
          allocate the synchronization objects from this section in memory
          that is accessed by multiple processes (and therefore, by threads
          of multiple processes).

          In order to permit such usage, while at the same time keeping the
          usual case (that is, usage within a single process) efficient, a
          process-shared option has been defined.

          If an implementation supports the _POSIX_THREAD_PROCESS_SHARED
          option, then the process-shared attribute can be used to indicate
          that mutexes or condition variables may be accessed by threads of
          multiple processes.

          The default setting of PTHREAD_PROCESS_PRIVATE has been chosen
          for the process-shared attribute so that the most efficient forms
          of these synchronization objects are created by default.

          Synchronization variables that are initialized with the
          PTHREAD_PROCESS_PRIVATE process-shared attribute may only be
          operated on by threads in the process that initialized them.
          Synchronization variables that are initialized with the
          PTHREAD_PROCESS_SHARED process-shared attribute may be operated
          on by any thread in any process that has access to it. In
          particular, these processes may exist beyond the lifetime of the
          initializing process. For example, the following code implements
          a simple counting semaphore in a mapped file that may be used by
          many processes.

              /* sem.h */
              struct semaphore {
                  pthread_mutex_t lock;
                  pthread_cond_t nonzero;
                  unsigned count;
              };
              typedef struct semaphore semaphore_t;

              semaphore_t *semaphore_create(char *semaphore_name);
              semaphore_t *semaphore_open(char *semaphore_name);
              void semaphore_post(semaphore_t *semap);
              void semaphore_wait(semaphore_t *semap);
              void semaphore_close(semaphore_t *semap);

              /* sem.c */
              #include <sys/types.h>
              #include <sys/stat.h>
              #include <sys/mman.h>
              #include <fcntl.h>
              #include <pthread.h>
              #include "sem.h"

              semaphore_t *
              semaphore_create(char *semaphore_name)
              {
              int fd;
                  semaphore_t *semap;
                  pthread_mutexattr_t psharedm;
                  pthread_condattr_t psharedc;

                  fd = open(semaphore_name, O_RDWR | O_CREAT | O_EXCL, 0666);
                  if (fd < 0)
                      return (NULL);
                  (void) ftruncate(fd, sizeof(semaphore_t));
                  (void) pthread_mutexattr_init(&psharedm);
                  (void) pthread_mutexattr_setpshared(&psharedm,
                      PTHREAD_PROCESS_SHARED);
                  (void) pthread_condattr_init(&psharedc);
                  (void) pthread_condattr_setpshared(&psharedc,
                      PTHREAD_PROCESS_SHARED);
                  semap = (semaphore_t *) mmap(NULL, sizeof(semaphore_t),
                          PROT_READ | PROT_WRITE, MAP_SHARED,
                          fd, 0);
                  close (fd);
                  (void) pthread_mutex_init(&semap->lock, &psharedm);
                  (void) pthread_cond_init(&semap->nonzero, &psharedc);
                  semap->count = 0;
                  return (semap);
              }

              semaphore_t *
              semaphore_open(char *semaphore_name)
              {
                  int fd;
                  semaphore_t *semap;

                  fd = open(semaphore_name, O_RDWR, 0666);
                  if (fd < 0)
                      return (NULL);
                  semap = (semaphore_t *) mmap(NULL, sizeof(semaphore_t),
                          PROT_READ | PROT_WRITE, MAP_SHARED,
                          fd, 0);
                  close (fd);
                  return (semap);
              }

              void
              semaphore_post(semaphore_t *semap)
              {
                  pthread_mutex_lock(&semap->lock);
                  if (semap->count == 0)
                      pthread_cond_signal(&semapx->nonzero);
                  semap->count++;
                  pthread_mutex_unlock(&semap->lock);
              }

              void
              semaphore_wait(semaphore_t *semap)
              {
                  pthread_mutex_lock(&semap->lock);
                  while (semap->count == 0)
                      pthread_cond_wait(&semap->nonzero, &semap->lock);
                  semap->count--;
                  pthread_mutex_unlock(&semap->lock);
              }

              void
              semaphore_close(semaphore_t *semap)
              {
                  munmap((void *) semap, sizeof(semaphore_t));
              }

          The following code is for three separate processes that create,
          post, and wait on a semaphore in the file /tmp/semaphore.  Once
          the file is created, the post and wait programs increment and
          decrement the counting semaphore (waiting and waking as required)
          even though they did not initialize the semaphore.

              /* create.c */
              #include "pthread.h"
              #include "sem.h"

              int
              main()
              {
                  semaphore_t *semap;

                  semap = semaphore_create("/tmp/semaphore");
                  if (semap == NULL)
                      exit(1);
                  semaphore_close(semap);
                  return (0);
              }

              /* post */
              #include "pthread.h"
              #include "sem.h"

              int
              main()
              {
                  semaphore_t *semap;

                  semap = semaphore_open("/tmp/semaphore");
                  if (semap == NULL)
                      exit(1);
                  semaphore_post(semap);
                  semaphore_close(semap);
                  return (0);
              }

              /* wait */
              #include "pthread.h"
              #include "sem.h"

              int
              main()
              {
                  semaphore_t *semap;

                  semap = semaphore_open("/tmp/semaphore");
                  if (semap == NULL)
                      exit(1);
                  semaphore_wait(semap);
                  semaphore_close(semap);
                  return (0);
              }


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_cond_destroy(3p), pthread_create(3p),
          pthread_mutex_destroy(3p)

          The Base Definitions volume of POSIX.1‐2017, pthread.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017     PTHREAD_MUTEXATTR_DESTROY(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_mutexattr_getpshared(3p) <../man3/pthread_mutexattr_getpshared.3p.html>`__, 
`pthread_mutexattr_init(3p) <../man3/pthread_mutexattr_init.3p.html>`__

--------------

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
