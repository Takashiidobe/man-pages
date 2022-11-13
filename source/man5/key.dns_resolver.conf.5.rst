.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

key.dns_resolver.conf(5) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KEY.DNS_RESOLVER.CONF(5)ux Key Management Utilities.DNS_RESOLVER.CONF(5)

NAME
-------------------------------------------------

::

          key.dns_resolver.conf - Kernel DNS resolver config


---------------------------------------------------------------

::

          This file is used by the key.dns_resolver(5) program to set
          parameters.  Unless otherwise overridden with the -c flag, the
          program reads:

                 /etc/key.dns_resolver.conf

          Configuration options are given in key[=value] form, where value
          is optional.  If present, the value may be surrounded by a pair
          of single ('') or double quotes ("") which will be stripped off.
          The special characters in the value may be escaped with a
          backslash to turn them into ordinary characters.

          Lines beginning with a '#' are considered comments and ignored.
          A '#' symbol anywhere after the '=' makes the rest of the line
          into a comment unless the '#' is inside a quoted section or is
          escaped.

          Leading and trailing spaces and spaces around the '=' symbol will
          be stripped off.

          Available options include:

          default_ttl=<number>
                 The number of seconds to set as the expiration on a cached
                 record.  This will be overridden if the program manages to
                 retrieve TTL information along with the addresses (if, for
                 example, it accesses the DNS directly).  The default is 5
                 seconds.  The value must be in the range 1 to INT_MAX.

          The file can also include comments beginning with a '#' character
          unless otherwise suppressed by being inside a quoted value or
          being escaped with a backslash.


---------------------------------------------------

::

          /etc/key.dns_resolver.conf


---------------------------------------------------------

::

          key.dns_resolver(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the keyutils (key management utilities)
          project.  Information about the project can be found at [unknown
          -- if you know, please contact man-pages@man7.org] If you have a
          bug report for this manual page, send it to
          keyrings@linux-nfs.org.  This page was obtained from the
          project's upstream Git repository
          ⟨http://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2020-07-07.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Linux                          18 May 2020      KEY.DNS_RESOLVER.CONF(5)

--------------

Pages that refer to this page:
`key.dns_resolver(8) <../man8/key.dns_resolver.8.html>`__

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
