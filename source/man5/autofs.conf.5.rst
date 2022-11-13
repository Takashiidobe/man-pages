.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

autofs.conf(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SECTION autof                    |                                   |
| s CONFIGURATION OPTIONS <#SECTION |                                   |
| _autofs_CONFIGURATION_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `SECTION                          |                                   |
|  amd CONFIGURATION OPTIONS <#SECT |                                   |
| ION_amd_CONFIGURATION_OPTIONS>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUTOFS.CONF(5)             File Formats Manual            AUTOFS.CONF(5)

NAME
-------------------------------------------------

::

          autofs.conf - autofs configuration


---------------------------------------------------------------

::

          Configuration settings used by automount(8) may be changed in the
          configuration file @mapdir@/autofs.conf.

          This file contains two primary sections, autofs and amd.

          Configuration entries may be present at the beginning of the
          configuration file without a section header and are implicitly
          included as part of the autofs section.

          Each section name is enclosed in square brackets with spaces
          between the brackets and the section name. The amd section may be
          followed by further sections, named by the top level mount point
          path, that contain per mount configuration settings.


-----------------------------------------------------------------------------------------------------------------

::

          Configuration settings available are:

          timeout
                 Sets the default mount timeout in seconds. The internal
                 program default is 10 minutes, but the default installed
                 configuration overrides this and sets the timeout to 5
                 minutes to be consistent with earlier autofs releases.

          master_wait
                 Sets the default maximum number of retries (actaul
                 iterations is half this, each is delayed by 2 seconds
                 before retrying) waiting for the master map to become
                 available if it cannot be read at program start (program
                 default 10, then continue). This can be longer if the map
                 source itself waits for availability (such as sss).

          negative_timeout
                 Set the default timeout for caching failed key lookups
                 (program default 60). If the equivalent command line
                 option is given it will override this setting.

          mount_verbose
                 Use the verbose flag when spawning mount(8), and log some
                 process info about the requestor and its parent (program
                 default "no").

          mount_wait
                 Set the default time to wait for a response from a spawned
                 mount(8) before sending it a SIGTERM. Note that we still
                 need to wait for the RPC layer to timeout before the sub-
                 process exits so this isn't ideal but it is the best we
                 can do. The default is to wait until mount(8) returns
                 without intervention.

          umount_wait
                 Set the default time to wait for a response from a spawned
                 umount(8) before sending it a SIGTERM. Note that we still
                 need to wait for the RPC layer to timeout before the sub-
                 process exits so this isn't ideal but it is the best we
                 can do.

          browse_mode
                 Maps are browsable by default (program default "yes").

          mount_nfs_default_protocol
                 Set the default protocol that mount.nfs(8) uses when
                 performing a mount (program default 3). Autofs needs to
                 know the default NFS protocol that mount.nfs(8) uses so it
                 can do special case handling for its availability probe
                 for different NFS protocols. Since we can't identify this
                 default automatically we need to set it in the autofs
                 configuration.

          append_options
                 Determine whether global options, given on the command
                 line or per mount in the master map, are appended to map
                 entry options or if the map entry options replace the
                 global options (program default "yes", append options).

          logging
                 set default log level "none", "verbose" or "debug"
                 (program default "none").

          force_standard_program_map_env
                 override the use of a prefix with standard environment
                 variables when a program map is executed. Since program
                 maps are run as the privileged user setting these standard
                 environment variables opens automount(8) to potential user
                 privilege escalation when the program map is written in a
                 language that can load components from, for example, a
                 user home directory (program default "no").

          map_hash_table_size
                 This configuration option may be used to change the number
                 of hash table slots (default 1024).

                 This configuration option affects the overhead of
                 searching the map entry cache for map entries when there
                 are a large number of entries.  It affects the number of
                 entries that must be looked at to locate a map entry in
                 the map entry cache. For example, the default of 1024 and
                 a direct map with 8000 entries would result in each slot
                 containing an average of 8 entries, which should be
                 acceptable.

                 However, if excessive CPU usage is observed during
                 automount lookups increasing this option can reduce the
                 CPU overhead considerably because it reduces the length of
                 the search chains.

                 Note that the number of entries in a map doesn't
                 necessarily relate to the number of entries used in the
                 map entry cache.

                 There are two distinct cases where the map hash table can
                 make a significant difference, direct maps and indirect
                 maps that use the "browse" option.

                 For indirect maps that do not use the "browse" option
                 entries are added to the map entry cache at lookup so the
                 number of active cache entries, in this case, is usually
                 much less than the number of entries in the map. In this
                 last case it would be unusual for the map entry cache to
                 grow large enough to warrant increasing the default before
                 an event that cleans stale entries, a map re-read for
                 example.

          use_hostname_for_mounts
                 NFS mounts where the host name resolves to more than one
                 IP address are probed for availability and to establish
                 the order in which mounts to them should be tried. To
                 ensure that mount attempts are made only to hosts that are
                 responding and are tried in the order of hosts with the
                 quickest response the IP address of the host needs to be
                 used for the mount.

                 If it is necessary to use the hostname given in the map
                 entry for the mount regardless, then set this option to
                 "yes".

                 Be aware that if this is done there is no defense against
                 the host name resolving to one that isn't responding and
                 while the number of attempts at a successful mount will
                 correspond to the number of addresses the host name
                 resolves to the order will also not correspond to fastest
                 responding hosts.

          disable_not_found_message
                 The original request to add this log message needed it to
                 be unconditional.  That produces, IMHO, unnecessary noise
                 in the log so a configuration option has been added to
                 provide the ability to turn it off. The default is "no" to
                 maintain the current behaviour.

          use_ignore_mount_option
                 An option to enable the use of autofs pseudo option
                 "disable". This option is used as a hint to user space
                 that the mount entry should be ommitted from mount table
                 listings. The default is "no" to avoid unexpected changes
                 in behaviour and so is an opt-in setting.

          sss_master_map_wait
                 Set the time to wait and retry if sssd is unable to read
                 the master map at program start. Program default is 0
                 (don't wait) or 10 if sss supports returning EHSTDOWN when
                 the provider isn't available.

                 If the sss library supports returning EHOSTDOWN when the
                 provider is down then this value is how long to wait
                 between retries reading the master map.  When reading
                 dependent maps or looking up a map key this value is
                 multiplied by the number of retries that would be used
                 when reading the master map.

          use_mount_request_log_id
                 Set whether to use a mount request log id so that log
                 entries for specific mount requests can be easily
                 identified in logs that have multiple concurrent requests.
                 Default is don't use mount request log ids.

      LDAP Configuration
          Configuration settings available are:

          ldap_timeout
                 Set the network response timeout (default 8).  Set timeout
                 value for the synchronous API calls. The default is the
                 LDAP library default of an infinite timeout.

          ldap_network_timeout
                 Set the network response timeout (default 8).

          ldap_uri
                 A space separated list of server uris of the form
                 <proto>://<server>[/] where <proto> can be ldap or ldaps.
                 The option can be given multiple times.  Map entries that
                 include a server name override this option and it is then
                 not used. Default is an empty list in which case either
                 the server given in a map entry or the LDAP configured
                 default is used. This uri list is read at startup and
                 whenever the daemon receives a HUP signal.

                 This configuration option can also be used to request
                 autofs lookup SRV RRs for a domain of the form
                 <proto>:///[<domain dn>]. Note that a trailing "/" is not
                 allowed when using this form. If the domain dn is not
                 specified the dns domain name (if any) is used to
                 construct the domain dn for the SRV RR lookup. The server
                 list returned from an SRV RR lookup is refreshed according
                 to the minimum ttl found in the SRV RR records or after
                 one hour, whichever is less.

          search_base
                 The base dn to use when searching for amap base dn. This
                 entry may be given multiple times and each will be checked
                 for a map base dn in the order they occur in the
                 configuration. The search base list is read at startup and
                 whenever the daemon recieves a HUP signal.

          map_object_class
                 The map object class. In the nisMap schema this
                 corresponds to the class nisMap and in the automountMap
                 schema it corresponds to the class automountMap.

          entry_object_class
                 The map entry object class. In the nisMap schema this
                 corresponds to the class nisObject and in the automountMap
                 schema it corresponds to the class automount.

          map_attribute
                 The attribute used to identify the name of the map to
                 which this entry belongs.  In the nisMap schema this
                 corresponds to the attribute nisMapName and in the
                 automountMap schema it corresponds to the attribute ou or
                 automountMapName.

          entry_attribute
                 The attribute used to identify a map key. In the nisMap
                 schema this corresponds to the attribute cn and in the
                 automountMap schema it corresponds to the attribute
                 automountKey.

          value_attribute
                 The attribute used to identify the value of the map entry.
                 In the nisMap schema this corresponds to the attribute
                 nisMapEntry and in the automountMap schema it corresponds
                 to the attribute automountInformation.

          NOTE:  It is essential that entries use class and attribute in a
                 consistent manner for correct operation of autofs. For
                 example mixing cn and automountKey attributes in automount
                 schema will not work as expected.

          auth_conf_file
                 This configuration option may be used to specify an
                 alternate location for the ldap authentication
                 configuration file. See autofs_ldap_auth.conf(5) for more
                 information.


-----------------------------------------------------------------------------------------------------------

::

          A number of the amd configuration options are not used by autofs,
          some because they are not relevant within autofs, some because
          they are done differently in autofs and others that are not yet
          implemented.

          Since mount_type is always autofs (because there's no user space
          NFS server) the configuration entries relating to that aren't
          used.  Also, server availability is done differently within
          autofs so the options that relate to the amd server monitoring
          sub-system are also not used.

          These options are mount_type, auto_attrcache, portmap_program,
          nfs_vers_ping, nfs_allow_any_interface, nfs_allow_insecure_port,
          nfs_proto, nfs_retransmit_counter, nfs_retransmit_counter_udp,
          nfs_retransmit_counter_tcp, nfs_retransmit_counter_toplvl,
          nfs_retry_interval, nfs_retry_interval_udp,
          nfs_retry_interval_tcp, nfs_retry_interval_toplvl and nfs_vers.

          Other options that are not used within the autofs implementation:

          log_file, truncate_log
                 sends its output to syslog so an alternate log file (or
                 truncating the log) can't be used.

          print_pid
                 There's no corresponding option for this within autofs.

          use_tcpwrappers, show_statfs_entries
                 There's no user space NFS server to control access to so
                 this option isn't relevant. The show_statfs_entries can't
                 be implemented for the same reason.

          debug_mtab_file
                 There's no user space NFS server and autofs avoids using
                 file based mtab whenever possible.

          sun_map_syntax
                 Sun map format is handled by autofs itself.

          plock, show_statfs_entries, preferred_amq_port
                 Are not supported by autofs.

          ldap_cache_maxmem, ldap_cache_seconds
                 External ldap caching is not used by autofs.

          ldap_proto_version
                 autofs always attempts to use the highest available ldap
                 protocol version.

          cache_duration, map_reload_interval, map_options
                 The map   entry cache is continually updated and stale
                 entries cleaned on re-load, which is done when map changes
                 are detected so these configuration entries are not used
                 by autofs. An exception to this is the case where the map
                 is large. In this case it may be necessary to read the
                 whole map at startup even if browsing is not enabled.
                 Adding the cache:=all option to map_options can be used to
                 for this.

          localhost_address
                 This is not used within autofs. This configuration option
                 was only used in the amd user space server code and is not
                 relevant within autofs.

          Options that are handled differently within autofs:

          pid_file
                 To specify a pid file name a command line option must be
                 used on startup.

          print_version
                 Program version and feature information is obtained by
                 using the automount command line option "-V".

          debug_options ,  log_options
                 autofs has somewhat more limited logging and debug logging
                 options.  When the log_options options is encountered it
                 is converted to the nearest matching autofs logging
                 option. Since the configuration option debug_options would
                 be handled the same way it is ignored.

          restart_mounts
                 This option has no sensible meaning within autofs because
                 autofs always tries to re-connect to existing mounts.
                 While this has its own set of problems not re-connecting
                 to existing mounts always results in a non-functional
                 automount tree if mounts were busy at the last shutdown
                 (as is also the case with amd when using mount_type
                 autofs).

          forced_unmounts
                 Detaching mounts often causes serious problems for users
                 of existing mounts. It is used by autofs in some cases,
                 either at the explicit request of the user (with a command
                 line or init option) and in some special cases during
                 program operation but is avoided whenever possible.

          A number of configuration options are not yet implemented:

          search_path
                 Always a little frustrating, the compiled in map location
                 should be used to locate maps but isn't in some cases.
                 This requires work within autofs itself and that will
                 (obviously) include implementing this configuration option
                 for the amd map parser as well.

          fully_qualified_hosts
                 Not yet implemented.

          unmount_on_exit
                 Since autofs always tries to re-connect to mounts left
                 mounted from a previous shutdown this is a sensible option
                 to implement and that will be done.

          browsable_dirs
                 Allow map keys to be shown in directory listings. This
                 option can have values of "yes" or "no". The default is
                 "no". A variation of this option, "browsable", can be used
                 as a pseudo mount option in type "auto" map entries to
                 provide browsing functionality in sub-mounts. The amd
                 "browsable_dirs = full" option cannot be implemented
                 within the current autofs framework and is not supported.

          exec_map_timeout
                 A timeout is not currently used for program maps but this
                 might be implemented in the future.

          tag
                 The tag option is not implemented within autofs.

          Supported options:

          arch, karch, os, osver
                 These options default to what is returned from uname(2)
                 and can be overridden if required.

          full_os
                 This option has no default and must be set in the
                 configuration if used in maps.

          cluster
                 If not set defaults to the host domain name. This option
                 corresponds to the HP_UX cluster name (according to the
                 amd source) and is probably not used in Linux but is set
                 anyway.

          vendor This option has a default value of "unknown", it must be
                 set in the configuration if used in maps.

          auto_dir
                 Is the base name of the mount tree used for external
                 mounts that are sometimes needed by amd maps. Its default
                 value is "/a".

          map_type
                 Specifies the autofs map source, such as file, nis, ldap
                 etc. and has no default value set.

          map_defaults
                 This option is used to override /defaults entries within
                 maps and can be used to provide different defaults on
                 specific machines without having to modify centrally
                 managed maps. It is empty by default.

          search_path
                 Colon separated paths to search for maps that are not
                 specified as a full path.

          dismount_interval
                 Is equivalent to the autofs timeout option. It is only
                 possible to use this with type "auto" mounts due to the
                 way the autofs kernel module performs expiry. It takes its
                 default value from the autofs internal default of 600
                 seconds.

          autofs_use_lofs
                 If set to "yes" autofs will attempt to use bind mounts for
                 type "link" entries when possible (default is "yes").

          nis_domain
                 Allows setting of a domain name other than the system
                 default.

          local_domain
                 Is used to override (or set) the host domain name.

          normalize_hostnames
                 If set to "yes" then the contents of ${rhost} is
                 translated in its official host name.

          domain_strip
                 If set to "yes" the domain name part of the host is
                 stripped when normalizing hostnames. This can be useful
                 when using of the same maps in a multiple domain
                 environment.

          normalize_slashes
                 This option is set to "yes" by default and will collapse
                 multiple unescaped occurrences of "/" to a single "/".

          selectors_in_defaults, selectors_on_default
                 This option has a default value of "no". If set to "yes"
                 then any defaults entry will be checked for selectors to
                 determine the values to be used. selectors_in_defaults is
                 the preferred option to use.

          ldap_base
                 iThis option has no default value. It must be set to the
                 base dn that is used for queries if ldap is to be used as
                 a map source.

          ldap_hostports
                 This option has no default value set. It must be set to
                 the URI of the LDAP server to be used for lookups when
                 ldap is used as a map source. It may contain a comma or
                 space separated list of LDAP URIs.

          hesiod_base
                 Sets the base name used for hesiod map sources.

          linux_ufs_mount_type
                 This is an additional configuration option for the autofs
                 amd format parser implementation.

                 There's no simple way to determine what the system default
                 filesystem is and am-utils needs to be continually updated
                 to do this and can easily get it wrong ayway. So allow it
                 to be set in the configuration.


-------------------------------------------------------

::

            [ autofs ]
            timeout = 300
            browse_mode = no

            [ amd ]
            dismount_interval = 300
            map_type = nis
            autofs_use_lofs = no

            [ /expamle/mount ]
            dismount_interval = 60
            map_type = file


---------------------------------------------------------

::

          automount(8), auto.master(5), autofs_ldap_auth.conf(5).


-----------------------------------------------------

::

          This manual page was written by Ian Kent <raven@themaw.net>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the autofs (automount) project.  Information
          about the project can be found at ⟨http://www.autofs.org/⟩.  If
          you have a bug report for this manual page, send it to
          autofs@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-07-07.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  23 Jan 2014                AUTOFS.CONF(5)

--------------

Pages that refer to this page: `autofs(5) <../man5/autofs.5.html>`__, 
`autofs_ldap_auth.conf(5) <../man5/autofs_ldap_auth.conf.5.html>`__, 
`auto.master(5) <../man5/auto.master.5.html>`__, 
`autofs(8) <../man8/autofs.8.html>`__, 
`automount(8) <../man8/automount.8.html>`__

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
