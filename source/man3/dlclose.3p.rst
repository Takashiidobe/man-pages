.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dlclose(3p) — Linux manual page
===============================

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

   DLCLOSE(3P)             POSIX Programmer's Manual            DLCLOSE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          dlclose — close a symbol table handle


---------------------------------------------------------

::

          #include <dlfcn.h>

          int dlclose(void *handle);


---------------------------------------------------------------

::

          The dlclose() function shall inform the system that the symbol
          table handle specified by handle is no longer needed by the
          application.

          An application writer may use dlclose() to make a statement of
          intent on the part of the process, but this statement does not
          create any requirement upon the implementation. When the symbol
          table handle is closed, the implementation may unload the
          executable object files that were loaded by dlopen() when the
          symbol table handle was opened and those that were loaded by
          dlsym() when using the symbol table handle identified by handle.

          Once a symbol table handle has been closed, an application should
          assume that any symbols (function identifiers and data object
          identifiers) made visible using handle, are no longer available
          to the process.

          Although a dlclose() operation is not required to remove any
          functions or data objects from the address space, neither is an
          implementation prohibited from doing so. The only restriction on
          such a removal is that no function nor data object shall be
          removed to which references have been relocated, until or unless
          all such references are removed. For instance, an executable
          object file that had been loaded with a dlopen() operation
          specifying the RTLD_GLOBAL flag might provide a target for
          dynamic relocations performed in the processing of other
          relocatable objects—in such environments, an application may
          assume that no relocation, once made, shall be undone or remade
          unless the executable object file containing the relocated object
          has itself been removed.


-----------------------------------------------------------------

::

          If the referenced symbol table handle was successfully closed,
          dlclose() shall return 0. If handle does not refer to an open
          symbol table handle or if the symbol table handle could not be
          closed, dlclose() shall return a non-zero value. More detailed
          diagnostic information shall be available through dlerror().


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          The following example illustrates use of dlopen() and dlclose():

              #include <dlfcn.h>
              int eret;
              void *mylib;
              ...
              /* Open a dynamic library and then close it ... */
              mylib = dlopen("mylib.so", RTLD_LOCAL | RTLD_LAZY);
              ...
              eret = dlclose(mylib);
              ...


---------------------------------------------------------------------------

::

          A conforming application should employ a symbol table handle
          returned from a dlopen() invocation only within a given scope
          bracketed by a dlopen() operation and the corresponding dlclose()
          operation. Implementations are free to use reference counting or
          other techniques such that multiple calls to dlopen() referencing
          the same executable object file may return a pointer to the same
          data object as the symbol table handle.

          Implementations are also free to re-use a handle. For these
          reasons, the value of a handle must be treated as an opaque data
          type by the application, used only in calls to dlsym() and
          dlclose().


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          dlerror(3p), dlopen(3p), dlsym(3p)

          The Base Definitions volume of POSIX.1‐2017, dlfcn.h(0p)


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

   IEEE/The Open Group               2017                       DLCLOSE(3P)

--------------

Pages that refer to this page:
`dlfcn.h(0p) <../man0/dlfcn.h.0p.html>`__, 
`dlerror(3p) <../man3/dlerror.3p.html>`__, 
`dlopen(3p) <../man3/dlopen.3p.html>`__, 
`dlsym(3p) <../man3/dlsym.3p.html>`__

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
