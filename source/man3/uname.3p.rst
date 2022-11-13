.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uname(3p) — Linux manual page
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

   UNAME(3P)               POSIX Programmer's Manual              UNAME(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          uname — get the name of the current system


---------------------------------------------------------

::

          #include <sys/utsname.h>

          int uname(struct utsname *name);


---------------------------------------------------------------

::

          The uname() function shall store information identifying the
          current system in the structure pointed to by name.

          The uname() function uses the utsname structure defined in
          <sys/utsname.h>.

          The uname() function shall return a string naming the current
          system in the character array sysname.  Similarly, nodename shall
          contain the name of this node within an implementation-defined
          communications network. The arrays release and version shall
          further identify the operating system. The array machine shall
          contain a name that identifies the hardware that the system is
          running on.

          The format of each member is implementation-defined.


-----------------------------------------------------------------

::

          Upon successful completion, a non-negative value shall be
          returned.  Otherwise, -1 shall be returned and errno set to
          indicate the error.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The inclusion of the nodename member in this structure does not
          imply that it is sufficient information for interfacing to
          communications networks.


-----------------------------------------------------------

::

          The values of the structure members are not constrained to have
          any relation to the version of this volume of POSIX.1‐2017
          implemented in the operating system. An application should
          instead depend on _POSIX_VERSION and related constants defined in
          <unistd.h>.

          This volume of POSIX.1‐2017 does not define the sizes of the
          members of the structure and permits them to be of different
          sizes, although most implementations define them all to be the
          same size: eight bytes plus one byte for the string terminator.
          That size for nodename is not enough for use with many networks.

          The uname() function originated in System III, System V, and
          related implementations, and it does not exist in Version 7 or
          4.3 BSD. The values it returns are set at system compile time in
          those historical implementations.

          4.3 BSD has gethostname() and gethostid(), which return a
          symbolic name and a numeric value, respectively. There are
          related sethostname() and sethostid() functions that are used to
          set the values the other two functions return. The former
          functions are included in this specification, the latter are not.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The Base Definitions volume of POSIX.1‐2017, sys_utsname.h(0p)


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

   IEEE/The Open Group               2017                         UNAME(3P)

--------------

Pages that refer to this page:
`sys_utsname.h(0p) <../man0/sys_utsname.h.0p.html>`__, 
`uname(1p) <../man1/uname.1p.html>`__, 
`gethostname(3p) <../man3/gethostname.3p.html>`__, 
`posix_trace_attr_destroy(3p) <../man3/posix_trace_attr_destroy.3p.html>`__, 
`posix_trace_attr_getclockres(3p) <../man3/posix_trace_attr_getclockres.3p.html>`__

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
