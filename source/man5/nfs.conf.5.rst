.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfs.conf(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SECTIONS <#SECTIONS>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NFS.CONF(5)                File Formats Manual               NFS.CONF(5)

NAME
-------------------------------------------------

::

          nfs.conf - general configuration for NFS daemons and tools


---------------------------------------------------------

::

          /etc/nfs.conf


---------------------------------------------------------------

::

          This file contains site-specific configuration for various NFS
          daemons and other processes.  Most configuration can also be
          passed to processes via command line arguments, but it can be
          more convenient to have a central file.  In particular, this
          encourages consistent configuration across different processes.

          When command line options are provided, they override values set
          in this file.  When this file does not specify a particular
          parameter, and no command line option is provided, each tool
          provides its own default values.

          The file format supports multiple sections, each of which can
          contain multiple value assignments.  A section is introduced by a
          line containing the section name enclosed in square brackets, so
                 [global]
          would introduce a section called global.  A value assignment is a
          single line that has the name of the value, an equals sign, and a
          setting for the value, so
                 threads = 4
          would set the value named threads in the current section to 4.
          Leading and trailing spaces and tab are ignored, as are spaces
          and tabs surrounding the equals sign.  Single and double quotes
          surrounding the assigned value are also removed.  If the
          resulting string is empty, the whole assignment is ignored.

          Any line starting with “#” or “;” is ignored, as is any blank
          line.

          If the assigned value started with a “$” then the remainder is
          treated as a name and looked for in the section [environment] or
          in the processes environment (see environ(7)).  The value found
          is used for this value.

          The value name include is special.  If a section contains
                 include = /some/file/name
          then the named file will be read, and any value assignments found
          there-in will be added to the current section.  If the file
          contains section headers, then new sections will be created just
          as if the included file appeared in place of the include line.
          If the file name starts with a hyphen then that is stripped off
          before the file is opened, and if file doesn't exist no warning
          is given.  Normally a non-existent include file generates a
          warning.

          Lookup of section and value names is case-insensitive.

          Where a Boolean value is expected, any of true, t, yes, y, on, or
          1 can be used for "true", while false, f, no, n, off, or 0 can be
          used for "false".  Comparisons are case-insensitive.


---------------------------------------------------------

::

          The following sections are known to various programs, and can
          contain the given named values.  Most sections can also contain a
          debug value, which can be one or more from the list general,
          call, auth, parse, all.  When a list is given, the members should
          be comma-separated.

          general
                 Recognized values: pipefs-directory.

                 See blkmapd(8), rpc.idmapd(8), and rpc.gssd(8) for
                 details.

          exports
                 Recognized values: rootdir.

                 Setting rootdir to a valid path causes the nfs server to
                 act as if the supplied path is being prefixed to all the
                 exported entries. For instance, if rootdir=/my/root, and
                 there is an entry in /etc/exports for /filesystem, then
                 the client will be able to mount the path as /filesystem,
                 but on the server, this will resolve to the path
                 /my/root/filesystem.

          exportd
                 Recognized values: threads, cache-use-upaddr, ttl, state-
                 directory-path

                 See exportd(8) for details.

                 Note that setting "debug = auth" for exportd is equivalent
                 to providing the --log-auth option.

          nfsdcltrack
                 Recognized values: storagedir.

                 The nfsdcltrack program is run directly by the Linux
                 kernel and there is no opportunity to provide command line
                 arguments, so the configuration file is the only way to
                 configure this program.  See nfsdcltrack(8) for details.

          nfsd   Recognized values: threads, host, port, grace-time, lease-
                 time, udp, tcp, vers2, vers3, vers4, vers4.0, vers4.1,
                 vers4.2, rdma,

                 Version and protocol values are Boolean values as
                 described above, and are also used by rpc.mountd.  Threads
                 and the two times are integers.  port and rdma are service
                 names or numbers.  See rpc.nfsd(8) for details.

          mountd Recognized values: manage-gids, descriptors, port,
                 threads, reverse-lookup, cache-use-upaddr, ttl, state-
                 directory-path, ha-callout.

                 These, together with the protocol and version values in
                 the [nfsd] section, are used to configure mountd.  See
                 rpc.mountd(8) for details.

                 Note that setting "debug = auth" for mountd is equivalent
                 to providing the --log-auth option.

                 The state-directory-path value in the [mountd] section is
                 also used by exportfs(8).

          statd  Recognized values: port, outgoing-port, name, state-
                 directory-path, ha-callout.

                 See rpc.statd(8) for details.

          lockd  Recognized values: port and udp-port.

                 See rpc.statd(8) for details.

          sm-notify
                 Recognized values: retry-time, outgoing-port, and
                 outgoing-addr.

                 See sm-notify(8) for details.

          gssd   Recognized values: verbosity, rpc-verbosity, use-memcache,
                 use-machine-creds, use-gss-proxy, avoid-dns, limit-to-
                 legacy-enctypes, context-timeout, rpc-timeout, keytab-
                 file, cred-cache-directory, preferred-realm, set-home.

                 See rpc.gssd(8) for details.

          svcgssd
                 Recognized values: principal.

                 See rpc.svcgssd(8) for details.

          exportfs
                 Only debug= is recognized.


---------------------------------------------------

::

          /etc/nfs.conf
                 Default NFS client configuration file

          /etc/nfs.conf.d
                 When this directory exists and files ending with ".conf"
                 exist, those files will be used to set configuration
                 variables. These files will override variables set in
                 /etc/nfs.conf


---------------------------------------------------------

::

          nfsdcltrack(8), rpc.nfsd(8), rpc.mountd(8), nfsmount.conf(5).

COLOPHON
---------------------------------------------------------

::

          This page is part of the nfs-utils (NFS utilities) project.
          Information about the project can be found at 
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, see
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=summary⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                                NFS.CONF(5)

--------------

Pages that refer to this page:
`nfs.systemd(7) <../man7/nfs.systemd.7.html>`__, 
`blkmapd(8) <../man8/blkmapd.8.html>`__, 
`exportd(8) <../man8/exportd.8.html>`__, 
`exportfs(8) <../man8/exportfs.8.html>`__, 
`mountd(8) <../man8/mountd.8.html>`__, 
`nfsd(8) <../man8/nfsd.8.html>`__

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
