.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ovs-sim(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ovs-sim(1)                 Open vSwitch Manual                ovs-sim(1)

NAME
-------------------------------------------------

::

          ovs-sim - Open vSwitch simulator environment


---------------------------------------------------------

::

          ovs-sim [option]... [script]...


---------------------------------------------------------------

::

          ovs-sim provides a convenient environment for running one or more
          Open vSwitch instances and related software in a sandboxed
          simulation environment.

          To use ovs-sim, first build Open vSwitch, then invoke it directly
          from the build directory, e.g.:

          git clone https://github.com/openvswitch/ovs.git
          cd ovs
          ./configure
          make
          utilities/ovs-sim

          When invoked in the most ordinary way as shown above, ovs-sim
          does the following:

                 1.
                   Creates a directory sandbox as a subdirectory of the
                   current directory (first destroying such a directory if
                   it already exists) and cds into that directory.

                 2.
                   Installs all of the Open vSwitch manpages into a man
                   subdirectory of sandbox and adjusts the MANPATH
                   environment variable so that man and other manpage
                   viewers can find them.

                 3.
                   Creates a simulated Open vSwitch named main and sets it
                   up as the default target for OVS commands, as if the
                   following ovs-sim commands had been run:

                             sim_add main
                             as main

                   See Commands, below, for an explanation.

                 4.
                   Runs any scripts specified on the command line (see
                   Options below). The scripts can use arbitrary Bash
                   syntax, plus the additional commands described under
                   Commands, below.

                 5.
                   If no scripts were specified, or if -i or --interactive
                   was specified, invokes an interactive Bash subshell. The
                   user can use arbitrary Bash commands, plus the
                   additional commands described under Commands, below.

          ovs-sim and the sandbox environment that it creates does not
          require superuser or other special privileges. Generally, it
          should not be run with such privileges.


-------------------------------------------------------

::

          ovs-sim accepts the following options and arguments:

                 script Runs script, which should be a Bash script, within
                        a subshell after initializing. If multiple script
                        arguments are given, then they are run in the order
                        given. If any script exits with a nonzero exit
                        code, then ovs-sim exits immediately with the same
                        exit code.

                 -i
                 --interactive
                      By default, if any script is specified, ovs-sim exits
                      as soon as the scripts finish executing. With this
                      option, or if no scripts are specified, ovs-sim
                      instead starts an interactive Bash session.


---------------------------------------------------------

::

          Scripts and interactive usage may use the following commands
          implemented by ovs-sim. They are implemented as Bash shell
          functions exported to subshells.

      Basic Commands
          These are the basic commands for working with sandboxed Open
          vSwitch instances.

                 sim_add sandbox
                        Starts a new simulated Open vSwitch instance named
                        sandbox. Files related to the instance, such as
                        logs, databases, sockets, and pidfiles, are created
                        in a subdirectory also named sandbox. Afterward,
                        the as command (see below) can be used to run Open
                        vSwitch utilities in the context of the new
                        sandbox.

                        The new sandbox starts out without any bridges. Use
                        ovs-vsctl in the context of the new sandbox to
                        create a bridge, e.g.:

                        sim_add hv0           # Create sandbox hv0.
                        as hv0                # Set hv0 as default sandbox.
                        ovs-vsctl add-br br0  # Add bridge br0 inside hv0.

                        The Open vSwitch instances that sim_add create
                        enable ``dummy’’ devices. This means that bridges
                        and interfaces can be created with type dummy to
                        indicate that they should be totally simulated,
                        without any reference to system entities. In fact,
                        ovs-sim also configures Open vSwitch so that the
                        default system type of bridges and interfaces are
                        replaced by dummy devices. Other types of devices,
                        however, retain their usual functions, which means
                        that, e.g., vxlan tunnels still act as tunnels
                        (refer to the documentation).

                 as sandbox
                        Sets sandbox as the default simulation target for
                        Open vSwitch commands (e.g. ovs-vsctl, ovs-ofctl,
                        ovs-appctl).

                        This command updates the beginning of the shell
                        prompt to indicate the new default target.

                 as sandbox command arg...
                        Runs the given command with sandbox as the
                        simulation target, e.g. as hv0 ovs-vsctl add-br br0
                        runs ovs-vsctl add-br br0 within sandbox hv0. The
                        default target is unchanged.

      Interconnection Network Commands
          When multiple sandboxed Open vSwitch instances exist, one will
          inevitably want to connect them together. These commands allow
          for that. Conceptually, an interconnection network is a switch
          that ovs-sim makes it easy to plug into other switches in other
          sandboxed Open vSwitch instances. Interconnection networks are
          implemented as bridges in the main switch that ovs-sim creates by
          default, so to use interconnection networks please avoid working
          with main directly.

                 net_add network
                        Creates a new interconnection network named
                        network.

                 net_attach network bridge
                        Adds a new port to bridge in the default sandbox
                        (as set with as) and plugs it into the network
                        interconnection network. network must already have
                        been created by a previous invocation of net_add.
                        The default sandbox must not be main.

      OVN Commands
          These commands interact with OVN, the Open Virtual Network.

                 ovn_start
                        Creates and initializes the central OVN databases
                        (both ovn-sb(5) and ovn-nb) and starts an instance
                        of ovsdb-server for each one. Also starts an
                        instance of ovn-northd.

                 ovn_attach network bridge ip [masklen]
                        First, this command attaches bridge to
                        interconnection network network, just like
                        net_attach network bridge. Second, it configures
                        (simulated) IP address ip (with network mask length
                        masklen, which defaults to 24) on bridge. Finally,
                        it configures the Open vSwitch database to work
                        with OVN and starts ovn-controller.


---------------------------------------------------------

::

          The following creates a pair of Open vSwitch instances hv0 and
          hv1, adds a port named vif0 or vif1, respectively, to each one,
          and then connects the two through an interconnection network n1:

          net_add n1
          for i in 0 1; do
              sim_add hv$i
              as hv$i ovs-vsctl add-br br0 -- add-port br0 vif$i
              as hv$i net_attach n1 br0
          done

          Here’s an extended version that also starts OVN:

          ovn_start
          ovn-nbctl ls-add lsw0
          net_add n1
          for i in 0 1; do
              sim_add hv$i
              as hv$i
              ovs-vsctl add-br br-phys
              ovn_attach n1 br-phys 192.168.0.`expr $i + 1`
              ovs-vsctl add-port br-int vif$i -- set Interface vif$i external-ids:iface-id=lp$i
              ovn-nbctl lsp-add lsw0 lp$i
              ovn-nbctl lsp-set-addresses lp$i f0:00:00:00:00:0$i
          done

          Here’s a primitive OVN ``scale test’’ (adjust the scale by
          changing n in the first line :

          n=200; export n
          ovn_start
          net_add n1
          ovn-nbctl ls-add br0
          for i in `seq $n`; do
              (sim_add hv$i
              as hv$i
              ovs-vsctl add-br br-phys
              y=$(expr $i / 256)
              x=$(expr $i % 256)
              ovn_attach n1 br-phys 192.168.$y.$x
              ovs-vsctl add-port br-int vif$i -- set Interface vif$i external-ids:iface-id=lp$i) &
              case $i in
                  *50|*00) echo $i; wait ;;
              esac
          done
          wait
          for i in `seq $n`; do
              yy=$(printf %02x $(expr $i / 256))
              xx=$(printf $02x $(expr $i % 256))
              ovn-nbctl lsp-add br0 lp$i
              ovn-nbctl lsp-set-addresses lp$i f0:00:00:00:$yy:$xx
          done

          When the scale test has finished initializing, you can watch the
          logical ports come up with a command like this:

          watch ’for i in `seq $n`; do if test `ovn-nbctl lsp-get-up lp$i` != up; then echo $i; fi; done’

COLOPHON
---------------------------------------------------------

::

          This page is part of the Open vSwitch (a distributed virtual
          multilayer switch) project.  Information about the project can be
          found at ⟨http://openvswitch.org/⟩.  If you have a bug report for
          this manual page, send it to bugs@openvswitch.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/openvswitch/ovs.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-20.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Open vSwitch 2.8.90              ovs-sim                      ovs-sim(1)

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
