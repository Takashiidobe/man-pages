.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcp-dstat(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OPTIONAL METRICS PLUGI           |                                   |
| NS <#OPTIONAL_METRICS_PLUGINS>`__ |                                   |
| \|                                |                                   |
| `HISTORICAL METRICS PLUGINS       |                                   |
|  <#HISTORICAL_METRICS_PLUGINS>`__ |                                   |
| \|                                |                                   |
| `INTERMEDIATE U                   |                                   |
| PDATES <#INTERMEDIATE_UPDATES>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCP-DSTAT(1)             General Commands Manual            PCP-DSTAT(1)

NAME
-------------------------------------------------

::

          pcp-dstat - versatile tool for generating system resource
          statistics


---------------------------------------------------------

::

          pcp [pcp options] dstat [-acdfghilmnpqrstvVy?]  [-C cpus] [-D
          disks] [-L DM devices] [-M MD devices] [-P partitions] [-I
          interrupts] [-N interfaces] [-o output-file] [-S swap-devices]
          [--bits] [--bw] [--color] [--float] [--integer] [--nocolor]
          [--noheaders] [--noupdate] [--list] [--pidfile pid-file]
          [--plugin] [--all-plugins] [delay [count]]


---------------------------------------------------------------

::

          pcp-dstat is a general performance analysis tool allowing you to
          view multiple system resources instantly, for example you can
          compare disk usage in combination with interrupts from a disk
          controller, or compare the network bandwidth numbers directly
          with the disk throughput (in the same interval).

          It also cleverly gives you the most detailed information in
          columns and clearly indicates in what magnitude and unit the
          output is being displayed.  Less confusion, fewer mistakes, more
          efficient.

          The delay is the delay in seconds between each update, and the
          count is the number of updates to display before exiting.  The
          default delay is 1 second and count is unspecified (run until
          interrupted or end of archive is reached).

          This latest generation of Dstat, pcp-dstat, allows for analysis
          of historical performance data (in the PCP archive format created
          by pmlogger(1)), as well as distributed systems analysis of live
          performance data from remote hosts running the pmcd(1) process.

          The original Dstat notion of ``plugins'' is replaced by use of
          named metrics in a Performance Metric Name Space (PMNS(5))
          supplied by Performance Metric Domain Agents (PMDAs).  Metrics
          and other formatting information is now specified as plugin
          configuration files in pcp-dstat(5) format.  This new style of
          plugin is either built-in (time-related reporting only), or
          sourced from the system-wide location ($PCP_SYSCONF_DIR/dstat)
          and/or sourced from an individual users set of personal plugins
          ($HOME/.pcp/dstat).

          The list of all available plugins can be seen using the --list
          dstat command line option.


-------------------------------------------------------

::

          When invoked via the pcp(1) command, the -h/--host, -a/--archive,
          -O/--origin, -Z/--timezone and several other pcp options become
          indirectly available; refer to PCPIntro(1) for a complete
          description of these options.

          The additional command line options available for pcp-dstat are:

          --list list all available plugin names

          --plugin-name
               enable any plugin by name

          -a, --all
               equals -cdngy (default plugin set)

          -c, --cpu
               enable CPU stats (system, user, idle, wait); for more CPU
               related stats also see --cpu-adv and --cpu-use

          -C 0,3,total
               include CPU0, CPU3 and total (when using -c/--cpu); use all
               to show all CPUs

          -d, --disk
               enable disk stats (read, write); for more disk related stats
               look into the other --disk plugins

          -D total,hda
               include total and hda (when using -d/--disk or --disk-tps
               plugin)

          --dm, --device-mapper
               enable device mapper stats (read, write); for more device-
               mapper related stats look into the other --dm plugins

          --L total,root,home
               include total, root and home (when using --dm/--device-
               mapper or --dm-tps plugin)

          --md, --multi-device
               enable multi-device driver stats (read, write); for more
               multi-device driver related stats look into the other --md
               plugins

          --M total,md-0
               include total and md-0 (when using --md/--multi-device or
               --md-tps plugin)

          --part, --partition
               enable disk partition stats (read, write); for more
               partition related stats look into the other --part plugins

          --P total,sda2
               include total and sda2 (when using --part/--partition or
               --part-tps plugin)

          -g, --page
               enable page stats (page in, page out)

          -i, --int
               enable interrupt stats

          -I 5,10
               include interrupt 5 and 10 (when using -i/--int)

          -l, --load
               enable load average stats (1 min, 5 mins, 15 mins)

          -m, --mem
               enable memory stats (used, buffers, cache, free); for more
               memory related stats also try --mem-adv and --swap

          -n, --net
               enable network stats (receive, send)

          -N eth1,total
               include eth1 and total (when using -n/--net)

          --net-packets
               show the number of packets received and transmitted

          -p, --proc
               enable process stats (runnable, uninterruptible, new)

          --proc-count
               show total number of processes

          -r, --io
               enable I/O request stats (read, write requests)

          -s, --swap
               enable swap stats (used, free)

          -S swap1,total
               include swap1 and total (when using -s/--swap)

          --snooze show time spent between updates in seconds

          -t, --time
                 enable time/date output (try --time-adv for millisecond
                 precision)

          -T, --epoch
                 enable time counter (seconds since epoch, or millisecond
                 precision from the --epoch-adv plugin)

          -y, --sys
                 enable system stats (interrupts, context switches)

          --aio  enable aio stats (asynchronous I/O)

          --cpu-adv
                 enable advanced CPU stats

          --cpu-use
                 enable only CPU usage stats

          --disk-avgqu
                 average queue length of the requests that were issued to
                 the device

          --disk-avgrq
                 average size (in sectors) of the requests that were issued
                 to the device

          --disk-svctm
                 average service time (in milliseconds) for I/O requests
                 that were issued to the device

          --disk-tps
                 number of transfers per second that were issued to the
                 device

          --disk-util
                 percentage of CPU time during which I/O requests were
                 issued to the device (bandwidth utilization for the
                 device)

          --disk-wait
                 average time (in milliseconds) for I/O requests issued to
                 the device to be served

          --fs, --filesystem
                 enable filesystem stats (open files, inodes)

          --freespace
                 per filesystem used and available space

          --ipc  enable ipc stats (message queue, semaphores, shared
                 memory)

          --lock enable file lock stats (posix, flock, read, write)

          --mem-adv
                 enable advanced memory stats

          --raw  enable raw stats (raw sockets)

          --socket
                 enable socket stats (total, tcp, udp, raw, ip-fragments)

          --tcp  enable tcp stats (listen, established, syn, time_wait,
                 close)

          --udp  enable udp stats (listen, active)

          --unix enable unix stats (datagram, stream, listen, active)

          --utmp shows login information from utmp(5)

          --vm   enable virtual memory stats (hard pagefaults, soft
                 pagefaults, allocated, free)

          --vm-adv
                 enable advance virtual memory stats (steal, scanK, scanD,
                 pgoru, astll)

          --nfs3 show NFS v3 client operations

          --nfs3-ops
                 show extended NFS v3 client operations

          --nfsd3
                 show NFS v3 server operations

          --nfsd3-ops
                 show extended NFS v3 server operations

          --nfsd4-ops
                 show extended NFS v4 server operations

          --nfsstat4
                 show NFS v4 stats

          --rpc  show remote procedure call (RPC) client calls stats

          --rpcd show remote procedure call (RPC) server calls stats

          -f, --full
                 expand -C, -D, -I, -N and -S discovery lists

          -v, --vmstat
                 equals -pmgdsc -D total

          --bits force bits for values expressed in bytes

          --float
                 force float values on screen (mutually exclusive with
                 --integer)

          --integer
                 force integer values on screen (mutually exclusive with
                 --float)

          --bw, --blackonwhite
                 change colors for white background terminal

          --nocolor
                 disable colors

          --noheaders
                 disable repetitive headers

          --noupdate
                 disable intermediate updates when delay greater than 1.

          -o file, --output=file
                 write CSV (Comma-Separated Value) format output to a file.

          -p file, --pidfile=file
                 write the process identifier to a given file.


-----------------------------------------------------------------------------------------

::

          Some pcp-dstat configuration files require the installation of
          optional Performance Metric Domain Agents, above and beyond the
          default installed set.

          --gpfs
               GPFS read/write I/O (needs the GPFS PMDA)

          --gpfs-ops
               GPFS filesystem operations (needs the GPFS PMDA)

          --innodb-buffer
               show innodb buffer stats (needs the MySQL PMDA)

          --innodb-io
               show innodb I/O stats (needs the MySQL PMDA)

          --innodb-ops
               show innodb operations counters (needs the MySQL PMDA)

          --lustre
               show lustre I/O throughput (needs the Lustre PMDA)

          --memcache-hits
               show the number of hits and misses from memcache

          --mysql5-cmds
               show the MySQL5 command stats (needs the MySQL PMDA)

          --mysql5-conn
               show the MySQL5 connection stats (needs the MySQL PMDA)

          --mysql5-innodb
               show the MySQL5 innodb stats (needs the MySQL PMDA)

          --mysql5-io
               show the MySQL5 I/O stats (needs the MySQL PMDA)

          --mysql5-keys
               show the MySQL5 keys stats (needs the MySQL PMDA)

          --mysql-io
               show the MySQL I/O stats (needs the MySQL PMDA)

          --mysql-keys
               show the MySQL keys stats (needs the MySQL PMDA)

          --postfix
               show postfix queue sizes (needs the Postfix PMDA)

          --redis
               show Redis stats (needs the Redis PMDA)

          --sendmail
               show sendmail queue size (needs the Sendmail PMDA)


---------------------------------------------------------------------------------------------

::

          Anyone can create additional, custom pcp-dstat plugin
          configuration files, for any metrics - the list of available
          metrics can be produced by either the pminfo(1) or pmprobe(1)
          command.

          The following do not yet have metrics backing them, but have been
          included from the original Dstat utility.  Please contact
          <pcp@groups.io> if you need or implement any of these, and we'll
          work with you to get them included.

          --battery
               battery in percentage (needs an ACPI PMDA)

          --battery-remain
               battery remaining in hours, minutes (needs an ACPI PMDA)

          --cpufreq
               CPU frequency in percentage (needs an ACPI PMDA)

          --dbus
               number of dbus connections (needs a python-dbus PMDA)

          --fan
               fan speed (needs an ACPI PMDA)

          --md-status
               show software raid (MD driver) progress and speed (needs new
               disk.md metrics)

          --power
               show power usage (needs an ACPI PMDA)

          --qmail
               show qmail queue sizes (needs qmail)

          --squid
               show squid usage statistics (needs a Squid PMDA)

          --thermal
               system temperature sensors (needs an ACPI PMDA)

          --vm-cpu
               show VMware CPU stats from hypervisor (needs a VMware PMDA)

          --vm-mem
               show VMware memory stats from hypervisor (needs a VMware
               PMDA)

          --vm-mem-adv
               show advanced VMware memory stats from hypervisor (needs a
               VMware PMDA)

          --vmk-hba
               show VMware ESX kernel vmhba stats (needs a VMware PMDA)

          --vmk-int
               show VMware ESX kernel interrupt stats (needs a VMware PMDA)

          --vmk-nic
               show VMware ESX kernel port stats (needs a VMware PMDA)

          --vz-cpu
               show CPU usage per OpenVZ guest (needs an OpenVZ PMDA)

          --vz-io
               show I/O usage per OpenVZ guest (needs an OpenVZ PMDA)

          --vz-ubc
               show OpenVZ user beancounters (needs an OpenVZ PMDA)

          --wifi
               wireless link quality and signal to noise ratio (needs Linux
               PMDA metrics)

          --zfs-arc
               show ZFS arc stats (needs a Linux ZFS PMDA)

          --zfs-l2arc
               show ZFS l2arc stats (needs a Linux ZFS PMDA)

          --zfs-zil
               show ZFS zil stats (needs a Linux ZFS PMDA)


---------------------------------------------------------------------------------

::

          When invoking pcp-dstat with a delay greater than 1 second and
          without the --noupdate option, it will show intermediate updates,
          i.e., the first time a 1 second average, the second update a 2
          second average, etc. until the delay has been reached.

          So in case you specified a delay of 10, the 9 intermediate
          updates are NOT snapshots, they are averages over the time that
          passed since the last final update.  The end result is that you
          get a 10 second average on a new line, just like with vmstat(1).


---------------------------------------------------------

::

          Using pcp-dstat to relate disk-throughput with network-usage
          (eth0), total CPU-usage and system counters:

               $ pcp dstat -dnyc -N eth0 -C total -f 5

          Using the time plugin together with cpu, net, disk, system, load
          and proc plugins:

               $ pcp dstat -tcndylp

          This is identical to:

               $ pcp dstat --time --cpu --net --disk --sys --load --proc

          Using pcp-dstat to report 10 samples from metrics recorded in a
          PCP archive 20180729 from 2:30 AM:
           $ pcp --origin '@02:30' -a 20180729 dstat --time --cpu-adv --sys 1 10

          Examine the same metrics live from a remote host:

               $ pcp --host www.acme.com dstat --time --cpu-adv --sys 1 10


---------------------------------------------------

::

          $HOME/.pcp/dstat/
               private per-user configuration files

          $PCP_SYSCONF_DIR/dstat/
               system-wide configuration files


---------------------------------------------------------------

::

          Internal plugins behaviour can be changed through environment
          variables.

          DSTAT_TIMEFMT
                 strftime(3) format string for reporting time (see --time)


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).

          For environment variables affecting PCP tools, see
          pmGetOptions(3).


-------------------------------------------------------

::

          The Dstat utility was initially written by Dag Wieers
          <dag@wieers.com>.

          The Dstat homepage is at http://dag.wieers.com/home-made/dstat/ .

          This manpage was initially written by Andrew Pollock
          <apollock@debian.org> for the Debian GNU/Linux system.

          The pcp-dstat utility is written and maintained by the PCP
          developers <pcp@groups.io>.

          The PCP homepage is at https://pcp.io/ .


---------------------------------------------------------

::

          PCPIntro(1), pcp(1), pmcd(1), pminfo(1), pmlogger(1), pmprobe(1),
          vmstat(1), pmGetOptions(3), strftime(3), PMNS(5), pcp.conf(5),
          pcp-dstat(5) and utmp(5).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                      PCP-DSTAT(1)

--------------

Pages that refer to this page:
`pcp-dstat(5) <../man5/pcp-dstat.5.html>`__

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
