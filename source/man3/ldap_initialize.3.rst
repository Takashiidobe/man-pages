.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_open(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDAP_OPEN(3)            Library Functions Manual            LDAP_OPEN(3)

NAME
-------------------------------------------------

::

          ldap_init, ldap_initialize, ldap_open - Initialize the LDAP
          library and open a connection to an LDAP server


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          LDAP *ldap_open(host, port)
          char *host;
          int port;

          LDAP *ldap_init(host, port)
          char *host;
          int port;

          int ldap_initialize(ldp, uri)
          LDAP **ldp;
          char *uri;

          int ldap_connect(ldp)
          LDAP *ldp;

          int ldap_set_urllist_proc(ld, proc, params)
          LDAP *ld;
          LDAP_URLLIST_PROC *proc;
          void *params;

          int (LDAP_URLLIST_PROC)(ld, urllist, url, params);
          LDAP *ld;
          LDAPURLDesc **urllist;
          LDAPURLDesc **url;
          void *params;

          #include <openldap.h>

          int ldap_init_fd(fd, proto, uri, ldp)
          ber_socket_t fd;
          int proto;
          char *uri;
          LDAP **ldp;


---------------------------------------------------------------

::

          ldap_open() opens a connection to an LDAP server and allocates an
          LDAP structure which is used to identify the connection and to
          maintain per-connection information.  ldap_init() allocates an
          LDAP structure but does not open an initial connection.
          ldap_initialize() allocates an LDAP structure but does not open
          an initial connection.  ldap_init_fd() allocates an LDAP
          structure using an existing connection on the provided socket.
          One of these routines must be called before any operations are
          attempted.

          ldap_open() takes host, the hostname on which the LDAP server is
          running, and port, the port number to which to connect.  If the
          default IANA-assigned port of 389 is desired, LDAP_PORT should be
          specified for port.  The host parameter may contain a blank-
          separated list of hosts to try to connect to, and each host may
          optionally by of the form host:port.  If present, the :port
          overrides the port parameter to ldap_open().  Upon successfully
          making a connection to an LDAP server, ldap_open() returns a
          pointer to an opaque LDAP structure, which should be passed to
          subsequent calls to ldap_bind(), ldap_search(), etc. Certain
          fields in the LDAP structure can be set to indicate size limit,
          time limit, and how aliases are handled during operations; read
          and write access to those fields must occur by calling
          ldap_get_option(3) and ldap_set_option(3) respectively, whenever
          possible.

          ldap_init() acts just like ldap_open(), but does not open a
          connection to the LDAP server.  The actual connection open will
          occur when the first operation is attempted.

          ldap_initialize() acts like ldap_init(), but it returns an
          integer indicating either success or the failure reason, and it
          allows to specify details for the connection in the schema
          portion of the URI.  The uri parameter may be a comma- or
          whitespace-separated list of URIs containing only the schema, the
          host, and the port fields.  Apart from ldap, other (non-standard)
          recognized values of the schema field are ldaps (LDAP over TLS),
          ldapi (LDAP over IPC), and cldap (connectionless LDAP).  If other
          fields are present, the behavior is undefined.

          At this time, ldap_open() and ldap_init() are deprecated in favor
          of ldap_initialize(), essentially because the latter allows to
          specify a schema in the URI and it explicitly returns an error
          code.

          ldap_connect() causes a handle created by ldap_initialize() to
          connect to the server. This is useful in situations where a file
          descriptor is required before a request is performed.

          ldap_init_fd() allows an LDAP structure to be initialized using
          an already-opened connection. The proto parameter should be one
          of LDAP_PROTO_TCP, LDAP_PROTO_UDP, or LDAP_PROTO_IPC for a
          connection using TCP, UDP, or IPC, respectively. The value
          LDAP_PROTO_EXT may also be specified if user-supplied sockbuf
          handlers are going to be used. Note that support for UDP is not
          implemented unless libldap was built with LDAP_CONNECTIONLESS
          defined.  The uri parameter may optionally be provided for
          informational purposes.

          ldap_set_urllist_proc() allows to set a function proc of type
          LDAP_URLLIST_PROC that is called when a successful connection can
          be established.  This function receives the list of URIs parsed
          from the uri string originally passed to ldap_initialize(), and
          the one that successfully connected.  The function may manipulate
          the URI list; the typical use consists in moving the successful
          URI to the head of the list, so that subsequent attempts to
          connect to one of the URIs using the same LDAP handle will try it
          first.  If ld is null, proc is set as a global parameter that is
          inherited by all handlers within the process that are created
          after the call to ldap_set_urllist_proc().  By default, no
          LDAP_URLLIST_PROC is set.  In a multithreaded environment,
          ldap_set_urllist_proc() must be called before any concurrent
          operation using the LDAP handle is started.

          Note: the first call into the LDAP library also initializes the
          global options for the library. As such the first call should be
          single-threaded or otherwise protected to insure that only one
          call is active. It is recommended that ldap_get_option() or
          ldap_set_option() be used in the program's main thread before any
          additional threads are created.  See ldap_get_option(3).


-----------------------------------------------------

::

          If an error occurs, ldap_open() and ldap_init() will return NULL
          and errno should be set appropriately.  ldap_initialize() and
          ldap_init_fd() will directly return the LDAP code associated to
          the error (or LDAP_SUCCESS in case of success); errno should be
          set as well whenever appropriate.  ldap_set_urllist_proc()
          returns LDAP_OPT_ERROR on error, and LDAP_OPT_SUCCESS on success.


---------------------------------------------------------

::

          ldap(3), ldap_bind(3), ldap_get_option(3), ldap_set_option(3),
          lber-sockbuf(3), errno(3)


-------------------------------------------------------------------------

::

          OpenLDAP Software is developed and maintained by The OpenLDAP
          Project <http://www.openldap.org/>.  OpenLDAP Software is derived
          from the University of Michigan LDAP 3.3 Release.

COLOPHON
---------------------------------------------------------

::

          This page is part of the OpenLDAP (an open source implementation
          of the Lightweight Directory Access Protocol) project.
          Information about the project can be found at 
          ⟨http://www.openldap.org/⟩.  If you have a bug report for this
          manual page, see ⟨http://www.openldap.org/its/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.openldap.org/openldap/openldap.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   OpenLDAP LDVERSION             RELEASEDATE                  LDAP_OPEN(3)

--------------

Pages that refer to this page: `ldap(3) <../man3/ldap.3.html>`__, 
`ldap_bind(3) <../man3/ldap_bind.3.html>`__, 
`ldap_dup(3) <../man3/ldap_dup.3.html>`__, 
`slapd-meta(5) <../man5/slapd-meta.5.html>`__

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
