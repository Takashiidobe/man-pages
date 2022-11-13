.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getenv(3p) — Linux manual page
==============================

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

   GETENV(3P)              POSIX Programmer's Manual             GETENV(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          getenv — get value of an environment variable


---------------------------------------------------------

::

          #include <stdlib.h>

          char *getenv(const char *name);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The getenv() function shall search the environment of the calling
          process (see the Base Definitions volume of POSIX.1‐2017, Chapter
          8, Environment Variables) for the environment variable name if it
          exists and return a pointer to the value of the environment
          variable. If the specified environment variable cannot be found,
          a null pointer shall be returned. The application shall ensure
          that it does not modify the string pointed to by the getenv()
          function.

          The returned string pointer might be invalidated or the string
          content might be overwritten by a subsequent call to getenv(),
          setenv(), unsetenv(),
          or (if supported) putenv() but they shall not be affected by a
          call to any other function in this volume of POSIX.1‐2017.

          The returned string pointer might also be invalidated if the
          calling thread is terminated.

          The getenv() function need not be thread-safe.


-----------------------------------------------------------------

::

          Upon successful completion, getenv() shall return a pointer to a
          string containing the value for the specified name.  If the
          specified name cannot be found in the environment of the calling
          process, a null pointer shall be returned.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

      Getting the Value of an Environment Variable
          The following example gets the value of the HOME environment
          variable.

              #include <stdlib.h>
              ...
              const char *name = "HOME";
              char *value;

              value = getenv(name);


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The clearenv() function was considered but rejected. The putenv()
          function has now been included for alignment with the Single UNIX
          Specification.

          The getenv() function is inherently not thread-safe because it
          returns a value pointing to static data.

          Conforming applications are required not to directly modify the
          pointers to which environ points, but to use only the setenv(),
          unsetenv(), and putenv() functions, or assignment to environ
          itself, to manipulate the process environment. This constraint
          allows the implementation to properly manage the memory it
          allocates. This enables the implementation to free any space it
          has allocated to strings (and perhaps the pointers to them)
          stored in environ when unsetenv() is called. A C runtime start-up
          procedure (that which invokes main() and perhaps initializes
          environ) can also initialize a flag indicating that none of the
          environment has yet been copied to allocated storage, or that the
          separate table has not yet been initialized. If the application
          switches to a complete new environment by assigning a new value
          to environ, this can be detected by getenv(), setenv(),
          unsetenv(), or putenv() and the implementation can at that point
          reinitialize based on the new environment. (This may include
          copying the environment strings into a new array and assigning
          environ to point to it.)

          In fact, for higher performance of getenv(), implementations that
          do not provide putenv() could also maintain a separate copy of
          the environment in a data structure that could be searched much
          more quickly (such as an indexed hash table, or a binary tree),
          and update both it and the linear list at environ when setenv()
          or unsetenv() is invoked. On implementations that do provide
          putenv(), such a copy might still be worthwhile but would need to
          allow for the fact that applications can directly modify the
          content of environment strings added with putenv().  For example,
          if an environment string found by searching the copy is one that
          was added using putenv(), the implementation would need to check
          that the string in environ still has the same name (and value, if
          the copy includes values), and whenever searching the copy
          produces no match the implementation would then need to search
          each environment string in environ that was added using putenv()
          in case any of them have changed their names and now match. Thus,
          each use of putenv() to add to the environment would reduce the
          speed advantage of having the copy.

          Performance of getenv() can be important for applications which
          have large numbers of environment variables. Typically,
          applications like this use the environment as a resource database
          of user-configurable parameters.  The fact that these variables
          are in the user's shell environment usually means that any other
          program that uses environment variables (such as ls, which
          attempts to use COLUMNS), or really almost any utility (LANG,
          LC_ALL, and so on) is similarly slowed down by the linear search
          through the variables.

          An implementation that maintains separate data structures, or
          even one that manages the memory it consumes, is not currently
          required as it was thought it would reduce consensus among
          implementors who do not want to change their historical
          implementations.


---------------------------------------------------------------------------

::

          A future version may add one or more functions to access and
          modify the environment in a thread-safe manner.


---------------------------------------------------------

::

          exec(1p), putenv(3p), setenv(3p), unsetenv(3p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, stdlib.h(0p)


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

   IEEE/The Open Group               2017                        GETENV(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`putenv(3p) <../man3/putenv.3p.html>`__, 
`setenv(3p) <../man3/setenv.3p.html>`__, 
`unsetenv(3p) <../man3/unsetenv.3p.html>`__

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
