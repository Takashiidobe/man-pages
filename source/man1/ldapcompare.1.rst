.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldapcompare(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `LIMITATIONS <#LIMITATIONS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDAPCOMPARE(1)           General Commands Manual          LDAPCOMPARE(1)

NAME
-------------------------------------------------

::

          ldapcompare - LDAP compare tool


---------------------------------------------------------

::

          ldapcompare [-V[V]] [-d debuglevel] [-n] [-v] [-z] [-M[M]] [-x]
          [-D binddn] [-W] [-w passwd] [-y passwdfile] [-H ldapuri]
          [-P {2|3}] [-e [!]ext[=extparam]] [-E [!]ext[=extparam]]
          [-o opt[=optparam]] [-O security-properties] [-I] [-Q] [-N]
          [-U authcid] [-R realm] [-X authzid] [-Y mech] [-Z[Z]] DN
          {attr:value | attr::b64value}


---------------------------------------------------------------

::

          ldapcompare is a shell-accessible interface to the
          ldap_compare_ext(3) library call.

          ldapcompare opens a connection to an LDAP server, binds, and
          performs a compare using specified parameters.   The DN should be
          a distinguished name in the directory.  Attr should be a known
          attribute.  If followed by one colon, the assertion value should
          be provided as a string.  If followed by two colons, the base64
          encoding of the value is provided.  The result code of the
          compare is provided as the exit code and, unless ran with -z, the
          program prints TRUE, FALSE, or UNDEFINED on standard output.


-------------------------------------------------------

::

          -V[V]  Print version info.  If -VV is given, only the version
                 information is printed.

          -d debuglevel
                 Set the LDAP debugging level to debuglevel.  ldapcompare
                 must be compiled with LDAP_DEBUG defined for this option
                 to have any effect.

          -n     Show what would be done, but don't actually perform the
                 compare.  Useful for debugging in conjunction with -v.

          -v     Run in verbose mode, with many diagnostics written to
                 standard output.

          -z     Run in quiet mode, no output is written.  You must check
                 the return status.  Useful in shell scripts.

          -M[M]  Enable manage DSA IT control.  -MM makes control critical.

          -x     Use simple authentication instead of SASL.

          -D binddn
                 Use the Distinguished Name binddn to bind to the LDAP
                 directory.  For SASL binds, the server is expected to
                 ignore this value.

          -W     Prompt for simple authentication.  This is used instead of
                 specifying the password on the command line.

          -w passwd
                 Use passwd as the password for simple authentication.

          -y passwdfile
                 Use complete contents of passwdfile as the password for
                 simple authentication.  Note that complete means that any
                 leading or trailing whitespaces, including newlines, will
                 be considered part of the password and, unlike other
                 software, they will not be stripped.  As a consequence,
                 passwords stored in files by commands like echo(1) will
                 not behave as expected, since echo(1) by default appends a
                 trailing newline to the echoed string.  The recommended
                 portable way to store a cleartext password in a file for
                 use with this option is to use slappasswd(8) with
                 {CLEARTEXT} as hash and the option -n.

          -H ldapuri
                 Specify URI(s) referring to the ldap server(s); only the
                 protocol/host/port fields are allowed; a list of URI,
                 separated by whitespace or commas is expected.

          -P {2|3}
                 Specify the LDAP protocol version to use.

          -e [!]ext[=extparam]

          -E [!]ext[=extparam]

                 Specify general extensions with -e and compare extensions
                 with -E.  ´!´ indicates criticality.

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

                 Compare extensions:
                   !dontUseCopy

          -o opt[=optparam]

                 Specify any ldap.conf(5) option or one of the following:
                   nettimeout=<timeout>  (in seconds, or "none" or "max")
                   ldif_wrap=<width>     (in columns, or "no" for no wrapping)

          -O security-properties
                 Specify SASL security properties.

          -I     Enable SASL Interactive mode.  Always prompt.  Default is
                 to prompt only as needed.

          -Q     Enable SASL Quiet mode.  Never prompt.

          -N     Do not use reverse DNS to canonicalize SASL host name.

          -U authcid
                 Specify the authentication ID for SASL bind. The form of
                 the ID depends on the actual SASL mechanism used.

          -R realm
                 Specify the realm of authentication ID for SASL bind. The
                 form of the realm depends on the actual SASL mechanism
                 used.

          -X authzid
                 Specify the requested authorization ID for SASL bind.
                 authzid must be one of the following formats:
                 dn:<distinguished name> or u:<username>

          -Y mech
                 Specify the SASL mechanism to be used for authentication.
                 If it's not specified, the program will choose the best
                 mechanism the server knows.

          -Z[Z]  Issue StartTLS (Transport Layer Security) extended
                 operation. If you use -ZZ, the command will require the
                 operation to be successful.


---------------------------------------------------------

::

              ldapcompare "uid=babs,dc=example,dc=com"  sn:Jensen
              ldapcompare "uid=babs,dc=example,dc=com"  sn::SmVuc2Vu
          are all equivalent.


---------------------------------------------------------------

::

          Requiring the value be passed on the command line is limiting and
          introduces some security concerns.  The command should support a
          mechanism to specify the location (file name or URL) to read the
          value from.


---------------------------------------------------------

::

          ldap.conf(5), ldif(5), ldap(3), ldap_compare_ext(3)


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

   OpenLDAP LDVERSION             RELEASEDATE                LDAPCOMPARE(1)

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
