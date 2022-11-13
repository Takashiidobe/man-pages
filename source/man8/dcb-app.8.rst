.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dcb-app(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `EXAM                             |                                   |
| PLE & USAGE <#EXAMPLE_&_USAGE>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DCB-ETS(8)                        Linux                       DCB-ETS(8)

NAME
-------------------------------------------------

::

          dcb-app - show / manipulate application priority table of the DCB
          (Data Center Bridging) subsystem


---------------------------------------------------------

::

          dcb [ OPTIONS ] app { COMMAND | help }

          dcb app  {  show  |  flush  }  dev DEV [ default-prio ] [
                  ethtype-prio ] [ stream-port-prio ] [ dgram-port-prio ] [
                  port-prio ] [ dscp-prio ]

          dcb ets  {  add  |  del  |  replace  }  dev DEV [ default-prio
                  PRIO-LIST ] [ ethtype-prio ET-MAP ] [ stream-port-prio
                  PORT-MAP ] [ dgram-port-prio PORT-MAP ] [ port-prio PORT-
                  MAP ] [ dscp-prio DSCP-MAP ]

          PRIO-LIST := [ PRIO-LIST ] PRIO

          ET-MAP := [ ET-MAP ] ET-MAPPING

          ET-MAPPING := ET:PRIO

          PORT-MAP := [ PORT-MAP ] PORT-MAPPING

          PORT-MAPPING := PORT:PRIO

          DSCP-MAP := [ DSCP-MAP ] DSCP-MAPPING

          DSCP-MAPPING := { DSCP | all }:PRIO

          ET := { 0x600 .. 0xffff }

          PORT := { 1 .. 65535 }

          DSCP := { 0 .. 63 }

          PRIO := { 0 .. 7 }


---------------------------------------------------------------

::

          dcb app is used to configure APP table, or application priority
          table in the DCB (Data Center Bridging) subsystem. The APP table
          is used to assign priority to traffic based on value in one of
          several headers: EtherType, L4 destination port, or DSCP. It also
          allows configuration of port-default priority that is chosen if
          no other prioritization rule applies.

          DCB APP entries are 3-tuples of selector, protocol ID, and
          priority. Selector is an enumeration that picks one of the
          prioritization namespaces. Currently it mostly corresponds to
          configurable parameters described below. Protocol ID is a value
          in the selector namespace. E.g. for EtherType selector, protocol
          IDs are the individual EtherTypes, for DSCP they are individual
          code points. The priority is the priority that should be assigned
          to traffic that matches the selector and protocol ID.

          The APP table is a set of DCB APP entries. The only requirement
          is that duplicate entries are not added. Notably, it is valid to
          have conflicting priority assignment for the same selector and
          protocol ID. For example, the set of two APP entries (DSCP, 10,
          1) and (DSCP, 10, 2), where packets with DSCP of 10 should get
          priority of both 1 and 2, form a well-defined APP table. The dcb
          app tool allows low-level management of the app table by adding
          and deleting individual APP 3-tuples through add and del
          commands. On the other other hand, the command replace does what
          one would typically want in this situation--first adds the new
          configuration, and then removes the obsolete one, so that only
          one prioritization is in effect for a given selector and protocol
          ID.


---------------------------------------------------------

::

          show   Display all entries with a given selector. When no
                 selector is given, shows all APP table entries categorized
                 per selector.

          flush  Remove all entries with a given selector. When no selector
                 is given, removes all APP table entries.

          add
          del    Add and, respectively, remove individual APP 3-tuples to
                 and from the DCB APP table.

          replace
                 Take the list of entries mentioned as parameter, and add
                 those that are not present in the APP table yet. Then
                 remove those entries, whose selector and protocol ID have
                 been mentioned as parameter, but not with the exact same
                 priority. This has the effect of, for the given selector
                 and protocol ID, causing that the table only contains the
                 priority (or priorities) given as parameter.


-------------------------------------------------------------

::

          The following table shows parameters in a way that they would be
          used with add, del and replace commands. For show and flush, the
          parameter name is to be used as a simple keyword without further
          arguments.

          default-prio PRIO-LIST
                 The priority to be used for traffic the priority of which
                 is otherwise unspecified. The argument is a list of
                 individual priorities. Note that default-prio rules are
                 configured as triplets (EtherType, 0, PRIO).  dcb app
                 translates these rules to the symbolic name default-prio
                 and back.

          ethtype-prio ET-MAP
                 ET-MAP uses the array parameter syntax, see dcb(8) for
                 details. Keys are EtherType values. Values are priorities
                 to be assigned to traffic with the matching EtherType.

          stream-port-prio PORT-MAP
          dgram-port-prio PORT-MAP
          port-prio PORT-MAP
                 PORT-MAP uses the array parameter syntax, see dcb(8) for
                 details. Keys are L4 destination port numbers that match
                 on, respectively, TCP and SCTP traffic, UDP and DCCP
                 traffic, and either of those. Values are priorities that
                 should be assigned to matching traffic.

          dscp-prio DSCP-MAP
                 DSCP-MAP uses the array parameter syntax, see dcb(8) for
                 details. Keys are DSCP points, values are priorities
                 assigned to traffic with matching DSCP. DSCP points can be
                 written either direcly as numeric values, or using
                 symbolic names specified in /etc/iproute2/rt_dsfield
                 (however note that that file specifies full 8-bit dsfield
                 values, whereas dcb app will only use the higher six
                 bits).  dcb app show will similarly format DSCP values as
                 symbolic names if possible. The command line option -N
                 turns the show translation off.


-----------------------------------------------------------------------

::

          Prioritize traffic with DSCP 0 to priority 0, 24 to 3 and 48 to
          6:

          # dcb app add dev eth0 dscp-prio 0:0 24:3 48:6

          Add another rule to configure DSCP 24 to priority 2 and show the
          result:

          # dcb app add dev eth0 dscp-prio 24:2
          # dcb app show dev eth0 dscp-prio
          dscp-prio 0:0 CS3:2 CS3:3 CS6:6
          # dcb -N app show dev eth0 dscp-prio
          dscp-prio 0:0 24:2 24:3 48:6

          Reconfigure the table so that the only rule for DSCP 24 is for
          assignment of priority 4:

          # dcb app replace dev eth0 dscp-prio 24:4
          # dcb app show dev eth0 dscp-prio
          dscp-prio 0:0 24:4 48:6

          Flush all DSCP rules:

          # dcb app flush dev eth0 dscp-prio
          # dcb app show dev eth0 dscp-prio
          (nothing)


---------------------------------------------------------------

::

          Exit status is 0 if command was successful or a positive integer
          upon failure.


---------------------------------------------------------

::

          dcb(8)


---------------------------------------------------------------------

::

          Report any bugs to the Network Developers mailing list
          <netdev@vger.kernel.org> where the development and maintenance is
          primarily done.  You do not have to be subscribed to the list to
          send a message there.


-----------------------------------------------------

::

          Petr Machata <me@pmachata.org>

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

   iproute2                     6 December 2020                  DCB-ETS(8)

--------------

Pages that refer to this page: `dcb(8) <../man8/dcb.8.html>`__

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
