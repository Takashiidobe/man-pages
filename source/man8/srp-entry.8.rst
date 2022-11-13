.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

srp-entry(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SRP-ENTRY(8)             System Manager's Manual            SRP-ENTRY(8)

NAME
-------------------------------------------------

::

          srp-entry - Generate a SRP-SHA1 Server Entry


---------------------------------------------------------

::

          srp-entry [ -i index ] [ clientname ]


---------------------------------------------------------------

::

          This utility generates an entry suitable for use in the
          /etc/ppp/srp-secrets file on a PPP EAP SRP-SHA1 authenticator
          ("server").  This file has the same basic layout as the other
          pppd(8) authentication files, /etc/ppp/pap-secrets and
          /etc/ppp/chap-secrets.  Thus, the entry generated has at least
          four main fields separated by spaces.  The first field is the
          authenticatee ("client") name.  The second is the server name.
          The third is the secret.  The fourth is the allowed (or assigned)
          IP address for the client, and defaults to "*".  Additional
          fields can contain additional IP addresses or pppd options; see
          pppd(8) for details.

          The third field has three subfields, separated by colons.  The
          first subfield is the index of the modulus and generator from
          SRP's /etc/tpasswd.conf.  The special value 0 is used to
          represent the well-known modulus and generator specified in the
          EAP SRP-SHA1 draft.  The second subfield is the password
          validator.  The third is the password salt.  These latter two
          values are encoded in base64 notation.


-------------------------------------------------------

::

          -i <index>
                 Specifies the modulus/generator index in
                 /etc/tpasswd.conf.  In order to use this option, you will
                 need to run the "tconf" utility from the SRP package to
                 generate local entries for this file.  Note that if these
                 values are not known to the client, the client will be
                 forced to run time-consuming safety tests on the values
                 used.  For this reason, using the well-known values is
                 recommended.

          <clientname>
                 Specifies the client name.  The password validator is a
                 hashed combination of the client's name and password, and
                 both are required.  If the client name is not supplied on
                 the command line, srp-entry will prompt for the client
                 name first.


---------------------------------------------------

::

          /etc/ppp/srp-secrets
                 Usernames, passwords and IP addresses for SRP
                 authentication.  This file should be owned by root and not
                 readable or writable by any other user.  Pppd will log a
                 warning if this is not the case.  Note that srp-entry does
                 not write to this file.  The user is responsible for
                 copying the output of srp-entry into this file.

          /etc/tpasswd.conf
                 Indexed copies of tested modulus/generator combinations;
                 part of the SRP package.


---------------------------------------------------------

::

          pppd(8)

          RFC2284
                 Blunk, L., Vollbrecht, J., PPP Extensible Authentication
                 Protocol (EAP).  March 1998.

          draft-ietf-pppext-eap-srp-03.txt
                 Carlson, J., et al., EAP SRP-SHA1 Authentication Protocol.
                 July 2001.

          RFC2945
                 Wu, T., The SRP Authentication and Key Exchange System
                 September 2000.


-----------------------------------------------------

::

          James Carlson (james.d.carlson@sun.com)

COLOPHON
---------------------------------------------------------

::

          This page is part of the ppp (An implementation of the Point-to-
          Point Protocol (PPP)) project.  Information about the project can
          be found at ⟨https://ppp.samba.org/⟩.  If you have a bug report
          for this manual page, see
          ⟨https://github.com/paulusmack/ppp/issues⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/paulusmack/ppp⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-07.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                               SRP-ENTRY(8)

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
