.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

devlink(8) — Linux manual page
==============================

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

   DEVLINK(8)                        Linux                       DEVLINK(8)

NAME
-------------------------------------------------

::

          devlink - Devlink tool


---------------------------------------------------------

::

          devlink [ OPTIONS ] {
                  dev|port|monitor|sb|resource|region|health|trap } {
                  COMMAND | help }

          devlink [ -force ] -batch filename


-------------------------------------------------------

::

          -V, --Version
                 Print the version of the devlink utility and exit.

          -b, -batch <FILENAME>
                 Read commands from provided file or standard input and
                 invoke them.  First failure will cause termination of
                 devlink.

          -force Don't terminate devlink on errors in batch mode.  If there
                 were any errors during execution of the commands, the
                 application return code will be non zero.

          -n, --no-nice-names
                 Turn off printing out nice names, for example netdevice
                 ifnames instead of devlink port identification.

          -j, --json
                 Generate JSON output.

          -p, --pretty
                 When combined with -j generate a pretty JSON output.

          -v, --verbose
                 Turn on verbose output.

          -s, --statistics
                 Output statistics.

          -N, -Netns <NETNSNAME>
                 Switches to the specified network namespace.

          -i, --iec
                 Print human readable rates in IEC units (e.g. 1Ki = 1024).

      OBJECT
          dev    - devlink device.

          port   - devlink port.

          monitor
                 - watch for netlink messages.

          sb     - devlink shared buffer configuration.

          resource
                 - devlink device resource configuration.

          region - devlink address region access

          health - devlink reporting and recovery

          trap   - devlink trap configuration

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

          devlink-dev(8), devlink-port(8), devlink-monitor(8),
          devlink-sb(8), devlink-resource(8), devlink-region(8),
          devlink-health(8), devlink-trap(8),


---------------------------------------------------------------------

::

          Report any bugs to the Network Developers mailing list
          <netdev@vger.kernel.org> where the development and maintenance is
          primarily done.  You do not have to be subscribed to the list to
          send a message there.


-----------------------------------------------------

::

          Jiri Pirko <jiri@mellanox.com>

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

   iproute2                       14 Mar 2016                    DEVLINK(8)

--------------

Pages that refer to this page:
`devlink-dev(8) <../man8/devlink-dev.8.html>`__, 
`devlink-dpipe(8) <../man8/devlink-dpipe.8.html>`__, 
`devlink-health(8) <../man8/devlink-health.8.html>`__, 
`devlink-monitor(8) <../man8/devlink-monitor.8.html>`__, 
`devlink-port(8) <../man8/devlink-port.8.html>`__, 
`devlink-rate(8) <../man8/devlink-rate.8.html>`__, 
`devlink-region(8) <../man8/devlink-region.8.html>`__, 
`devlink-resource(8) <../man8/devlink-resource.8.html>`__, 
`devlink-sb(8) <../man8/devlink-sb.8.html>`__, 
`devlink-trap(8) <../man8/devlink-trap.8.html>`__

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
