.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rpc(5) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RPC(5)                  Linux Programmer's Manual                 RPC(5)

NAME
-------------------------------------------------

::

          rpc - RPC program number data base


---------------------------------------------------------

::

          /etc/rpc


---------------------------------------------------------------

::

          The rpc file contains user readable names that can be used in
          place of RPC program numbers.  Each line has the following
          information:

          •  name of server for the RPC program
          •  RPC program number
          •  aliases

          Items are separated by any number of blanks and/or tab
          characters.  A '#' indicates the beginning of a comment;
          characters from the '#' to the end of the line are not
          interpreted by routines which search the file.

          Here is an example of the /etc/rpc file from the Sun RPC Source
          distribution.

              #
              # rpc 88/08/01 4.0 RPCSRC; from 1.12   88/02/07 SMI
              #
              portmapper      100000  portmap sunrpc
              rstatd          100001  rstat rstat_svc rup perfmeter
              rusersd         100002  rusers
              nfs             100003  nfsprog
              ypserv          100004  ypprog
              mountd          100005  mount showmount
              ypbind          100007
              walld           100008  rwall shutdown
              yppasswdd       100009  yppasswd
              etherstatd      100010  etherstat
              rquotad         100011  rquotaprog quota rquota
              sprayd          100012  spray
              3270_mapper     100013
              rje_mapper      100014
              selection_svc   100015  selnsvc
              database_svc    100016
              rexd            100017  rex
              alis            100018
              sched           100019
              llockmgr        100020
              nlockmgr        100021
              x25.inr         100022
              statmon         100023
              status          100024
              bootparam       100026
              ypupdated       100028  ypupdate
              keyserv         100029  keyserver
              tfsd            100037
              nsed            100038
              nsemntd         100039


---------------------------------------------------

::

          /etc/rpc
                 RPC program number data base


---------------------------------------------------------

::

          getrpcent(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                         RPC(5)

--------------

Pages that refer to this page:
`getrpcent(3) <../man3/getrpcent.3.html>`__, 
`getrpcent_r(3) <../man3/getrpcent_r.3.html>`__

--------------

`Copyright and license for this manual
page <../man5/rpc.5.license.html>`__

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
