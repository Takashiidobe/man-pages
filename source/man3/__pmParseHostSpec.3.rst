.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmparsehostspec(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMPARSEHOSTSPEC(3)      Library Functions Manual      PMPARSEHOSTSPEC(3)

NAME
-------------------------------------------------

::

          __pmParseHostSpec, __pmUnparseHostSpec, __pmFreeHostSpec -
          uniform host specification parser


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmParseHostSpec(const char *string, pmHostSpec **hostsp,
                  int *count, char **errmsg);
          int __pmUnparseHostSpec(pmHostSpec *hosts, int count, char
                  *string, size_t size);
          void __pmFreeHostSpec(pmHostSpec *hosts, int count);

          cc ... -lpcp


-----------------------------------------------------

::

          This documentation is intended for internal Performance Co-Pilot
          (PCP) developer use.

          These interfaces are not part of the PCP APIs that are guaranteed
          to remain fixed across releases, and they may not work, or may
          provide different semantics at some point in the future.


---------------------------------------------------------------

::

          __pmParseHostSpec accepts a string specifying the location of a
          PCP performance metric collector daemon.  The syntax of the
          various formats of this string is described in PCPIntro(1) where
          several examples are also presented.

          The syntax allows the initial pmcd(1) hostname to be optionally
          followed by a list of port numbers, which will be tried in order
          when connecting to pmcd on that host.  The portlist is separated
          from the hostname using a colon, and each port in the list is
          comma-separated.

          In addition, one or more optional pmproxy(1) hosts can be
          specified (currently, only one proxy host is supported by the PCP
          protocols).  These are separated from each other and from the
          pmcd component using the @ character.  These may also be followed
          by an optional port list, using the same comma-separated syntax
          as before.

          __pmParseHostSpec takes a null-terminated host specification
          string and returns an array of pmHostSpec structures, where the
          array has count entries.

          These pmHostSpec structures that are returned via hostsp
          represent each individual host in the specification string and
          has the following declaration:

              typedef struct {
                  char    *name;       /* hostname (always valid) */
                  int     *ports;      /* array of host port numbers */
                  int     nports;      /* number of ports in host port array */
              } pmHostSpec;

          __pmUnparseHostSpec performs the inverse operation, creating a
          string representation from a number of hosts structures.  Where
          the count of structures indicated by hosts is greater than one,
          the proxy syntax is used to indicate a chain of proxied hosts.
          The size of the supplied string buffer must be provided by the
          caller using the size parameter.


-----------------------------------------------------------------

::

          If the given string is successfully parsed __pmParseHostSpec
          returns zero.  In this case the dynamic storage allocated by
          __pmParseHostSpec can be released by calling __pmFreeHostSpec
          using the address returned from __pmParseHostSpec via hosts.

          __pmParseHostSpec returns PM_ERR_GENERIC and a dynamically
          allocated error message string in errmsg, if the given string
          does not parse, and the user-supplied errmsg pointer is non-null.
          Be sure to free(3) the error message string in this situation.

          In the case of an error, hosts is undefined.  In the case of
          success, errmsg is undefined.

          On success __pmUnparseHostSpec returns a positive value
          indicating the number of characters written into the supplied
          buffer.  However, if the supplied buffer was too small, a
          negative status code of -E2BIG is returned.


---------------------------------------------------------

::

          pmcd(1), pmproxy(1), pmchart(1), __pmParseHostAttrsSpec(3),
          PMAPI(3) and pmNewContext(3).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                PMPARSEHOSTSPEC(3)

--------------

Pages that refer to this page:
`pmparsehostattrsspec(3) <../man3/pmparsehostattrsspec.3.html>`__

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
