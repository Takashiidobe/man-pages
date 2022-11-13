.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dlsym(3p) — Linux manual page
=============================

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

   DLSYM(3P)               POSIX Programmer's Manual              DLSYM(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          dlsym — get the address of a symbol from a symbol table handle


---------------------------------------------------------

::

          #include <dlfcn.h>

          void *dlsym(void *restrict handle, const char *restrict name);


---------------------------------------------------------------

::

          The dlsym() function shall obtain the address of a symbol (a
          function identifier or a data object identifier) defined in the
          symbol table identified by the handle argument. The handle
          argument is a symbol table handle returned from a call to
          dlopen() (and which has not since been released by a call to
          dlclose()), and name is the symbol's name as a character string.
          The return value from dlsym(), cast to a pointer to the type of
          the named symbol, can be used to call (in the case of a function)
          or access the contents of (in the case of a data object) the
          named symbol.

          The dlsym() function shall search for the named symbol in the
          symbol table referenced by handle.  If the symbol table was
          created with lazy loading (see RTLD_LAZY in dlopen()), load
          ordering shall be used in dlsym() operations to relocate
          executable object files needed to resolve the symbol. The symbol
          resolution algorithm used shall be dependency order as described
          in dlopen().

          The RTLD_DEFAULT and RTLD_NEXT symbolic constants (which may be
          defined in <dlfcn.h>) are reserved for future use as special
          values that applications may be allowed to use for handle.


-----------------------------------------------------------------

::

          Upon successful completion, if name names a function identifier,
          dlsym() shall return the address of the function converted from
          type pointer to function to type pointer to void; otherwise,
          dlsym() shall return the address of the data object associated
          with the data object identifier named by name converted from a
          pointer to the type of the data object to a pointer to void.  If
          handle does not refer to a valid symbol table handle or if the
          symbol named by name cannot be found in the symbol table
          associated with handle, dlsym() shall return a null pointer.

          More detailed diagnostic information shall be available through
          dlerror().


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          The following example shows how dlopen() and dlsym() can be used
          to access either a function or a data object. For simplicity,
          error checking has been omitted.

              void *handle;
              int (*fptr)(int), *iptr, result;
              /* open the needed symbol table */
              handle = dlopen("/usr/home/me/libfoo.so", RTLD_LOCAL | RTLD_LAZY);
              /* find the address of the function my_function */
              fptr = (int (*)(int))dlsym(handle, "my_function");
              /* find the address of the data object my_object */
              iptr = (int *)dlsym(handle, "my_OBJ");
              /* invoke my_function, passing the value of my_OBJ as the parameter */
              result = (*fptr)(*iptr);


---------------------------------------------------------------------------

::

          The following special purpose values for handle are reserved for
          future use and have the indicated meanings:

          RTLD_DEFAULT
                      The identifier lookup happens in the normal global
                      scope; that is, a search for an identifier using
                      handle would find the same definition as a direct use
                      of this identifier in the program code.

          RTLD_NEXT   Specifies the next executable object file after this
                      one that defines name.  This one refers to the
                      executable object file containing the invocation of
                      dlsym().  The next executable object file is the one
                      found upon the application of a load order symbol
                      resolution algorithm (see dlopen()).  The next symbol
                      is either one of global scope (because it was
                      introduced as part of the original process image or
                      because it was added with a dlopen() operation
                      including the RTLD_GLOBAL flag), or is in an
                      executable object file that was included in the same
                      dlopen() operation that loaded this one.

          The RTLD_NEXT flag is useful to navigate an intentionally created
          hierarchy of multiply-defined symbols created through
          interposition. For example, if a program wished to create an
          implementation of malloc() that embedded some statistics
          gathering about memory allocations, such an implementation could
          use the real malloc() definition to perform the memory allocation
          — and itself only embed the necessary logic to implement the
          statistics gathering function.

          Note that conversion from a void * pointer to a function pointer
          as in:

              fptr = (int (*)(int))dlsym(handle, "my_function");

          is not defined by the ISO C standard. This standard requires this
          conversion to work correctly on conforming implementations.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          dlclose(3p), dlerror(3p), dlopen(3p)

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

   IEEE/The Open Group               2017                         DLSYM(3P)

--------------

Pages that refer to this page:
`dlfcn.h(0p) <../man0/dlfcn.h.0p.html>`__, 
`dlclose(3p) <../man3/dlclose.3p.html>`__, 
`dlerror(3p) <../man3/dlerror.3p.html>`__, 
`dlopen(3p) <../man3/dlopen.3p.html>`__

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
