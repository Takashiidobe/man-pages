.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\_longjmp(3p) — Linux manual page
=================================

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

   _LONGJMP(3P)            POSIX Programmer's Manual           _LONGJMP(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          _longjmp, _setjmp — non-local goto


---------------------------------------------------------

::

          #include <setjmp.h>

          void _longjmp(jmp_buf env, int val);
          int _setjmp(jmp_buf env);


---------------------------------------------------------------

::

          The _longjmp() and _setjmp() functions shall be equivalent to
          longjmp() and setjmp(), respectively, with the additional
          restriction that _longjmp() and _setjmp() shall not manipulate
          the signal mask.

          If _longjmp() is called even though env was never initialized by
          a call to _setjmp(), or when the last such call was in a function
          that has since returned, the results are undefined.


-----------------------------------------------------------------

::

          Refer to longjmp(3p) and setjmp(3p).


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          If _longjmp() is executed and the environment in which _setjmp()
          was executed no longer exists, errors can occur. The conditions
          under which the environment of the _setjmp() no longer exists
          include exiting the function that contains the _setjmp() call,
          and exiting an inner block with temporary storage. This condition
          might not be detectable, in which case the _longjmp() occurs and,
          if the environment no longer exists, the contents of the
          temporary storage of an inner block are unpredictable. This
          condition might also cause unexpected process termination. If the
          function has returned, the results are undefined.

          Passing longjmp() a pointer to a buffer not created by setjmp(),
          passing _longjmp() a pointer to a buffer not created by
          _setjmp(), passing siglongjmp() a pointer to a buffer not created
          by sigsetjmp(), or passing any of these three functions a buffer
          that has been modified by the user can cause all the problems
          listed above, and more.

          The _longjmp() and _setjmp() functions are included to support
          programs written to historical system interfaces. New
          applications should use siglongjmp() and sigsetjmp()
          respectively.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The _longjmp() and _setjmp() functions may be removed in a future
          version.


---------------------------------------------------------

::

          longjmp(3p), setjmp(3p), siglongjmp(3p), sigsetjmp(3p)

          The Base Definitions volume of POSIX.1‐2017, setjmp.h(0p)


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

   IEEE/The Open Group               2017                      _LONGJMP(3P)

--------------

Pages that refer to this page:
`setjmp.h(0p) <../man0/setjmp.h.0p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__

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
