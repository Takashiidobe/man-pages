.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-deref(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO-DEREF(5)             File Formats Manual            SLAPO-DEREF(5)

NAME
-------------------------------------------------

::

          slapo-deref - Dereference Control overlay to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf

          ETCDIR/slapd.d


---------------------------------------------------------------

::

          This overlay implements the draft Dereference control. The
          overlay can be used with any backend or globally for all
          backends.


---------------------------------------------------------

::

            database mdb
            ...
            overlay deref

          Given these entries:
            dn: cn=Howard Chu,ou=people,dc=example,dc=org
            objectClass: inetOrgPerson
            cn: Howard Chu
            sn: Chu
            uid: hyc

            dn: cn=Pierangelo Masarati,ou=people,dc=example,dc=org
            objectClass: inetOrgPerson
            cn: Pierangelo Masarati
            sn: Masarati
            uid: ando

            dn: cn=Test Group,ou=groups,dc=example,dc=org
            objectClass: groupOfNames
            cn: Test Group
            member: cn=Howard Chu,ou=people,dc=example,dc=org
            member: cn=Pierangelo Masarati,ou=people,dc=example,dc=org

          A search could be performed with a Dereference request control
          value specified as

            { member, uid }

          I.e.,
            ldapsearch -x -b dc=example,dc=org -E 'deref=member:uid'

          and the "cn=Test Group" entry would be returned with the response
          control value
            { { member, cn=Howard Chu,ou=people,dc=example,dc=org,
                { { uid, [hyc] } } },
              { member, cn=Pierangelo Masarati,ou=people,dc=example,dc=org,
                { { uid, [ando] } } } }


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

          IETF LDAP Dereference Control proposal by P. Masarati, H. Chu, in
          IETF document "draft-masarati-ldap-deref-00.txt".


-----------------------------------------------------

::

          Pierangelo Masarati

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

   OpenLDAP LDVERSION             RELEASEDATE                SLAPO-DEREF(5)

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
