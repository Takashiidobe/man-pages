.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmparsehostattrsspec(3) — Linux manual page
===========================================

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

   PMPARSEHOSTATTRSSPEC(3) Library Functions Manual PMPARSEHOSTATTRSSPEC(3)

NAME
-------------------------------------------------

::

          __pmParseHostAttrsSpec, __pmUnparseHostAttrsSpec,
          __pmFreeHostAttrsSpec, __pmFreeAttrsSpec - host and attributes
          specification parser


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmParseHostAttrsSpec(const char *string, pmHostSpec
                  **hostsp, int *count, __pmHashCtl *attrs, char **errmsg);
          int __pmUnparseHostAttrsSpec(pmHostSpec *hostsp, int *count,
                  __pmHashCtl *attrs, char *string, size_t size);
          void __pmFreeHostAttrsSpec(pmHostSpec *hosts, int count,
                  __pmHashCtl *attrs);
          void __pmFreeAttrsSpec(__pmHashCtl *attrs);

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

          __pmParseHostAttrsSpec accepts a string specifying the location
          of a PCP performance metric collector daemon, and any attributes
          that should be associated with the connection to that daemon.

          The syntax allows the optional specification of a protocol
          (native PCP protocol, encrypted PCP protocol or unix domain
          socket protocol).

          If the specified protocol is native PCP protocol, or encrypted
          PCP protocol, an initial pmcd(1) hostname with optional port
          numbers and optional proxy host, and optional attributes which
          are to be associated with the connection may be specified.  Some
          examples follow:

               pcp://nas1.servers.com:44321@firewalls.r.us?compress
               pcps://nas1.servers.com?user=otto&pass=blotto&compress

          If the specified protocol is a unix domain socket protocol, the
          path to the socket in the local file system may be specified
          along with optional attributes which are to be associated with
          the connection.  For example:

               unix://$PCP_RUN_DIR/pmcd.socket:?compress
               local://my/local/pmcd.socket:?user=otto&pass=blotto&compress

          If the optional protocol component is not specified, then the
          default setting will be used - which is the native PCP binary
          protocol.  However, this can still be overwritten via the
          environment as described in PCPIntro(1).  If the protocol prefix
          is specified, it must be one of either "pcp://" (clear),
          "pcps://" (secure, encrypted), "unix://" (authenticated local) or
          "local://" ("unix://" then "pcp://").

          The path specified for the "unix://" and "local://" protocols
          will always be interpreted as an absolute path name. For example,
          the following are all interpreted identically as
          $PCP_RUN_DIR/pmcd.socket.

               unix://$PCP_RUN_DIR/pmcd.socket
               unix:/$PCP_RUN_DIR/pmcd.socket
               unix:$PCP_RUN_DIR/pmcd.socket

          Refer to __pmParseHostSpec(3) for further details of the host and
          proxy host components.

          If any optional connection attributes are to be specified, these
          are separated from the hostname component via the '?' character.
          Each attribute is separated by the '&' character, and each can be
          either a simple attribute flag (such as "compress") or a
          name=value pair (such as "username=fred").

          __pmParseHostAttrsSpec takes a null-terminated host-and-
          attributes specification string and returns an array of
          pmHostSpec structures, where the array has count entries, and an
          attrs hash table containing any attributes (including the
          optional protocol, if it was specified).

          Full details of the pmHostSpec structures are provided in
          __pmParseHostSpec(3).

          The __pmHashCtl structure that is filled out on return via
          attributes, represents each individual attribute in the
          specification string with any associated value.  It should be
          considered an opaque structure and should be zeroed beforehand.

          The returned hash table control structure can be iterated using
          one of the supplied iteration mechanisms - __pmHashWalkCB (a
          callback-based mechanism) or __pmHashWalk (a simple procedural
          mechanism).  These provide access to the individual hash nodes,
          as __pmHashNode entries, which provide access to decoded
          attributes and their (optional) values.

              typedef struct __pmHashNode {
                  __pmHashNode    *next;    /* next node in hash bucket (internal) */
                  unsigned int    key;      /* key identifying particular attribute */
                  void            *data;    /* attributes value (optional, string) */
              } __pmHashNode;

          There are a set number of valid attributes, however these may be
          extended in future releases as new connection parameters become
          needed.  These can be identified via the PCP_ATTR_* macros in the
          PCP header files.

          __pmUnparseHostSpec performs the inverse operation, creating a
          string representation from hosts and attributes structures.  The
          size of the supplied string buffer must be provided by the caller
          using the size parameter.


-----------------------------------------------------------------

::

          If the given string is successfully parsed __pmParseHostAttrsSpec
          returns zero.  In this case the dynamic storage allocated by
          __pmParseHostAttrsSpec can be released by calling
          __pmFreeHostAttrsSpec using the addresses returned from
          __pmParseHostAttrsSpec

          Alternatively, the hosts and attributes memory can be freed
          separately, using __pmFreeHostSpec(3) and __pmFreeAttrsSpec.

          __pmParseHostAttrsSpec returns PM_ERR_GENERIC and a dynamically
          allocated error message string in errmsg, if the given string
          does not parse, and the user-supplied errmsg pointer is non-null.
          Be sure to free(3) the error message string in this situation.

          In the case of an error, both hosts and attributes are undefined.
          In the case of success, errmsg is undefined.

          On success __pmUnparseHostAttrsSpec returns a positive value
          indicating the number of characters written into the supplied
          buffer.  However, if the supplied buffer was too small, a
          negative status code of -E2BIG will be returned.


---------------------------------------------------------

::

          pmcd(1), pmproxy(1), pmchart(1), __pmParseHostSpec(3), PMAPI(3)
          and pmNewContext(3).

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

   Performance Co-Pilot               PCP           PMPARSEHOSTATTRSSPEC(3)

--------------

Pages that refer to this page:
`pmparsehostspec(3) <../man3/pmparsehostspec.3.html>`__

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
