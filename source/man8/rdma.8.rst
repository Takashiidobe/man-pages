.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma(8) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA(8)                           Linux                          RDMA(8)

NAME
-------------------------------------------------

::

          rdma - RDMA tool


---------------------------------------------------------

::

          rdma [ OPTIONS ] OBJECT { COMMAND | help }

          rdma [ -force ] -batch filename

          OBJECT := { dev | link | resource | system | statistic }

          OPTIONS := { -V[ersion] | -d[etails] } -j[son] } -p[retty] }


-------------------------------------------------------

::

          -V, -Version
                 Print the version of the rdma tool and exit.

          -b, -batch <FILENAME>
                 Read commands from provided file or standard input and
                 invoke them.  First failure will cause termination of
                 rdma.

          -force Don't terminate rdma on errors in batch mode.  If there
                 were any errors during execution of the commands, the
                 application return code will be non zero.

          -d, --details
                 Output detailed information.  Adding a second -d includes
                 driver-specific details.

          -r, --raw
                 Output includes driver-specific details in raw format.

          -p, --pretty
                 When combined with -j generate a pretty JSON output.

          -j, --json
                 Generate JSON output.

      OBJECT
          dev    - RDMA device.

          link   - RDMA port related.

          resource
                 - RDMA resource configuration.

          sys    - RDMA subsystem related.

          statistic
                 - RDMA counter statistic related.

          The names of all objects may be written in full or abbreviated
          form, for example stats can be abbreviated as stat or just s.

      COMMAND
          Specifies the action to perform on the object.  The set of
          possible actions depends on the object type.  As a rule, it is
          possible to show (or list ) objects, but some objects do not
          allow all of these operations or have some additional commands.
          The help command is available for all objects. It prints out a
          list of available commands and argument syntax conventions.

          If no command is given, some default command is assumed.  Usually
          it is list or, if the objects of this class cannot be listed,
          help.


---------------------------------------------------------------

::

          Exit status is 0 if command was successful or a positive integer
          upon failure.


---------------------------------------------------------

::

          rdma-dev(8), rdma-link(8), rdma-resource(8), rdma-system(8),
          rdma-statistic(8),


---------------------------------------------------------------------

::

          Report any bugs to the Linux RDMA mailing list <linux-
          rdma@vger.kernel.org> where the development and maintenance is
          primarily done.  You do not have to be subscribed to the list to
          send a message there.


-----------------------------------------------------

::

          Leon Romanovsky <leonro@mellanox.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the iproute2 (utilities for controlling
          TCP/IP networking and traffic) project.  Information about the
          project can be found at 
          ⟨http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2⟩.
          If you have a bug report for this manual page, send it to
          netdev@vger.kernel.org, shemminger@osdl.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/network/iproute2/iproute2.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-18.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   iproute2                       28 Mar 2017                       RDMA(8)

--------------

Pages that refer to this page: `rxe(7) <../man7/rxe.7.html>`__, 
`rdma-dev(8) <../man8/rdma-dev.8.html>`__, 
`rdma-link(8) <../man8/rdma-link.8.html>`__, 
`rdma-resource(8) <../man8/rdma-resource.8.html>`__, 
`rdma-statistic(8) <../man8/rdma-statistic.8.html>`__, 
`rdma-system(8) <../man8/rdma-system.8.html>`__

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
