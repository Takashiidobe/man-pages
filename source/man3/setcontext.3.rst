.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getcontext(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   GETCONTEXT(3)           Linux Programmer's Manual          GETCONTEXT(3)

NAME
-------------------------------------------------

::

          getcontext, setcontext - get or set the user context


---------------------------------------------------------

::

          #include <ucontext.h>

          int getcontext(ucontext_t *ucp);
          int setcontext(const ucontext_t *ucp);


---------------------------------------------------------------

::

          In a System V-like environment, one has the two types mcontext_t
          and ucontext_t defined in <ucontext.h> and the four functions
          getcontext(), setcontext(), makecontext(3), and swapcontext(3)
          that allow user-level context switching between multiple threads
          of control within a process.

          The mcontext_t type is machine-dependent and opaque.  The
          ucontext_t type is a structure that has at least the following
          fields:

              typedef struct ucontext_t {
                  struct ucontext_t *uc_link;
                  sigset_t          uc_sigmask;
                  stack_t           uc_stack;
                  mcontext_t        uc_mcontext;
                  ...
              } ucontext_t;

          with sigset_t and stack_t defined in <signal.h>.  Here uc_link
          points to the context that will be resumed when the current
          context terminates (in case the current context was created using
          makecontext(3)), uc_sigmask is the set of signals blocked in this
          context (see sigprocmask(2)), uc_stack is the stack used by this
          context (see sigaltstack(2)), and uc_mcontext is the machine-
          specific representation of the saved context, that includes the
          calling thread's machine registers.

          The function getcontext() initializes the structure pointed to by
          ucp to the currently active context.

          The function setcontext() restores the user context pointed to by
          ucp.  A successful call does not return.  The context should have
          been obtained by a call of getcontext(), or makecontext(3), or
          received as the third argument to a signal handler (see the
          discussion of the SA_SIGINFO flag in sigaction(2)).

          If the context was obtained by a call of getcontext(), program
          execution continues as if this call just returned.

          If the context was obtained by a call of makecontext(3), program
          execution continues by a call to the function func specified as
          the second argument of that call to makecontext(3).  When the
          function func returns, we continue with the uc_link member of the
          structure ucp specified as the first argument of that call to
          makecontext(3).  When this member is NULL, the thread exits.

          If the context was obtained by a call to a signal handler, then
          old standard text says that "program execution continues with the
          program instruction following the instruction interrupted by the
          signal".  However, this sentence was removed in SUSv2, and the
          present verdict is "the result is unspecified".


-----------------------------------------------------------------

::

          When successful, getcontext() returns 0 and setcontext() does not
          return.  On error, both return -1 and set errno to indicate the
          error.


-----------------------------------------------------

::

          None defined.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌─────────────────────────────┬───────────────┬──────────────────┐
          │Interface                    │ Attribute     │ Value            │
          ├─────────────────────────────┼───────────────┼──────────────────┤
          │getcontext(), setcontext()   │ Thread safety │ MT-Safe race:ucp │
          └─────────────────────────────┴───────────────┴──────────────────┘


-------------------------------------------------------------------

::

          SUSv2, POSIX.1-2001.  POSIX.1-2008 removes the specification of
          getcontext(), citing portability issues, and recommending that
          applications be rewritten to use POSIX threads instead.


---------------------------------------------------

::

          The earliest incarnation of this mechanism was the
          setjmp(3)/longjmp(3) mechanism.  Since that does not define the
          handling of the signal context, the next stage was the
          sigsetjmp(3)/siglongjmp(3) pair.  The present mechanism gives
          much more control.  On the other hand, there is no easy way to
          detect whether a return from getcontext() is from the first call,
          or via a setcontext() call.  The user has to invent their own
          bookkeeping device, and a register variable won't do since
          registers are restored.

          When a signal occurs, the current user context is saved and a new
          context is created by the kernel for the signal handler.  Do not
          leave the handler using longjmp(3): it is undefined what would
          happen with contexts.  Use siglongjmp(3) or setcontext() instead.


---------------------------------------------------------

::

          sigaction(2), sigaltstack(2), sigprocmask(2), longjmp(3),
          makecontext(3), sigsetjmp(3), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  GETCONTEXT(3)

--------------

Pages that refer to this page: `prctl(2) <../man2/prctl.2.html>`__, 
`sigaction(2) <../man2/sigaction.2.html>`__, 
`sigreturn(2) <../man2/sigreturn.2.html>`__, 
`makecontext(3) <../man3/makecontext.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/getcontext.3.license.html>`__

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
