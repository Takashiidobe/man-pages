.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldapurl(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| OUTPUT FORMAT <#OUTPUT_FORMAT>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDAPURL(1)               General Commands Manual              LDAPURL(1)

NAME
-------------------------------------------------

::

          ldapurl - LDAP URL formatting tool


---------------------------------------------------------

::

          ldapurl [-a attrs] [-b searchbase] [-e [!]ext[=extparam]]
          [-E [!]ext[=extparam]] [-f filter] [-H ldapuri] [-h ldaphost]
          [-p ldapport] [-s {base|one|sub|children}] [-S scheme]


---------------------------------------------------------------

::

          ldapurl is a command that allows one to either compose or
          decompose LDAP URIs.

          When invoked with the -H option, ldapurl extracts the components
          of the ldapuri option argument, unescaping hex-escaped chars as
          required.  It basically acts as a frontend to the
          ldap_url_parse(3) call.  Otherwise, it builds an LDAP URI based
          on the components passed with the appropriate options, performing
          the inverse operation.  Option -H is incompatible with options
          -a, -b, -E, -f, -H, -h, -p, -S, and -s.


-------------------------------------------------------

::

          -a attrs
                 Set a comma-separated list of attribute selectors.

          -b searchbase
                 Set the searchbase.

          -e [!]ext[=extparam]

                 Specify general extensions with -e ´!´ indicates
                 criticality.

                 General extensions:
                   [!]assert=<filter>    (an RFC 4515 Filter)
                   !authzid=<authzid>    ("dn:<dn>" or "u:<user>")
                   [!]bauthzid           (RFC 3829 authzid control)
                   [!]chaining[=<resolve>[/<cont>]]
                   [!]manageDSAit
                   [!]noop
                   ppolicy
                   [!]postread[=<attrs>] (a comma-separated attribute list)
                   [!]preread[=<attrs>]  (a comma-separated attribute list)
                   [!]relax
                   sessiontracking[=<username>]
                   abandon,cancel,ignore (SIGINT sends abandon/cancel,
                   or ignores response; if critical, doesn't wait for SIGINT.
                   not really controls)

          -E [!]ext[=extparam]
                 Set URL extensions; incompatible with -H.

          -f filter
                 Set the URL filter.  No particular check on conformity
                 with RFC 4515 LDAP filters is performed, but the value is
                 hex-escaped as required.

          -H ldapuri
                 Specify URI to be exploded.

          -h ldaphost
                 Set the host.

          -p ldapport
                 Set the TCP port.

          -S scheme
                 Set the URL scheme.  Defaults for other fields, like
                 ldapport, may depend on the value of scheme.

          -s {base|one|sub|children}
                 Specify the scope of the search to be one of base, one,
                 sub, or children to specify a base object, one-level,
                 subtree, or children search.  The default is sub.  Note:
                 children scope requires LDAPv3 subordinate feature
                 extension.


-------------------------------------------------------------------

::

          If the -H option is used, the ldapuri supplied is exploded in its
          components, which are printed to standard output in an LDIF-like
          form.

          Otherwise, the URI built using the values passed with the other
          options is printed to standard output.


-------------------------------------------------------

::

          The following command:

              ldapurl -h ldap.example.com -b dc=example,dc=com -s sub -f "(cn=Some One)"

          returns

              ldap://ldap.example.com:389/dc=example,dc=com??sub?(cn=Some%20One)

          The command:

              ldapurl -H ldap://ldap.example.com:389/dc=example,dc=com??sub?(cn=Some%20One)

          returns

              scheme: ldap
              host: ldap.example.com
              port: 389
              dn: dc=example,dc=com
              scope: sub
              filter: (cn=Some One)


---------------------------------------------------------------

::

          Exit status is zero if no errors occur.  Errors result in a non-
          zero exit status and a diagnostic message being written to
          standard error.


---------------------------------------------------------

::

          ldap(3), ldap_url_parse(3),


-----------------------------------------------------

::

          The OpenLDAP Project <http://www.openldap.org/>


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

   OpenLDAP LDVERSION             RELEASEDATE                    LDAPURL(1)

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
