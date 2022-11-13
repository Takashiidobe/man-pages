.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xtables-legacy(8) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `USAGE <#USAGE>`__ \|             |                                   |
| `LIMITATIONS <#LIMITATIONS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   XTABLES-LEGACY(8)        System Manager's Manual       XTABLES-LEGACY(8)

NAME
-------------------------------------------------

::

          xtables-legacy — iptables using old getsockopt/setsockopt-based
          kernel api


---------------------------------------------------------------

::

          xtables-legacy are the original versions of iptables that use old
          getsockopt/setsockopt-based kernel interface.  This kernel
          interface has some limitations, therefore iptables can also be
          used with the newer nf_tables based API.  See xtables-nft(8) for
          information about the xtables-nft variants of iptables.


---------------------------------------------------

::

          The xtables-legacy-multi binary can be linked to the traditional
          names:

               /sbin/iptables -> /sbin/iptables-legacy-multi
               /sbin/ip6tables -> /sbin/ip6tables-legacy-multi
               /sbin/iptables-save -> /sbin/ip6tables-legacy-multi
               /sbin/iptables-restore -> /sbin/ip6tables-legacy-multi

          The iptables version string will indicate whether the legacy API
          (get/setsockopt) or the new nf_tables API is used:
               iptables -V
               iptables v1.7 (legacy)


---------------------------------------------------------------

::

          When inserting a rule using iptables -A or iptables -I, iptables
          first needs to retrieve the current active ruleset, change it to
          include the new rule, and then commit back the result.  This
          means that if two instances of iptables are running concurrently,
          one of the updates might be lost.  This can be worked around
          partially with the --wait option.

          There is also no method to monitor changes to the ruleset, except
          periodically calling iptables-legacy-save and checking for any
          differences in output.

          xtables-monitor(8) will need the xtables-nft(8) versions to work,
          it cannot display changes made using the iptables-legacy tools.


---------------------------------------------------------

::

          xtables-nft(8), xtables-translate(8)


-------------------------------------------------------

::

          Rusty Russell originally wrote iptables, in early consultation
          with Michael Neuling.

COLOPHON
---------------------------------------------------------

::

          This page is part of the iptables (administer and maintain packet
          filter rules) project.  Information about the project can be
          found at ⟨http://www.netfilter.org/⟩.  If you have a bug report
          for this manual page, see ⟨http://bugzilla.netfilter.org/⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨git://git.netfilter.org/iptables⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-11.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                   June 2018              XTABLES-LEGACY(8)

--------------

`Copyright and license for this manual
page <../man8/xtables-legacy.8.license.html>`__

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
