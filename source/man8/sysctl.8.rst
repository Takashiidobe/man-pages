.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sysctl(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `DEPRECATED PARAM                 |                                   |
| ETERS <#DEPRECATED_PARAMETERS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSCTL(8)                 System Administration                SYSCTL(8)

NAME
-------------------------------------------------

::

          sysctl - configure kernel parameters at runtime


---------------------------------------------------------

::

          sysctl [options] [variable[=value]] [...]
          sysctl -p [file or regexp] [...]


---------------------------------------------------------------

::

          sysctl is used to modify kernel parameters at runtime.  The
          parameters available are those listed under /proc/sys/.  Procfs
          is required for sysctl support in Linux.  You can use sysctl to
          both read and write sysctl data.


-------------------------------------------------------------

::

          variable
                 The name of a key to read from.  An example is
                 kernel.ostype.  The '/' separator is also accepted in
                 place of a '.'.

          variable=value
                 To set a key, use the form variable=value where variable
                 is the key and value is the value to set it to.  If the
                 value contains quotes or characters which are parsed by
                 the shell, you may need to enclose the value in double
                 quotes.

          -n, --values
                 Use this option to disable printing of the key name when
                 printing values.

          -e, --ignore
                 Use this option to ignore errors about unknown keys.

          -N, --names
                 Use this option to only print the names.  It may be useful
                 with shells that have programmable completion.

          -q, --quiet
                 Use this option to not display the values set to stdout.

          -w, --write
                 Use this option when all arguments prescribe a key to be
                 set.

          -p[FILE], --load[=FILE]
                 Load in sysctl settings from the file specified or
                 /etc/sysctl.conf if none given.  Specifying - as filename
                 means reading data from standard input.  Using this option
                 will mean arguments to sysctl are files, which are read in
                 the order they are specified.  The file argument may be
                 specified as regular expression.

          -a, --all
                 Display all values currently available.

          --deprecated
                 Include deprecated parameters to --all values listing.

          -b, --binary
                 Print value without new line.

          --system
                 Load settings from all system configuration files. Files
                 are read from directories in the following list in given
                 order from top to bottom.  Once a file of a given filename
                 is loaded, any file of the same name in subsequent
                 directories is ignored.
                 /etc/sysctl.d/*.conf
                 /run/sysctl.d/*.conf
                 /usr/local/lib/sysctl.d/*.conf
                 /usr/lib/sysctl.d/*.conf
                 /lib/sysctl.d/*.conf
                 /etc/sysctl.conf

          -r, --pattern pattern
                 Only apply settings that match pattern.  The pattern uses
                 extended regular expression syntax.

          -A     Alias of -a

          -d     Alias of -h

          -f     Alias of -p

          -X     Alias of -a

          -o     Does nothing, exists for BSD compatibility.

          -x     Does nothing, exists for BSD compatibility.

          -h, --help
                 Display help text and exit.

          -V, --version
                 Display version information and exit.


---------------------------------------------------------

::

          /sbin/sysctl -a
          /sbin/sysctl -n kernel.hostname
          /sbin/sysctl -w kernel.domainname="example.com"
          /sbin/sysctl -p/etc/sysctl.conf
          /sbin/sysctl -a --pattern forward
          /sbin/sysctl -a --pattern forward$
          /sbin/sysctl -a --pattern 'net.ipv4.conf.(eth|wlan)0.arp'
          /sbin/sysctl  --pattern '^net.ipv6' --system


-----------------------------------------------------------------------------------

::

          The base_reachable_time and retrans_time are deprecated.  The
          sysctl command does not allow changing values of these
          parameters.  Users who insist to use deprecated kernel interfaces
          should push values to /proc file system by other means.  For
          example:

          echo 256 > /proc/sys/net/ipv6/neigh/eth0/base_reachable_time


---------------------------------------------------

::

          /proc/sys
          /etc/sysctl.d/*.conf
          /run/sysctl.d/*.conf
          /usr/local/lib/sysctl.d/*.conf
          /usr/lib/sysctl.d/*.conf
          /lib/sysctl.d/*.conf
          /etc/sysctl.conf


---------------------------------------------------------

::

          sysctl.conf(5) regex(7)


-----------------------------------------------------

::

          George Staikos ⟨staikos@0wned.org⟩


---------------------------------------------------------------------

::

          Please send bug reports to ⟨procps@freelists.org⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of the procps-ng (/proc filesystem utilities)
          project.  Information about the project can be found at 
          ⟨https://gitlab.com/procps-ng/procps⟩.  If you have a bug report
          for this manual page, see
          ⟨https://gitlab.com/procps-ng/procps/blob/master/Documentation/bugs.md⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://gitlab.com/procps-ng/procps.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   procps-ng                      2020-02-27                      SYSCTL(8)

--------------

Pages that refer to this page:
`perfalloc(1) <../man1/perfalloc.1.html>`__, 
`pmdaperfevent(1) <../man1/pmdaperfevent.1.html>`__, 
`coredump.conf(5) <../man5/coredump.conf.5.html>`__, 
`lxc.container.conf(5) <../man5/lxc.container.conf.5.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`sysctl.conf(5) <../man5/sysctl.conf.5.html>`__, 
`sysctl.d(5) <../man5/sysctl.d.5.html>`__, 
`flowtop(8) <../man8/flowtop.8.html>`__, 
`systemd-coredump(8) <../man8/systemd-coredump.8.html>`__, 
`systemd-sysctl.service(8) <../man8/systemd-sysctl.service.8.html>`__

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
