.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ninfod(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COPYING <#COPYING>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NINFOD(8)                        iputils                       NINFOD(8)

NAME
-------------------------------------------------

::

          ninfod - Respond to IPv6 Node Information Queries


---------------------------------------------------------

::

          ninfod [-dhv] [-p pidfile] [-u user] [-v]


---------------------------------------------------------------

::

          Responds to IPv6 Node Information Queries (RFC4620) from clients.
          Queries can be sent by various implementations of ping command.


-------------------------------------------------------

::

          -d
              Debug mode. Do not go background.

          -h
              Show help.

          -v
              Verbose mode.

          -u user
              Run as another user.  user can either be username or user ID.

          -p pidfile
              File for process-id storage.  user is required to be able to
              create the file.

          -V
              Print version and exit.


---------------------------------------------------------

::

          ping(8).


-----------------------------------------------------

::

          ninfod was written by USAGI/WIDE Project.


-------------------------------------------------------

::

              Copyright (C) 2012 YOSHIFUJI Hideaki.
              Copyright (C) 2002 USAGI/WIDE Project.
              All rights reserved.

              Redistribution and use in source and binary forms, with or without
              modification, are permitted provided that the following conditions
              are met:
              1. Redistributions of source code must retain the above copyright
                 notice, this list of conditions and the following disclaimer.
              2. Redistributions in binary form must reproduce the above copyright
                 notice, this list of conditions and the following disclaimer in the
                 documentation and/or other materials provided with the distribution.
              3. Neither the name of the project nor the names of its contributors
                 may be used to endorse or promote products derived from this software
                 without specific prior written permission.

              THIS SOFTWARE IS PROVIDED BY THE PROJECT AND CONTRIBUTORS “AS IS” AND
              ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
              IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
              ARE DISCLAIMED.  IN NO EVENT SHALL THE PROJECT OR CONTRIBUTORS BE LIABLE
              FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
              DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
              OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
              HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
              LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
              OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
              SUCH DAMAGE.

COLOPHON
---------------------------------------------------------

::

          This page is part of the iputils (IP utilities) project.
          Information about the project can be found at 
          ⟨http://www.skbuff.net/iputils/⟩.  If you have a bug report for
          this manual page, send it to yoshfuji@skbuff.net,
          netdev@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/iputils/iputils.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   iputils 20210722                                               NINFOD(8)

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
