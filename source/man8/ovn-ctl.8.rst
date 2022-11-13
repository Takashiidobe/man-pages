.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ovn-ctl(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILE LOCATION OP                 |                                   |
| TIONS <#FILE_LOCATION_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `ADDRESS AND PORT OPTIO           |                                   |
| NS <#ADDRESS_AND_PORT_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `CLUSTERING                       |                                   |
|  OPTIONS <#CLUSTERING_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `CONFIGURATIO                     |                                   |
| N FILES <#CONFIGURATION_FILES>`__ |                                   |
| \|                                |                                   |
| `RUNNING OVN DB SERVER            |                                   |
| S WITHOUT DETACHING <#RUNNING_OVN |                                   |
| _DB_SERVERS_WITHOUT_DETACHING>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| EXAMPLE USAGE <#EXAMPLE_USAGE>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ovn-ctl(8)                 Open vSwitch Manual                ovn-ctl(8)

NAME
-------------------------------------------------

::

          ovn-ctl - Open Virtual Network northbound daemon lifecycle
          utility


---------------------------------------------------------

::

          ovn-ctl [options] command


---------------------------------------------------------------

::

          This program is intended to be invoked internally by Open Virtual
          Network startup scripts. System administrators should not
          normally invoke it directly.


---------------------------------------------------------

::

          start_northd
          start_controller
          start_controller_vtep
          stop_northd
          stop_controller
          stop_controller_vtep
          restart_northd
          restart_controller
          restart_controller_vtep
          promote_ovnnb
          promote_ovnsb
          demote_ovnnb
          demote_ovnsb
          status_ovnnb
          status_ovnsb
          start_ovsdb
          start_nb_ovsdb
          start_sb_ovsdb
          stop_ovsdb
          stop_nb_ovsdb
          stop_sb_ovsdb
          restart_ovsdb
          run_nb_ovsdb
          run_sb_ovsdb


-------------------------------------------------------

::

          --ovn-northd-priority=NICE

          --ovn-northd-wrapper=WRAPPER

          --ovn-controller-priority=NICE

          --ovn-controller-wrapper=WRAPPER

          --ovn-user=USER:GROUP

          --ovs-user=USER:GROUP

          -h | --help


-----------------------------------------------------------------------------------

::

          --db-sock=SOCKET

          --db-nb-file=FILE

          --db-sb-file=FILE

          --db-nb-schema=FILE

          --db-sb-schema=FILE

          --db-sb-create-insecure-remote=yes|no

          --db-nb-create-insecure-remote=yes|no

          --ovn-controller-ssl-key=KEY

          --ovn-controller-ssl-cert=CERT

          --ovn-controller-ssl-ca-cert=CERT

          --ovn-controller-ssl-bootstrap-ca-cert=CERT


-----------------------------------------------------------------------------------------

::

          --db-nb-sync-from-addr=IP ADDRESS

          --db-nb-sync-from-port=PORT NUMBER

          --db-nb-sync-from-proto=PROTO

          --db-sb-sync-from-addr=IP ADDRESS

          --db-sb-sync-from-port=PORT NUMBER

          --db-sb-sync-from-proto=PROTO

           --ovn-northd-nb-db=PROTO:IP ADDRESS: PORT..

           --ovn-northd-sb-db=PROTO:IP ADDRESS: PORT..


-----------------------------------------------------------------------------

::

          --db-nb-cluster-local-addr=IP ADDRESS

          --db-nb-cluster-local-port=PORT NUMBER

          --db-nb-cluster-local-proto=PROTO (tcp/ssl)

          --db-nb-cluster-remote-addr=IP ADDRESS

          --db-nb-cluster-remote-port=PORT NUMBER

          --db-nb-cluster-remote-proto=PROTO (tcp/ssl)

          --db-sb-cluster-local-addr=IP ADDRESS

          --db-sb-cluster-local-port=PORT NUMBER

          --db-sb-cluster-local-proto=PROTO (tcp/ssl)

          --db-sb-cluster-remote-addr=IP ADDRESS

          --db-sb-cluster-remote-port=PORT NUMBER

          --db-sb-cluster-remote-proto=PROTO (tcp/ssl)


-------------------------------------------------------------------------------

::

          Following are the optional configuration files. If present, it
          should be located in the etc dir

      ovnnb-active.conf
          If present, this file should hold the url to connect to the
          active Northbound DB server

          tcp:x.x.x.x:6641

      ovnsb-active.conf
          If present, this file should hold the url to connect to the
          active Southbound DB server

          tcp:x.x.x.x:6642

      ovn-northd-db-params.conf
          If present, start_northd will not start the DB server even if
          --ovn-manage-ovsdb=yes. This file should hold the database url
          parameters to be passed to ovn-northd.

          --ovnnb-db=tcp:x.x.x.x:6641 --ovnsb-db=tcp:x.x.x.x:6642


-------------------------------------------------------------------------------------------------------------------------

::

          # ovn-ctl run_nb_ovsdb

          This command runs the OVN nb ovsdb-server without passing the
          detach option, making it to block until ovsdb-server exits. This
          command will be useful for starting the OVN nb ovsdb-server in a
          container.

          # ovn-ctl run_sb_ovsdb

          This command runs the OVN sb ovsdb-server without passing the
          detach option, making it to block until ovsdb-server exits. This
          command will be useful for starting the OVN sb ovsdb-server in a
          container.


-------------------------------------------------------------------

::

      Run ovn-controller on a host already running OVS
          # ovn-ctl start_controller

      Run ovn-northd on a host already running OVS
          # ovn-ctl start_northd

      All-in-one OVS+OVN for testing
          # ovs-ctl start --system-id="random"

          # ovn-ctl start_northd

          # ovn-ctl start_controller

      Promote and demote ovsdb servers
          # ovn-ctl promote_ovnnb

          # ovn-ctl promote_ovnsb

          # ovn-ctl --db-nb-sync-from-addr=x.x.x.x
          --db-nb-sync-from-port=6641 demote_ovnnb

          # ovn-ctl --db-sb-sync-from-addr=x.x.x.x
          --db-sb-sync-from-port=6642 demote_ovnsb

      Creating a clustered db on 3 nodes with IPs x.x.x.x, y.y.y.y and
          z.z.z.z
        Starting OVN ovsdb servers and ovn-northd on the node with IP
        x.x.x.x

           # ovn-ctl --db-nb-addr=x.x.x.x
          --db-nb-create-insecure-remote=yes --db-sb-addr=x.x.x.x
          --db-sb-create-insecure-remote=yes
          --db-nb-cluster-local-addr=x.x.x.x
          --db-sb-cluster-local-addr=x.x.x.x
          --ovn-northd-nb-db=tcp:x.x.x.x:6641,tcp:y.y.y.y:6641,tcp:z.z.z.z:6641
          --ovn-northd-sb-db=tcp:x.x.x.x:6642,tcp:y.y.y.y:6642,tcp:z.z.z.z:6642
          start_northd

        Starting OVN ovsdb-servers and ovn-northd on the node with IP
        y.y.y.y and joining the cluster started at x.x.x.x

           # ovn-ctl --db-nb-addr=y.y.y.y
          --db-nb-create-insecure-remote=yes --db-sb-addr=y.y.y.y
          --db-sb-create-insecure-remote=yes
          --db-nb-cluster-local-addr=y.y.y.y
          --db-sb-cluster-local-addr=y.y.y.y
          --db-nb-cluster-remote-addr=x.x.x.x
          --db-sb-cluster-remote-addr=x.x.x.x
          --ovn-northd-nb-db=tcp:x.x.x.x:6641,tcp:y.y.y.y:6641,tcp:z.z.z.z:6641
          --ovn-northd-sb-db=tcp:x.x.x.x:6642,tcp:y.y.y.y:6642,tcp:z.z.z.z:6642
          start_northd

        Starting OVN ovsdb-servers and ovn-northd on the node with IP
        z.z.z.z and joining the cluster started at x.x.x.x

           # ovn-ctl --db-nb-addr=z.z.z.z
          --db-nb-create-insecure-remote=yes
          --db-nb-cluster-local-addr=z.z.z.z --db-sb-addr=z.z.z.z
          --db-sb-create-insecure-remote=yes
          --db-sb-cluster-local-addr=z.z.z.z
          --db-nb-cluster-remote-addr=x.x.x.x
          --db-sb-cluster-remote-addr=x.x.x.x
          --ovn-northd-nb-db=tcp:x.x.x.x:6641,tcp:y.y.y.y:6641,tcp:z.z.z.z:6641
          --ovn-northd-sb-db=tcp:x.x.x.x:6642,tcp:y.y.y.y:6642,tcp:z.z.z.z:6642
          start_northd

      Passing ssl keys when starting OVN dbs will supercede the default ssl
          values in db
        Starting standalone ovn db server passing SSL certificates

           # ovn-ctl --ovn-nb-db-ssl-key=/etc/openvswitch/ovnnb-privkey.pem
          --ovn-nb-db-ssl-cert=/etc/openvswitch/ovnnb-cert.pem
          --ovn-nb-db-ssl-ca-cert=/etc/openvswitch/cacert.pem
          --ovn-sb-db-ssl-key=/etc/openvswitch/ovnsb-privkey.pem
          --ovn-sb-db-ssl-cert=/etc/openvswitch/ovnsb-cert.pem
          --ovn-sb-db-ssl-ca-cert=/etc/openvswitch/cacert.pem start_northd

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

   Open vSwitch 2.10.90             ovn-ctl                      ovn-ctl(8)

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
