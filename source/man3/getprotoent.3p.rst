.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

endprotoent(3p) — Linux manual page
===================================

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

   ENDPROTOENT(3P)         POSIX Programmer's Manual        ENDPROTOENT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          endprotoent, getprotobyname, getprotobynumber, getprotoent,
          setprotoent — network protocol database functions


---------------------------------------------------------

::

          #include <netdb.h>

          void endprotoent(void);
          struct protoent *getprotobyname(const char *name);
          struct protoent *getprotobynumber(int proto);
          struct protoent *getprotoent(void);
          void setprotoent(int stayopen);


---------------------------------------------------------------

::

          These functions shall retrieve information about protocols. This
          information is considered to be stored in a database that can be
          accessed sequentially or randomly. The implementation of this
          database is unspecified.

          The setprotoent() function shall open a connection to the
          database, and set the next entry to the first entry. If the
          stayopen argument is non-zero, the connection to the network
          protocol database shall not be closed after each call to
          getprotoent() (either directly, or indirectly through one of the
          other getproto*() functions), and the implementation may maintain
          an open file descriptor for the database.

          The getprotobyname() function shall search the database from the
          beginning and find the first entry for which the protocol name
          specified by name matches the p_name member, opening and closing
          a connection to the database as necessary.

          The getprotobynumber() function shall search the database from
          the beginning and find the first entry for which the protocol
          number specified by proto matches the p_proto member, opening and
          closing a connection to the database as necessary.

          The getprotoent() function shall read the next entry of the
          database, opening and closing a connection to the database as
          necessary.

          The getprotobyname(), getprotobynumber(), and getprotoent()
          functions shall each return a pointer to a protoent structure,
          the members of which shall contain the fields of an entry in the
          network protocol database.

          The endprotoent() function shall close the connection to the
          database, releasing any open file descriptor.

          These functions need not be thread-safe.


-----------------------------------------------------------------

::

          Upon successful completion, getprotobyname(), getprotobynumber(),
          and getprotoent() return a pointer to a protoent structure if the
          requested entry was found, and a null pointer if the end of the
          database was reached or the requested entry was not found.
          Otherwise, a null pointer is returned.

          The application shall not modify the structure to which the
          return value points, nor any storage areas pointed to by pointers
          within the structure. The returned pointer, and pointers within
          the structure, might be invalidated or the structure or the
          storage areas might be overwritten by a subsequent call to
          getprotobyname(), getprotobynumber(), or getprotoent().  The
          returned pointer, and pointers within the structure, might also
          be invalidated if the calling thread is terminated.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


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

          The Base Definitions volume of POSIX.1‐2017, netdb.h(0p)


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

   IEEE/The Open Group               2017                   ENDPROTOENT(3P)

--------------

Pages that refer to this page:
`netdb.h(0p) <../man0/netdb.h.0p.html>`__, 
`endservent(3p) <../man3/endservent.3p.html>`__, 
`getprotobyname(3p) <../man3/getprotobyname.3p.html>`__, 
`getsockopt(3p) <../man3/getsockopt.3p.html>`__, 
`setprotoent(3p) <../man3/setprotoent.3p.html>`__, 
`setsockopt(3p) <../man3/setsockopt.3p.html>`__

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
