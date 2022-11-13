.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

basename(3p) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `RATIONALE <#RATIONALE>`__ \|     |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BASENAME(3P)            POSIX Programmer's Manual           BASENAME(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          basename — return the last component of a pathname


---------------------------------------------------------

::

          #include <libgen.h>

          char *basename(char *path);


---------------------------------------------------------------

::

          The basename() function shall take the pathname pointed to by
          path and return a pointer to the final component of the pathname,
          deleting any trailing '/' characters.

          If the string pointed to by path consists entirely of the '/'
          character, basename() shall return a pointer to the string "/".
          If the string pointed to by path is exactly "//", it is
          implementation-defined whether '/' or "//" is returned.

          If path is a null pointer or points to an empty string,
          basename() shall return a pointer to the string ".".

          The basename() function may modify the string pointed to by path,
          and may return a pointer to internal storage. The returned
          pointer might be invalidated or the storage might be overwritten
          by a subsequent call to basename().  The returned pointer might
          also be invalidated if the calling thread is terminated.

          The basename() function need not be thread-safe.


-----------------------------------------------------------------

::

          The basename() function shall return a pointer to the final
          component of path.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

      Using basename()
          The following program fragment returns a pointer to the value
          lib, which is the base name of /usr/lib.

              #include <libgen.h>
              ...
              char name[] = "/usr/lib";
              char *base;

              base = basename(name);
              ...

      Sample Input and Output Strings for the basename() and dirname()
          Functions and the basename and dirname Utilities
          .TS
   ┌──────────────┬───────────┬────────────┬──────────────┬─────────────────┬───────────┐
   │  basename()  │           │            │   basename   │     Output      │  Output   │
   │and dirname() │  String   │   String   │ and dirname  │   Written by    │Written by │
   │Functions path│Returned by│Returned by │  Utilities   │    basename     │ dirname   │
   │   Argument   │basename() │ dirname()  │string Operand│     Utility     │ Utility   │
   ├──────────────┼───────────┼────────────┼──────────────┼─────────────────┼───────────┤
   │"usr"         │"usr"      │"."         │usr           │usr              │.          │
   ├──────────────┼───────────┼────────────┼──────────────┼─────────────────┼───────────┤
   │"usr/"        │"usr"      │"."         │usr/          │usr              │.          │
   ├──────────────┼───────────┼────────────┼──────────────┼─────────────────┼───────────┤
   │""            │"."        │"."         │""            │. or empty string│.          │
   ├──────────────┼───────────┼────────────┼──────────────┼─────────────────┼───────────┤
   │"/"           │"/"        │"/"         │/             │/                │/          │
   ├──────────────┼───────────┼────────────┼──────────────┼─────────────────┼───────────┤
   │"//"          │"/" or "//"│"/" or "//" │//            │/ or //          │/ or //    │
   ├──────────────┼───────────┼────────────┼──────────────┼─────────────────┼───────────┤
   │"///"         │"/"        │"/"         │///           │/                │/          │
   ├──────────────┼───────────┼────────────┼──────────────┼─────────────────┼───────────┤
   │"/usr/"       │"usr"      │"/"         │/usr/         │usr              │/          │
   ├──────────────┼───────────┼────────────┼──────────────┼─────────────────┼───────────┤
   │"/usr/lib"    │"lib"      │"/usr"      │/usr/lib      │lib              │/usr       │
   ├──────────────┼───────────┼────────────┼──────────────┼─────────────────┼───────────┤
   │"//usr//lib//"│"lib"      │"//usr"     │//usr//lib//  │lib              │//usr      │
   ├──────────────┼───────────┼────────────┼──────────────┼─────────────────┼───────────┤
   │"/home//dwc// │"test"     │"/home//dwc"│/home//dwc//  │test             │/home//dwc │
   │test"         │           │            │test          │                 │           │
   └───────.─S─H──"─A─P─P┴L─I─C─A─T─I─O─N──U─S─A┴G─E─"──%─%─%─S─H─%─%─%─┴N─o─n─e─.──────────┴─────────────────┴───────────┘


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          dirname(3p)

          The Base Definitions volume of POSIX.1‐2017, libgen.h(0p)

          The Shell and Utilities volume of POSIX.1‐2017, basename(1p)


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

   IEEE/The Open Group               2017                      BASENAME(3P)

--------------

Pages that refer to this page:
`libgen.h(0p) <../man0/libgen.h.0p.html>`__, 
`basename(1p) <../man1/basename.1p.html>`__, 
`dirname(1p) <../man1/dirname.1p.html>`__, 
`dirname(3p) <../man3/dirname.3p.html>`__

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
