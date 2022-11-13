.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nl_types.h(0p) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   nl_types.h(0P)          POSIX Programmer's Manual         nl_types.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          nl_types.h — data types


---------------------------------------------------------

::

          #include <nl_types.h>


---------------------------------------------------------------

::

          The <nl_types.h> header shall define at least the following
          types:

          nl_catd       Used by the message catalog functions catopen(),
                        catgets(), and catclose() to identify a catalog
                        descriptor.

          nl_item       Used by nl_langinfo() to identify items of langinfo
                        data. Values of objects of type nl_item are defined
                        in <langinfo.h>.

          The <nl_types.h> header shall define at least the following
          symbolic constants:

          NL_SETD       Used by gencat when no $set directive is specified
                        in a message text source file. This constant can be
                        passed as the value of set_id on subsequent calls
                        to catgets() (that is, to retrieve messages from
                        the default message set). The value of NL_SETD is
                        implementation-defined.

          NL_CAT_LOCALE Value that must be passed as the oflag argument to
                        catopen() to ensure that message catalog selection
                        depends on the LC_MESSAGES locale category, rather
                        than directly on the LANG environment variable.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              int       catclose(nl_catd);
              char     *catgets(nl_catd, int, int, const char *);
              nl_catd   catopen(const char *, int);

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          langinfo.h(0p)

          The System Interfaces volume of POSIX.1‐2017, catclose(3p),
          catgets(3p), catopen(3p), nl_langinfo(3p)

          The Shell and Utilities volume of POSIX.1‐2017, gencat(1p)


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

   IEEE/The Open Group               2017                    nl_types.h(0P)

--------------

Pages that refer to this page:
`langinfo.h(0p) <../man0/langinfo.h.0p.html>`__, 
`gencat(1p) <../man1/gencat.1p.html>`__, 
`catclose(3p) <../man3/catclose.3p.html>`__, 
`catgets(3p) <../man3/catgets.3p.html>`__, 
`catopen(3p) <../man3/catopen.3p.html>`__, 
`nl_langinfo(3p) <../man3/nl_langinfo.3p.html>`__

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
