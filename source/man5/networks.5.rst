.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

networks(5) — Linux manual page
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

   NETWORKS(5)            Linux System Administration           NETWORKS(5)

NAME
-------------------------------------------------

::

          networks - network name information


---------------------------------------------------------------

::

          The file /etc/networks is a plain ASCII file that describes known
          DARPA networks and symbolic names for these networks.  Each line
          represents a network and has the following structure:

                 name number aliases ...

          where the fields are delimited by spaces or tabs.  Empty lines
          are ignored.  The hash character (#) indicates the start of a
          comment: this character, and the remaining characters up to the
          end of the current line, are ignored by library functions that
          process the file.

          The field descriptions are:

          name   The symbolic name for the network.  Network names can
                 contain any printable characters except white-space
                 characters or the comment character.

          number The official number for this network in numbers-and-dots
                 notation (see inet(3)).  The trailing ".0" (for the host
                 component of the network address) may be omitted.

          aliases
                 Optional aliases for the network.

          This file is read by the route(8) and netstat(8) utilities.  Only
          Class A, B, or C networks are supported, partitioned networks
          (i.e., network/26 or network/28) are not supported by this file.


---------------------------------------------------

::

          /etc/networks
                 The networks definition file.


---------------------------------------------------------

::

          getnetbyaddr(3), getnetbyname(3), getnetent(3), netstat(8),
          route(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU/Linux                      2008-09-04                    NETWORKS(5)

--------------

Pages that refer to this page:
`getnetent_r(3) <../man3/getnetent_r.3.html>`__, 
`inet(3) <../man3/inet.3.html>`__, 
`inet_net_pton(3) <../man3/inet_net_pton.3.html>`__

--------------

`Copyright and license for this manual
page <../man5/networks.5.license.html>`__

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
