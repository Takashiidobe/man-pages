.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pppd-radius(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `USAGE <#USAGE>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PPPD-RADIUS(8)           System Manager's Manual          PPPD-RADIUS(8)

NAME
-------------------------------------------------

::

          radius.so - RADIUS authentication plugin for pppd(8)


---------------------------------------------------------

::

          pppd [ options ] plugin radius.so


---------------------------------------------------------------

::

          The RADIUS plugin for pppd permits pppd to perform PAP, CHAP, MS-
          CHAP and MS-CHAPv2 authentication against a RADIUS server instead
          of the usual /etc/ppp/pap-secrets and /etc/ppp/chap-secrets
          files.

          The RADIUS plugin is built on a library called radiusclient which
          has its own configuration files (usually in /etc/radiusclient),
          consult those files for more information on configuring the
          RADIUS plugin


-------------------------------------------------------

::

          The RADIUS plugin introduces one additional pppd option:

          radius-config-file filename
                 The file filename is taken as the radiusclient
                 configuration file.  If this option is not used, then the
                 plugin uses /etc/radiusclient/radiusclient.conf as the
                 configuration file.

          avpair attribute=value
                 Adds an Attribute-Value pair to be passed on to the RADIUS
                 server on each request.

          map-to-ifname
                 Sets Radius NAS-Port attribute to number equal to
                 interface name (Default)

          map-to-ttyname
                 Sets Radius NAS-Port attribute value via libradiusclient
                 library


---------------------------------------------------

::

          To use the plugin, simply supply the plugin radius.so option to
          pppd, and edit /etc/radiusclient/radiusclient.conf appropriately.
          If you use the RADIUS plugin, the normal pppd authentication
          schemes (login, checking the /etc/ppp/*-secrets files) are
          skipped.  The RADIUS server should assign an IP address to the
          peer using the RADIUS Framed-IP-Address attribute.


---------------------------------------------------------

::

          pppd(8) pppd-radattr(8)


-----------------------------------------------------

::

          David F. Skoll <dfs@roaringpenguin.com>

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

                                                             PPPD-RADIUS(8)

--------------

Pages that refer to this page:
`pppd-radattr(8) <../man8/pppd-radattr.8.html>`__

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
