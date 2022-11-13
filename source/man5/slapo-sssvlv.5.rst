.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-sssvlv(5) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO-SSSVLV(5)            File Formats Manual           SLAPO-SSSVLV(5)

NAME
-------------------------------------------------

::

          slapo-sssvlv - Server Side Sorting and Virtual List View overlay
          to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          This overlay implements the LDAP Server Side Sorting (RFC2891)
          control as well as the Virtual List View control. It also
          replaces the default implementation of the LDAP PagedResults
          (RFC2696) control, to ensure that it works with Sorting. The
          overlay can be used with any backend or globally for all
          backends.

          Since a complete result set must be generated in memory before
          sorting can be performed, processing sort requests can have a
          large impact on the server's memory use. As such, any connection
          is limited to having only a limited number of sort requests
          active at a time. Additional limits may be configured as
          described below.


-------------------------------------------------------------------

::

          These slapd.conf options apply to the SSSVLV overlay.  They
          should appear after the overlay directive.

          sssvlv-max <num>
                 Set the maximum number of concurrent sort requests allowed
                 across all connections. The default is one half of the
                 number of server threads.

          sssvlv-maxkeys <num>
                 Set the maximum number of keys allowed in a sort request.
                 The default is 5.

          sssvlv-maxperconn <num>
                 Set the maximum number of concurrent paged search requests
                 per connection. The default is 5. The number of concurrent
                 requests remains limited by sssvlv-max.


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file

          ETCDIR/slapd.d
                 default slapd configuration directory


---------------------------------------------------------

::

          slapd.conf(5), slapd-config(5).

          "OpenLDAP Administrator's Guide"
          (http://www.OpenLDAP.org/doc/admin/)

          IETF LDAP Virtual List View proposal by D. Boreham, J.
          Sermersheim, and A. Kashi in IETF document "draft-ietf-ldapext-
          ldapv3-vlv-09.txt".


-----------------------------------------------------

::

          Howard Chu

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

   OpenLDAP LDVERSION             RELEASEDATE               SLAPO-SSSVLV(5)

--------------

Pages that refer to this page:
`slapd.overlays(5) <../man5/slapd.overlays.5.html>`__

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
