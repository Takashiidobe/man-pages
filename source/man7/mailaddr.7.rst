.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mailaddr(7) — Linux manual page
===============================

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

   MAILADDR(7)                Linux User's Manual               MAILADDR(7)

NAME
-------------------------------------------------

::

          mailaddr - mail addressing description


---------------------------------------------------------------

::

          This manual page gives a brief introduction to SMTP mail
          addresses, as used on the Internet.  These addresses are in the
          general format

               user@domain

          where a domain is a hierarchical dot-separated list of
          subdomains.  These examples are valid forms of the same address:

               john.doe@monet.example.com
               John Doe <john.doe@monet.example.com>
               john.doe@monet.example.com (John Doe)

          The domain part ("monet.example.com") is a mail-accepting domain.
          It can be a host and in the past it usually was, but it doesn't
          have to be.  The domain part is not case sensitive.

          The local part ("john.doe") is often a username, but its meaning
          is defined by the local software.  Sometimes it is case
          sensitive, although that is unusual.  If you see a local-part
          that looks like garbage, it is usually because of a gateway
          between an internal e-mail system and the net, here are some
          examples:

               "surname/admd=telemail/c=us/o=hp/prmd=hp"@some.where
               USER%SOMETHING@some.where
               machine!machine!name@some.where
               I2461572@some.where

          (These are, respectively, an X.400 gateway, a gateway to an
          arbitrary internal mail system that lacks proper internet
          support, an UUCP gateway, and the last one is just boring
          username policy.)

          The real-name part ("John Doe") can either be placed before <>,
          or in () at the end.  (Strictly speaking the two aren't the same,
          but the difference is beyond the scope of this page.)  The name
          may have to be quoted using "", for example, if it contains ".":

               "John Q. Doe" <john.doe@monet.example.com>

      Abbreviation
          Some mail systems let users abbreviate the domain name.  For
          instance, users at example.com may get away with "john.doe@monet"
          to send mail to John Doe.  This behavior is deprecated.
          Sometimes it works, but you should not depend on it.

      Route-addrs
          In the past, sometimes one had to route a message through several
          hosts to get it to its final destination.  Addresses which show
          these relays are termed "route-addrs".  These use the syntax:

               <@hosta,@hostb:user@hostc>

          This specifies that the message should be sent to hosta, from
          there to hostb, and finally to hostc.  Many hosts disregard
          route-addrs and send directly to hostc.

          Route-addrs are very unusual now.  They occur sometimes in old
          mail archives.  It is generally possible to ignore all but the
          "user@hostc" part of the address to determine the actual address.

      Postmaster
          Every site is required to have a user or user alias designated
          "postmaster" to which problems with the mail system may be
          addressed.  The "postmaster" address is not case sensitive.


---------------------------------------------------

::

          /etc/aliases
          ~/.forward


---------------------------------------------------------

::

          mail(1), aliases(5), forward(5), sendmail(8)

          IETF RFC 5322 ⟨http://www.ietf.org/rfc/rfc5322.txt⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   4.2 Berkeley Distribution      2020-08-13                    MAILADDR(7)

--------------

Pages that refer to this page:
`hostname(7) <../man7/hostname.7.html>`__, 
`uri(7) <../man7/uri.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/mailaddr.7.license.html>`__

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
