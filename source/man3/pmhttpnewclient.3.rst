.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmhttpnewclient(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMHTTPNEWCLIENT(3)      Library Functions Manual      PMHTTPNEWCLIENT(3)

NAME
-------------------------------------------------

::

          pmhttpNewClient, pmhttpFreeClient, pmhttpClientFetch - simple
          HTTP client interfaces


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmhttp.h>

          struct http_client *pmhttpNewClient(void);
          void pmhttpFreeClient(struct http_client *client);
          int pmhttpClientFetch(struct http_client *client, const char
                  *url, char *bodybuf, size_t bodylen, char *typebuf,
                  size_t typelen);

          cc ... -lpcp_web


---------------------------------------------------------------

::

          pmhttpNewClient allocates and initializes an opaque HTTP client
          that is ready to make requests from a server.

          The URL request interface pmhttpClientFetch issues an HTTP GET
          request to the server specified in the supplied url.  The body of
          the response is returned in the caller supplied bodybuf buffer,
          of bodylen bytes length.  An optional typebuf buffer, of typelen
          bytes length, can also be supplied and (if non-NULL) will contain
          the value of the content-type header returned from the server.

          The url parameter is an RFC1630 format URL.  This will typically
          be prefixed with "http://", however these interfaces also support
          Unix domain sockets.  Those are instead prefixed by "unix://",
          followed by the full filesystem path to the desired Unix domain
          socket.

          To free up resources associated with an HTTP client, including
          closing any persistent server connection that has been
          established earlier, is accomplished using the pmhttpFreeClient
          routine.


---------------------------------------------------------------

::

          pmhttpNewClient will return NULL on failure, which can only occur
          when allocation of memory is not possible.

          pmhttpClientFetch will return the number of bytes places into the
          bodybuf buffer, else a negated error code indicating the nature
          of the failure.


---------------------------------------------------------

::

          pmdaapache(1), pmjsonInit(3), PMAPI(3), PMWEBAPI(3) and
          https://tools.ietf.org/html/rfc1630 .

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

   Performance Co-Pilot               PCP                PMHTTPNEWCLIENT(3)

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
