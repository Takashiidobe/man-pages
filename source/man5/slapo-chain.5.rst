.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-chain(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO-CHAIN(5)             File Formats Manual            SLAPO-CHAIN(5)

NAME
-------------------------------------------------

::

          slapo-chain - chain overlay to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          The chain overlay to slapd(8) allows automatic referral chasing.
          Any time a referral is returned (except for bind operations), it
          is chased by using an instance of the ldap backend.  If
          operations are performed with an identity (i.e. after a bind),
          that identity can be asserted while chasing the referrals by
          means of the identity assertion feature of back-ldap (see
          slapd-ldap(5) for details), which is essentially based on the
          proxied authorization control [RFC 4370].  Referral chasing can
          be controlled by the client by issuing the chaining control (see
          draft-sermersheim-ldap-chaining for details.)

          The config directives that are specific to the chain overlay are
          prefixed by chain-, to avoid potential conflicts with directives
          specific to the underlying database or to other stacked overlays.

          There are very few chain overlay specific directives; however,
          directives related to the instances of the ldap backend that may
          be implicitly instantiated by the overlay may assume a special
          meaning when used in conjunction with this overlay.  They are
          described in slapd-ldap(5), and they also need to be prefixed by
          chain-.

          Note: this overlay is built into the ldap backend; it is not a
          separate module.

          overlay chain
                 This directive adds the chain overlay to the current
                 backend.  The chain overlay may be used with any backend,
                 but it is mainly intended for use with local storage
                 backends that may return referrals.  It is useless in
                 conjunction with the slapd-ldap and slapd-meta backends
                 because they already exploit the libldap specific referral
                 chase feature.  [Note: this may change in the future, as
                 the ldap(5) and meta(5) backends might no longer chase
                 referrals on their own.]

          chain-cache-uri {FALSE|true}
                 This directive instructs the chain overlay to cache
                 connections to URIs parsed out of referrals that are not
                 predefined, to be reused for later chaining.  These URIs
                 inherit the properties configured for the underlying
                 slapd-ldap(5) before any occurrence of the chain-uri
                 directive; basically, they are chained anonymously.

          chain-chaining [resolve=<r>] [continuation=<c>] [critical]
                 This directive enables the chaining control (see draft-
                 sermersheim-ldap-chaining for details) with the desired
                 resolve and continuation behaviors and criticality.  The
                 resolve parameter refers to the behavior while discovering
                 a resource, namely when accessing the object indicated by
                 the request DN; the continuation parameter refers to the
                 behavior while handling intermediate responses, which is
                 mostly significant for the search operation, but may
                 affect extended operations that return intermediate
                 responses.  The values r and c can be any of
                 chainingPreferred, chainingRequired, referralsPreferred,
                 referralsRequired.  If the critical flag affects the
                 control criticality if provided.  [This control is
                 experimental and its support may change in the future.]

          chain-max-depth <n>
                 In case a referral is returned during referral chasing,
                 further chasing occurs at most <n> levels deep.  Set to 1
                 (the default) to disable further referral chasing.

          chain-return-error {FALSE|true}
                 In case referral chasing fails, the real error is returned
                 instead of the original referral.  In case multiple
                 referral URIs are present, only the first error is
                 returned.  This behavior may not be always appropriate nor
                 desirable, since failures in referral chasing might be
                 better resolved by the client (e.g. when caused by
                 distributed authentication issues).

          chain-uri <ldapuri>
                 This directive instantiates a new underlying ldap database
                 and instructs it about which URI to contact to chase
                 referrals.  As opposed to what stated in slapd-ldap(5),
                 only one URI can appear after this directive; all
                 subsequent slapd-ldap(5) directives prefixed by chain-
                 refer to this specific instance of a remote server.

          Directives for configuring the underlying ldap database may also
          be required, as shown in this example:

                 overlay                 chain
                 chain-rebind-as-user    FALSE

                 chain-uri               "ldap://ldap1.example.com"
                 chain-rebind-as-user    TRUE
                 chain-idassert-bind     bindmethod="simple"
                                         binddn="cn=Auth,dc=example,dc=com"
                                         credentials="secret"
                                         mode="self"

                 chain-uri               "ldap://ldap2.example.com"
                 chain-idassert-bind     bindmethod="simple"
                                         binddn="cn=Auth,dc=example,dc=com"
                                         credentials="secret"
                                         mode="none"

          Any valid directives for the ldap database may be used; see
          slapd-ldap(5) for details.  Multiple occurrences of the chain-uri
          directive may appear, to define multiple "trusted" URIs where
          operations with identity assertion are chained.  All URIs not
          listed in the configuration are chained anonymously.  All
          slapd-ldap(5) directives appearing before the first occurrence of
          chain-uri are inherited by all URIs, unless specifically
          overridden inside each URI configuration.


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file


---------------------------------------------------------

::

          slapd.conf(5), slapd-config(5), slapd-ldap(5), slapd(8).


-----------------------------------------------------

::

          Originally implemented by Howard Chu; extended by Pierangelo
          Masarati.

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

   OpenLDAP LDVERSION             RELEASEDATE                SLAPO-CHAIN(5)

--------------

Pages that refer to this page:
`slapd-ldap(5) <../man5/slapd-ldap.5.html>`__, 
`slapd.overlays(5) <../man5/slapd.overlays.5.html>`__, 
`slapo-ppolicy(5) <../man5/slapo-ppolicy.5.html>`__

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
