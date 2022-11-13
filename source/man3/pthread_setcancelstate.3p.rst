.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_setcancelstate(3p) — Linux manual page
==============================================

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

   PTHREAD_SETCANCELSTATE(3P)SIX Programmer's ManualREAD_SETCANCELSTATE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_setcancelstate, pthread_setcanceltype, pthread_testcancel
          — set cancelability state


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_setcancelstate(int state, int *oldstate);
          int pthread_setcanceltype(int type, int *oldtype);
          void pthread_testcancel(void);


---------------------------------------------------------------

::

          The pthread_setcancelstate() function shall atomically both set
          the calling thread's cancelability state to the indicated state
          and return the previous cancelability state at the location
          referenced by oldstate.  Legal values for state are
          PTHREAD_CANCEL_ENABLE and PTHREAD_CANCEL_DISABLE.

          The pthread_setcanceltype() function shall atomically both set
          the calling thread's cancelability type to the indicated type and
          return the previous cancelability type at the location referenced
          by oldtype.  Legal values for type are PTHREAD_CANCEL_DEFERRED
          and PTHREAD_CANCEL_ASYNCHRONOUS.

          The cancelability state and type of any newly created threads,
          including the thread in which main() was first invoked, shall be
          PTHREAD_CANCEL_ENABLE and PTHREAD_CANCEL_DEFERRED respectively.

          The pthread_testcancel() function shall create a cancellation
          point in the calling thread. The pthread_testcancel() function
          shall have no effect if cancelability is disabled.


-----------------------------------------------------------------

::

          If successful, the pthread_setcancelstate() and
          pthread_setcanceltype() functions shall return zero; otherwise,
          an error number shall be returned to indicate the error.


-----------------------------------------------------

::

          The pthread_setcancelstate() function may fail if:

          EINVAL The specified state is not PTHREAD_CANCEL_ENABLE or
                 PTHREAD_CANCEL_DISABLE.

          The pthread_setcanceltype() function may fail if:

          EINVAL The specified type is not PTHREAD_CANCEL_DEFERRED or
                 PTHREAD_CANCEL_ASYNCHRONOUS.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          In order to write a signal handler for an asynchronous signal
          which can run safely in a cancellable thread,
          pthread_setcancelstate() must be used to disable cancellation for
          the duration of any calls that the signal handler makes which are
          cancellation points. However, the standard does not permit
          strictly conforming applications to call pthread_setcancelstate()
          from a signal handler since it is not currently required to be
          async-signal-safe. On implementations where
          pthread_setcancelstate() is not async-signal-safe, alternatives
          are to ensure either that the corresponding signals are blocked
          during execution of functions that are not async-cancel-safe or
          that cancellation is disabled during times when those signals
          could be delivered. Implementations are strongly encouraged to
          make pthread_setcancelstate() async-signal-safe.


-----------------------------------------------------------

::

          The pthread_setcancelstate() and pthread_setcanceltype()
          functions control the points at which a thread may be
          asynchronously canceled. For cancellation control to be usable in
          modular fashion, some rules need to be followed.

          An object can be considered to be a generalization of a
          procedure. It is a set of procedures and global variables written
          as a unit and called by clients not known by the object. Objects
          may depend on other objects.

          First, cancelability should only be disabled on entry to an
          object, never explicitly enabled. On exit from an object, the
          cancelability state should always be restored to its value on
          entry to the object.

          This follows from a modularity argument: if the client of an
          object (or the client of an object that uses that object) has
          disabled cancelability, it is because the client does not want to
          be concerned about cleaning up if the thread is canceled while
          executing some sequence of actions. If an object is called in
          such a state and it enables cancelability and a cancellation
          request is pending for that thread, then the thread is canceled,
          contrary to the wish of the client that disabled.

          Second, the cancelability type may be explicitly set to either
          deferred or asynchronous upon entry to an object. But as with the
          cancelability state, on exit from an object the cancelability
          type should always be restored to its value on entry to the
          object.

          Finally, only functions that are cancel-safe may be called from a
          thread that is asynchronously cancelable.


---------------------------------------------------------------------------

::

          The pthread_setcancelstate() function may be added to the table
          of async-signal-safe functions in Section 2.4.3, Signal Actions.


---------------------------------------------------------

::

          pthread_cancel(3p)

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

   IEEE/The Open Group               2017        PTHREAD_SETCANCELSTATE(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_cancel(3p) <../man3/pthread_cancel.3p.html>`__, 
`pthread_cleanup_pop(3p) <../man3/pthread_cleanup_pop.3p.html>`__, 
`pthread_testcancel(3p) <../man3/pthread_testcancel.3p.html>`__

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
