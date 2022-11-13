.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

`Go to the version of this page provided by the dnf
project <yum.conf.5.html>`__

--------------

yum.conf(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `[main]                           |                                   |
|  OPTIONS <#%5Bmain%5D_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `[repository] OPTIO               |                                   |
| NS <#%5Brepository%5D_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `URL INCLUD                       |                                   |
| E SYNTAX <#URL_INCLUDE_SYNTAX>`__ |                                   |
| \|                                |                                   |
| `GLOB: FOR LIST OPT               |                                   |
| IONS <#GLOB:_FOR_LIST_OPTIONS>`__ |                                   |
| \| `VARIABLES <#VARIABLES>`__ \|  |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   yum.conf(5)              yum configuration file              yum.conf(5)

NAME
-------------------------------------------------

::

          yum.conf - Configuration file for yum(8).


---------------------------------------------------------------

::

          Yum uses a configuration file at /etc/yum/yum.conf.

          Additional configuration files are also read from the directories
          set by the reposdir option (default is `/etc/yum/repos.d').  See
          the reposdir option below for further details.


-------------------------------------------------------------

::

          There are two types of sections in the yum configuration file(s):
          main and repository. Main defines all global configuration
          options. There should be only one main section. The repository
          section(s) define the configuration for each repository/server.
          There should be one or more repository sections.


-------------------------------------------------------------------------

::

          The [main] section must exist for yum to do anything. It consists
          of the following options:

                 cachedir Directory where yum should store its cache and db
                 files. The default is `/var/cache/yum'.

                 cashe_root_dir Directory where yum would initialize the
                 cashe, should almost certainly be left at the default. The
                 default is`/var/cache/CAShe'. Note that unlike all other
                 configuration, this does not change with installroot, the
                 reason is so that multiple install root can share the same
                 data. See man cashe for more info.

                 persistdir Directory where yum should store information
                 that should persist over multiple runs. The default is
                 `/var/lib/yum'.

                 keepcache Either `1' or `0'. Determines whether or not yum
                 keeps the cache of headers and packages after successful
                 installation.  Default is '1' (keep files)

                 usercache Either `1' or `0'. Determines whether or not yum
                 should store per-user cache in $TMPDIR.  When set to `0',
                 then whenever yum runs as a non-root user, --cacheonly is
                 implied and system cache is used directly, and no new user
                 cache is created in $TMPDIR.  This can be used to prevent
                 $TMPDIR from filling up if many users on the system often
                 use yum and root tends to have up-to-date metadata that
                 the users can rely on (they can still enable this feature
                 with --setopt if they wish).  Default is `1' (user cache
                 enabled).

                 reposdir A list of directories where yum should look for
                 .repo files which define repositories to use. Default is
                 `/etc/yum/repos.d'. Each file in this directory should
                 contain one or more repository sections as documented in
                 [repository] options below. These will be merged with the
                 repositories defined in /etc/yum/yum.conf to form the
                 complete set of repositories that yum will use.

                 debuglevel Debug message output level. Practical range is
                 0-10. Default is `2'.

                 errorlevel Error message output level. Practical range is
                 0-10. Default is `2'.

                 rpmverbosity Debug scriptlet output level. 'info' is the
                 default, other options are: 'critical', 'emergency',
                 'error', 'warn' and 'debug'.

                 protected_packages This is a list of packages that yum
                 should never completely remove. They are protected via
                 Obsoletes as well as user/plugin removals.

                 The default is: yum glob:/etc/yum/protected.d/*.conf So
                 any packages which should be protected can do so by
                 including a file in /etc/yum/protected.d with their
                 package name in it.

                 Also if this configuration is set to anything, then yum
                 will protect the package corresponding to the running
                 version of the kernel.

                 protected_multilib Either `1' or `0'. This tells yum
                 whether or not it should perform a check to make sure that
                 multilib packages are the same version. For example, if
                 this option is off (rpm behavior) then in some cases it
                 might be possible for pkgA-1.x86_64 and pkgA-2.i386 to be
                 installed at the same time. However this is very rarely
                 desired. Install only packages, like the kernel, are
                 exempt from this check.  The default is `1'.

                 logfile Full directory and file name for where yum should
                 write its log file.

                 gpgcheck Either `1' or `0'. This tells yum whether or not
                 it should perform a GPG signature check on packages. When
                 this is set in the [main] section it sets the default for
                 all repositories.  The default is `0'.

                 localpkg_gpgcheck Either `1' or `0'. This tells yum
                 whether or not it should perform a GPG signature check on
                 local packages (packages in a file, not in a repositoy).
                 The default is `0'.

                 repo_gpgcheck Either `1' or `0'. This tells yum whether or
                 not it should perform a GPG signature check on the
                 repodata. When this is set in the [main] section it sets
                 the default for all repositories. The default is `0'.

                 skip_broken Either `1' or `0'. Resolve depsolve problems
                 by removing packages that are causing problems from the
                 transaction.

                 assumeyes Either `1' or `0'. Determines whether or not yum
                 prompts for confirmation of critical actions. Default is
                 `0' (do prompt).
                 Command-line option: -y --assumeyes

                 assumeno Either `1' or `0'. If yum would prompt for
                 confirmation of critical actions, assume the user chose
                 no. This is basically the same as doing "echo | yum ..."
                 but is a bit more usable. This option overrides assumeyes,
                 but is still subject to alwaysprompt.  Default is `0' (do
                 prompt).
                 Command-line option: --assumeno

                 alwaysprompt Either `1' or `0'. When set to `0', yum will
                 not prompt for confirmation when the list of packages to
                 be installed exactly matches those given on the command
                 line. Unless assumeyes is enabled, it will prompt when
                 additional packages need to be installed to fulfill
                 dependencies regardless of this setting. Note that older
                 versions of yum would also always prompt for package
                 removal, and that is no longer true.  Default is `1'.

                 tolerant Either `1' or `0'. If enabled, yum will go
                 slower, checking for things that shouldn't be possible
                 making it more tolerant of external errors.  Default to
                 `0' (not tolerant).
                 Command-line option: -t

                 exclude List of packages to exclude from all repositories,
                 so yum works as if that package was never in the
                 repositories. This should be a space separated list.  This
                 is commonly used so a package isn't upgraded or installed
                 accidentally, but can be used to remove packages in any
                 way that "yum list" will show packages.  Shell globs using
                 wildcards (eg. * and ?) are allowed.

                 Can be disabled using disable_excludes or
                 --disableexcludes.  Command-line option: -x

                 disable_excludes A way to permanently set the
                 --disableexcludes command line option.

                 query_install_excludes This applies the command line
                 exclude option (only, not the configuration exclude above)
                 to installed packages being shown in some query commands
                 (currently: list/info/search/provides). Default is '0'.

                 installonlypkgs List of package provides that should only
                 ever be installed, never updated.  Kernels in particular
                 fall into this category. Defaults to kernel, kernel-
                 bigmem, kernel-enterprise, kernel-smp, kernel-modules,
                 kernel-debug, kernel-unsupported, kernel-source, kernel-
                 devel, kernel-PAE, kernel-PAE-debug.

                 Note that because these are provides, and not just package
                 names, kernel-devel will also apply to kernel-debug-devel,
                 etc.

                 installonly_limit Number of packages listed in
                 installonlypkgs to keep installed at the same time.
                 Setting to 0 disables this feature. Default is '0'. Note
                 that this functionality used to be in the "installonlyn"
                 plugin, where this option was altered via tokeep.  Note
                 that as of version 3.2.24, yum will now look in the yumdb
                 for a installonly attribute on installed packages. If that
                 attribute is "keep", then they will never be removed.

                 kernelpkgnames List of package names that are kernels.
                 This is really only here for the updating of kernel
                 packages and should be removed out in the yum 2.1 series.

                 exactarchlist List of packages that should never change
                 archs in an update.  That means, if a package has a newer
                 version available which is for a different compatible
                 arch, yum will not consider that version an update if the
                 package name is in this list.  For example, on x86_64,
                 foo-1.x86_64 won't be updated to foo-2.i686 if foo is in
                 this list.  Kernels in particular fall into this category.
                 Shell globs using wildcards (eg. * and ?) are allowed.
                 Defaults to kernel, kernel-smp, kernel-hugemem, kernel-
                 enterprise, kernel-bigmem, kernel-devel, kernel-PAE,
                 kernel-PAE-debug.

                 showdupesfromrepos Either `0' or `1'. Set to `1' if you
                 wish to show any duplicate packages from any repository,
                 from package listings like the info or list commands. Set
                 to `0' if you want only to see the newest packages from
                 any repository.  Default is `0'.

                 obsoletes This option only has affect during an update. It
                 enables yum's obsoletes processing logic. Useful when
                 doing distribution level upgrades. See also the yum
                 upgrade command documentation for more details (yum(8)).
                 Default is `true'.
                 Command-line option: --obsoletes

                 remove_leaf_only Either `0' or `1'. Used to determine
                 yum's behaviour when a package is removed.  If
                 remove_leaf_only is `0' (default) then packages, and their
                 deps, will be removed.  If remove_leaf_only is `1' then
                 only those packages that aren't required by another
                 package will be removed.

                 repopkgsremove_leaf_only Either `0' or `1'. Used to
                 determine yum's behaviour when the repo-pkg remove command
                 is run.  If repopkgremove_leaf_only is `0' (default) then
                 all packages in the repo. will be removed.  If
                 repopkgremove_leaf_only is `1' then only those packages in
                 the repo. that aren't required by another package will be
                 removed.  Note that this option does not override
                 remove_leaf_only, so enabling that option means this has
                 almost no affect.

                 overwrite_groups Either `0' or `1'. Used to determine
                 yum's behaviour if two or more repositories offer the
                 package groups with the same name. If overwrite_groups is
                 `1' then the group packages of the last matching
                 repository will be used. If overwrite_groups is `0' then
                 the groups from all matching repositories will be merged
                 together as one large group.  Note that this option does
                 not override remove_leaf_only, so enabling that option
                 means this has almost no affect.

                 groupremove_leaf_only Either `0' or `1'. Used to determine
                 yum's behaviour when the groupremove command is run.  If
                 groupremove_leaf_only is `0' (default) then all packages
                 in the group will be removed.  If groupremove_leaf_only is
                 `1' then only those packages in the group that aren't
                 required by another package will be removed.

                 enable_group_conditionals Either `0' or `1'. Determines
                 whether yum will allow the use of conditionals packages.
                 Default is `1' (package conditionals are allowed).

                 group_package_types List of the following: optional,
                 default, mandatory. Tells yum which type of packages in
                 groups will be installed when 'groupinstall' is called.
                 Default is: default, mandatory

                 group_command List of the following: simple, compat,
                 objects. Tells yum what to do for group
                 install/upgrade/remove commands.

                 Simple acts like you did yum group cmd $(repoquery --group
                 --list group), so it is very easy to reason about what
                 will happen. Alas. this is often not what people want to
                 happen.

                 Compat. works much like simple, except that when you run
                 "group upgrade" it actually runs "group install" (this
                 means that you get any new packages added to the group,
                 but you also get packages added that were there before and
                 you didn't want).

                 Objects makes groups act like a real object, separate from
                 the packages they contain. Yum keeps track of the groups
                 you have installed, so "group upgrade" will install new
                 packages for the group but not install old ones. It also
                 knows about group members that are installed but weren't
                 installed as part of the group, and won't remove those on
                 "group remove".  Running "yum upgrade" will also run "yum
                 group upgrade" (thus. adding new packages for all groups).

                 Default is: compat

                 upgrade_group_objects_upgrade Either `0' or `1'. Set this
                 to `0' to disable the automatic running of "group upgrade"
                 when running the "upgrade" command, and group_command is
                 set to "objects". Default is `1' (perform the operation).

                 autocheck_running_kernel Either `0' or `1'. Set this to
                 `0' to disable the automatic checking of the running
                 kernel against updateinfo ("yum updateinfo check-running-
                 kernel"), in the "check-update" and "updateinfo summary"
                 commands.  Default is `1' (perform the check).

                 installroot Specifies an alternative installroot, relative
                 to which all packages will be installed.
                 Command-line option: --installroot

                 config_file_path Specifies the path to main the
                 configuration file.  Default is /etc/yum/yum.conf.

                 check_config_file_age Either `0' or `1'. Specifies whether
                 yum should auto metadata expire repos.  that are older
                 than any of the configuration files that led to them
                 (usually the yum.conf file and the foo.repo file).
                 Default is `1' (perform the check).

                 distroverpkg The package used by yum to determine the
                 "version" of the distribution, this sets $releasever for
                 use in config. files. This can be any installed package.
                 Default is `system-release(releasever)', `redhat-release'.
                 Yum will now look at the version provided by the provide,
                 and if that is non-empty then will use the full V(-R),
                 otherwise it uses the version of the package.
                  You can see what provides this manually by using: "yum
                 whatprovides 'system-release(releasever)' redhat-release"
                 and you can see what $releasever is most easily by using:
                 "yum version".

                 diskspacecheck Either `0' or `1'. Set this to `0' to
                 disable the checking for sufficient diskspace and inodes
                 before a RPM transaction is run. Default is `1' (perform
                 the check).

                 tsflags Comma or space separated list of transaction flags
                 to pass to the rpm transaction set. These include
                 'noscripts', 'notriggers', 'nodocs', 'test', 'justdb' and
                 'nocontexts'. 'repackage' is also available but that does
                 nothing with newer rpm versions.  You can set all/any of
                 them. However, if you don't know what these do in the
                 context of an rpm transaction set you're best leaving it
                 alone. Default is an empty list.  Also see the "yum fs"
                 command, for excluding docs.

                 override_install_langs This is a way to override rpm's
                 _install_langs macro. without having to change it within
                 rpm's macro file.  Default is nothing (so does nothing).
                 Also see the "yum fs" command.

                 recent Number of days back to look for `recent' packages
                 added to a repository.  Used by the list recent command.
                 Default is `7'.

                 retries Set the number of times any attempt to retrieve a
                 file should retry before returning an error. Setting this
                 to `0' makes yum try forever. Default is `10'.

                 keepalive Either `0' or `1'. Set whether HTTP keepalive
                 should be used for HTTP/1.1 servers that support it. This
                 can improve transfer speeds by using one connection when
                 downloading multiple files from a repository. Default is
                 `1'.

                 timeout Number of seconds to wait for a connection before
                 timing out. Defaults to 30 seconds. This may be too short
                 of a time for extremely overloaded sites.

                 http_caching Determines how upstream HTTP caches are
                 instructed to handle any HTTP downloads that Yum does.
                 This option can take the following values:

                 `all' means that all HTTP downloads should be cached.

                 `packages' means that only RPM package downloads should be
                 cached (but not repository metadata downloads).

                 `lazy:packages' means that act like `packages' unless
                 package verification fails (e.g. the package download
                 doesn't match the expected checksum), in which case try
                 re-downloading the package as if `none' was set.  This
                 value is a good compromise if you want to avoid issues
                 caused by stale proxy cache after remote RPMs change
                 contents without changing filenames (e.g. are pushed
                 unsigned and later signed) but still want the benefits of
                 package caching whenever possible.

                 `none' means that no HTTP downloads should be cached.

                 The default is `all'. This is recommended unless you are
                 experiencing caching related issues. Try to at least use
                 `packages' to minimize load on repository servers.

                 throttle Enable bandwidth throttling for downloads. This
                 option can be expressed as a absolute data rate in
                 bytes/sec. An SI prefix (k, M or G) may be appended to the
                 bandwidth value (eg. `5.5k' is 5.5 kilobytes/sec, `2M' is
                 2 Megabytes/sec).

                 Alternatively, this option can specify the percentage of
                 total bandwidth to use (eg. `60%'). In this case the
                 bandwidth option should be used to specify the maximum
                 available bandwidth.

                 Set to `0' to disable bandwidth throttling. This is the
                 default.

                 Note that when multiple downloads run simultaneously the
                 total bandwidth might exceed the throttle limit. You may
                 want to also set max_connections=1 or scale your throttle
                 option down accordingly.

                 minrate This sets the low speed threshold in bytes per
                 second. If the server is sending data slower than this for
                 at least `timeout' seconds, Yum aborts the connection. The
                 default is `1000'.

                 bandwidth Use to specify the maximum available network
                 bandwidth in bytes/second.  Used with the throttle option
                 (above). If throttle is a percentage and bandwidth is `0'
                 then bandwidth throttling will be disabled. If throttle is
                 expressed as a data rate (bytes/sec) then this option is
                 ignored. Default is `0' (no bandwidth throttling).

                 ip_resolve Determines how yum resolves host names.

                 `4' or `IPv4': resolve to IPv4 addresses only.

                 `6' or `IPv6': resolve to IPv6 addresses only.

                 max_connections

                 The maximum number of simultaneous connections.  This
                 overrides the urlgrabber default of 5 connections.  Note
                 that there are also implicit per-mirror limits and the
                 downloader honors these too.

                 ftp_disable_epsv This options disables Extended Passive
                 Mode (the EPSV command) which does not work correctly on
                 some buggy ftp servers. Default is `0' (EPSV enabled).

                 deltarpm

                 When non-zero, delta-RPM files are used if available.  The
                 value specifies the maximum number of "applydeltarpm"
                 processes Yum will spawn, if the value is negative then
                 yum works out how many cores you have and multiplies that
                 by the value (cores=2, deltarpm=-2; 4 processes). (2 by
                 default).

                 Note that the "applydeltarpm" process uses a significant
                 amount of disk IO, so running too many instances can
                 significantly slow down all disk IO including the
                 downloads that yum is doing (thus. a too high value can
                 make everything slower).

                 deltarpm_percentage When the relative size of delta vs pkg
                 is larger than this, delta is not used.  Default value is
                 75 (Deltas must be at least 25% smaller than the pkg).
                 Use `0' to turn off delta rpm processing. Local
                 repositories (with file:// baseurl) have delta rpms turned
                 off by default.

                 deltarpm_metadata_percentage When the relative size of
                 deltarpm metadata vs pkgs is larger than this, deltarpm
                 metadata is not downloaded from the repo.  Default value
                 is 100 (Deltarpm metadata must be smaller than the
                 packages from the repo). Note that you can give values
                 over 100, so 200 means that the metadata is required to be
                 half the size of the packages.  Use `0' to turn off this
                 check, and always download metadata.

                 sslcacert Path to the directory containing the databases
                 of the certificate authorities yum should use to verify
                 SSL certificates. Defaults to none - uses system default

                 sslverify Boolean - should yum verify SSL
                 certificates/hosts at all. Defaults to True.

                 Note that the plugin yum-rhn-plugin will force this value
                 to true, and may alter other ssl settings (like hostname
                 checking), even if it the machine is not registered.

                 sslclientcert Path to the SSL client certificate yum
                 should use to connect to repos/remote sites Defaults to
                 none.

                 Note that if you are using curl compiled against NSS
                 (default in Fedora/RHEL), curl treats sslclientcert values
                 with the same basename as _identical_. This version of yum
                 will check that this isn't true and output an error when
                 the repositories "foo" and "bar" violate this, like so:

                 sslclientcert basename shared between foo and bar

                 sslclientkey Path to the SSL client key yum should use to
                 connect to repos/remote sites Defaults to none.

                 ssl_check_cert_permissions Boolean - Whether yum should
                 check the permissions on the paths for the certificates on
                 the repository (both remote and local). If we can't read
                 any of the files then yum will force skip_if_unavailable
                 to be true.  This is most useful for non-root processes
                 which use yum on repos. that have client cert files which
                 are readable only by root.  Defaults to True.

                 history_record Boolean - should yum record history entries
                 for transactions. This takes some disk space, and some
                 extra time in the transactions. But it allows how to know
                 a lot of information about what has happened before, and
                 display it to the user with the history info/list/summary
                 commands. yum also provides the history undo/redo
                 commands. Defaults to True.

                 Note that if history is recorded, yum uses that
                 information to see if any modifications to the rpmdb have
                 been done outside of yum. These are always bad, from yum's
                 point of view, and so yum will issue a warning and
                 automatically run some of "yum check" to try and find some
                 of the worst problems altering the rpmdb might have
                 caused.

                 This means that turning this option off will stop yum from
                 being able to detect when the rpmdb has changed and thus.
                 it will never warn you or automatically run "yum check".
                 The problems will likely still be there, and yumdb etc.
                 will still be wrong but yum will not warn you about it.

                 history_record_packages This is a list of package names
                 that should be recorded as having helped the transaction.
                 yum plugins have an API to add themselves to this, so it
                 should not normally be necessary to add packages here. Not
                 that this is also used for the packages to look for in
                 --version. Defaults to rpm, yum, yum-metadata-parser.

                 history_list_view Which column of information to display
                 in the "yum history list" command. There are currently
                 three options: users, cmds (or commands), auto.

                 Older versions of yum acted like "users", which always
                 outputs the user who initiated the yum transaction. You
                 can now specify "commands" which will instead always
                 output the command line of the transaction. You can also
                 specify "single-user-commands" which will display the
                 users if there are more than one, otherwise it will
                 display the command line.

                 You can also specify "default" which currently selects
                 "single-user-commands".

                 commands List of functional commands to run if no
                 functional commands are specified on the command line (eg.
                 "update foo bar baz quux").  None of the short options
                 (eg. -y, -e, -d) are accepted for this option.

                 syslog_ident Identification (program name) for syslog
                 messages.

                 syslog_facility Facility name for syslog messages, see
                 syslog(3).  Default is `LOG_USER'.

                 syslog_device Where to log syslog messages. Can be a local
                 device (path) or a host:port string to use a remote
                 syslog.  If empty or points to a nonexistent device,
                 syslog logging is disabled.  Default is `/dev/log'.

                 proxy URL to the proxy server that yum should use.  Set
                 this to `libproxy' to enable proxy auto configuration via
                 libproxy.  Defaults to direct connection.

                 proxy_username username to use for proxy

                 proxy_password password for this proxy

                 username username to use for basic authentication to a
                 repo or really any url.

                 password password to use with the username for basic
                 authentication.

                 plugins Either `0' or `1'. Global switch to enable or
                 disable yum plugins. Default is `0' (plugins disabled).
                 See the PLUGINS section of the yum(8) man for more
                 information on installing yum plugins.

                 pluginpath A list of directories where yum should look for
                 plugin modules. Default is `/usr/share/yum-plugins' and
                 `/usr/lib/yum-plugins'.

                 pluginconfpath A list of directories where yum should look
                 for plugin configuration files.  Default is
                 `/etc/yum/pluginconf.d'.

                 metadata_expire Time (in seconds) after which the metadata
                 will expire. So that if the current metadata downloaded is
                 less than this many seconds old then yum will not update
                 the metadata against the repository.  If you find that yum
                 is not downloading information on updates as often as you
                 would like lower the value of this option. You can also
                 change from the default of using seconds to using days,
                 hours or minutes by appending a d, h or m respectively.
                 The default is 6 hours, to compliment yum-updatesd running
                 once an hour.  It's also possible to use the word "never",
                 meaning that the metadata will never expire. Note that
                 when using a metalink file the metalink must always be
                 newer than the metadata for the repository, due to the
                 validation, so this timeout also applies to the metalink
                 file.  Also note that "never" does not override "yum clean
                 expire-cache"

                 metadata_expire_filter Filter the metadata_expire time,
                 allowing a trade of speed for accuracy if a command
                 doesn't require it. Each yum command can specify that it
                 requires a certain level of timeliness quality from the
                 remote repos. from "I'm about to install/upgrade, so this
                 better be current" to "Anything that's available is good
                 enough".

                 `never' - Nothing is filtered, always obey
                 metadata_expire.

                 `read-only:past' - Commands that only care about past
                 information are filtered from metadata expiring.  Eg. yum
                 history info (if history needs to lookup anything about a
                 previous transaction, then by definition the remote
                 package was available in the past).

                 `read-only:present' - Commands that are balanced between
                 past and future.  This is the default.  Eg. yum list yum

                 `read-only:future' - Commands that are likely to result in
                 running other commands which will require the latest
                 metadata. Eg. yum check-update

                 Note that this option requires that all the enabled
                 repositories be roughly the same freshness (meaning the
                 cache age difference from one another is at most 5 days).
                 Failing that, metadata_expire will always be obeyed, just
                 like with `never'.

                 Also note that this option does not override "yum clean
                 expire-cache".

                 mirrorlist_expire Time (in seconds) after which the
                 mirrorlist locally cached will expire.  If the current
                 mirrorlist is less than this many seconds old then yum
                 will not download another copy of the mirrorlist, it has
                 the same extra format as metadata_expire.  If you find
                 that yum is not downloading the mirrorlists as often as
                 you would like lower the value of this option.

                 mdpolicy You can select from different metadata download
                 policies depending on how much data you want to download
                 with the main repository metadata index. The advantages of
                 downloading more metadata with the index is that you can't
                 get into situations where you need to use that metadata
                 later and the versions available aren't compatible (or the
                 user lacks privileges) and that if the metadata is corrupt
                 in any way yum will revert to the previous metadata.

                 `instant' - Just download the new metadata index, this is
                 roughly what yum always did, however it now does some
                 checking on the index and reverts if it classifies it as
                 bad.

                 `group:primary' - Download the primary metadata with the
                 index. This contains most of the package information and
                 so is almost always required anyway.

                 `group:small' - With the primary also download the
                 updateinfo metadata, groups, and pkgtags. This is required
                 for yum-security operations and it also used in the
                 graphical clients. This file also tends to be
                 significantly smaller than most others. This is the
                 default.

                 `group:main' - With the primary and updateinfo download
                 the filelists metadata and the group metadata. The
                 filelists data is required for operations like "yum
                 install /bin/bash", and also some dependency resolutions
                 require it. The group data is used in some graphical
                 clients and for group operations like "yum grouplist
                 Base".

                 `group:all' - Download all metadata listed in the index,
                 currently the only one not listed above is the other
                 metadata, which contains the changelog information which
                 is used by yum-changelog. This is what "yum makecache"
                 uses.

                 mddownloadpolicy You can select which kinds of repodata
                 you would prefer yum to download:

                 `sqlite' - Download the .sqlite files, if available. This
                 is currently slightly faster, once they are downloaded.
                 However these files tend to be bigger, and thus. take
                 longer to download.

                 `xml' - Download the .XML files, which yum will do anyway
                 as a fallback on the other options. These files tend to be
                 smaller, but they require parsing/converting locally after
                 download and some aditional checks are performed on them
                 each time they are used.

                 multilib_policy Can be set to 'all' or 'best'. All means
                 install all possible arches for any package you want to
                 install. Therefore yum install foo will install foo.i386
                 and foo.x86_64 on x86_64, if it is available. Best means
                 install the best arch for this platform, only.

                 requires_policy Can be set to 'strong', 'weak' or info'.
                 Strong means install just the needed requirements. Weak
                 means also install any weak requirements. Info means
                 install all requirements. This only happens on
                 install/reinstall, upgrades/downgrades do not consult this
                 at all.  Note that yum will try to just drop weak and info
                 requirements on errors.

                 bugtracker_url URL where bugs should be filed for yum.
                 Configurable for local versions or distro-specific
                 bugtrackers.

                 color Whether to display colorized output automatically,
                 depending on the output terminal, can be changed to always
                 (using ANSI codes) or never.  Default is `auto'.  Possible
                 values are: auto, never, always.  Command-line option:
                 --color

                 color_list_installed_older The colorization/highlighting
                 for packages in list/info installed which are older than
                 the latest available package with the same name and arch.
                 Default is `bold'.  Possible values are a comma separated
                 list containing: bold, blink, dim, reverse, underline,
                 fg:black, fg:red, fg:green, fg:yellow, fg:blue,
                 fg:magenta, fg:cyan, fg:white, bg:black, bg:red, bg:green,
                 bg:yellow, bg:blue, bg:magenta, bg:cyan, bg:white.

                 color_list_installed_newer The colorization/highlighting
                 for packages in list/info installed which are newer than
                 the latest available package with the same name and arch.
                 Default is `bold,yellow'.  See color_list_installed_older
                 for possible values.

                 color_list_installed_reinstall The
                 colorization/highlighting for packages in list/info
                 installed which is the same version as the latest
                 available package with the same name and arch.  Default is
                 `normal'.  See color_list_installed_older for possible
                 values.

                 color_list_installed_running_kernel The
                 colorization/highlighting for kernel packages in list/info
                 installed which is the same version as the running kernel.
                 Default is `bold,underline.  See
                 color_list_installed_older for possible values.

                 color_list_installed_extra The colorization/highlighting
                 for packages in list/info installed which has no available
                 package with the same name and arch.  Default is
                 `bold,red'.  See color_list_installed_older for possible
                 values.

                 color_list_available_upgrade The colorization/highlighting
                 for packages in list/info available which is an upgrade
                 for the latest installed package with the same name and
                 arch.  Default is `bold,blue'.  See
                 color_list_installed_older for possible values.

                 color_list_available_downgrade The
                 colorization/highlighting for packages in list/info
                 available which is a downgrade for the latest installed
                 package with the same name and arch.  Default is
                 `dim,cyan'.  See color_list_installed_older for possible
                 values.

                 color_list_available_install The colorization/highlighting
                 for packages in list/info available which has no installed
                 package with the same name and arch.  Default is `normal'.
                 See color_list_installed_older for possible values.

                 color_list_available_reinstall The
                 colorization/highlighting for packages in list/info
                 available which is the same version as the installed
                 package with the same name and arch.  Default is
                 `bold,underline,green.  See color_list_installed_older for
                 possible values.

                 color_list_available_running_kernel The
                 colorization/highlighting for kernel packages in list/info
                 available which is the same version as the running kernel.
                 Default is `bold,underline.  See
                 color_list_installed_older for possible values.

                 color_search_match The colorization/highlighting for text
                 matches in search.  Default is `bold'.  See
                 color_list_installed_older for possible values.

                 color_update_installed The colorization/highlighting for
                 packages in the "updates list" which are installed. The
                 updates list is what is printed when you run "yum update",
                 "yum list updates", "yum list obsoletes" and "yum check-
                 update".  Default is `normal'.  See
                 color_list_installed_older for possible values.

                 color_update_local The colorization/highlighting for
                 packages in the "updates list" which are already
                 downloaded. The updates list is what is printed when you
                 run "yum update", "yum list updates", "yum list obsoletes"
                 and "yum check-update".  Default is `bold'.  See
                 color_list_installed_older for possible values.

                 color_update_remote The colorization/highlighting for
                 packages in the "updates list" which need to be
                 downloaded. The updates list is what is printed when you
                 run "yum update", "yum list updates", "yum list obsoletes"
                 and "yum check-update".  Default is `normal'.  See
                 color_list_installed_older for possible values.

                 ui_repoid_vars When a repository id is displayed, append
                 these yum variables to the string if they are used in the
                 baseurl/etc. Variables are appended in the order listed
                 (and found).  Default is 'releasever basearch'.

                 clean_requirements_on_remove When removing packages (by
                 removal, update or obsoletion) go through each package's
                 dependencies. If any of them are no longer required by any
                 other package then also mark them to be removed.  Boolean
                 (1, 0, True, False, yes, no) Defaults to False

                 upgrade_requirements_on_install When
                 installing/reinstalling/upgrading packages go through each
                 package's installed dependencies and check for an update.
                 Boolean (1, 0, True, False, yes,no) Defaults to False

                 recheck_installed_requires When upgrading a package do we
                 recheck any requirements that existed in the old package.
                 Turning this on shouldn't do anything but slow yum
                 depsolving down, however using rpm --nodeps etc. can break
                 the rpmdb and then this will help.  Boolean (1, 0, True,
                 False, yes,no) Defaults to False

                 reset_nice If set to true then yum will try to reset the
                 nice value to zero, before running an rpm transaction.
                 Defaults to True.

                 exit_on_lock Should the yum client exit immediately when
                 something else has the lock.  Boolean (1, 0, True, False,
                 yes, no) Defaults to False

                 loadts_ignoremissing Should the load-ts command ignore
                 packages that are missing. This includes packages in the
                 TS to be removed, which aren't installed, and packages in
                 the TS to be added, which aren't available.  If this is
                 set to true, and an rpm is missing then
                 loadts_ignorenewrpm is automatically set to true.  Boolean
                 (1, 0, True, False, yes, no) Defaults to False

                 loadts_ignorerpm Should the load-ts command ignore the
                 rpmdb version (yum version nogroups) or abort if there is
                 a mismatch between the TS file and the current machine.
                 If this is set to true, then loadts_ignorenewrpm is
                 automatically set to true.  Boolean (1, 0, True, False,
                 yes, no) Defaults to False

                 loadts_ignorenewrpm Should the load-ts command ignore the
                 future rpmdb version or abort if there is a mismatch
                 between the TS file and what will happen on the current
                 machine.  Note that if loadts_ignorerpm is True, this
                 option does nothing.  Boolean (1, 0, True, False, yes, no)
                 Defaults to False

                 autosavets Should yum automatically save a transaction to
                 a file when the transaction is solved but not run.
                 Boolean (1, 0, True, False, yes, no) Defaults to True

                 fssnap_automatic_pre Should yum try to automatically
                 create a snapshot before it runs a transaction.  Boolean
                 (1, 0, True, False, yes, no) Defaults to False

                 fssnap_automatic_post Should yum try to automatically
                 create a snapshot after it runs a transaction.  Boolean
                 (1, 0, True, False, yes, no) Defaults to False

                 fssnap_automatic_keep How many old snapshots should yum
                 keep when trying to automatically create a new snapshot.
                 Setting to 0 disables this feature. Default is '1'.

                 fssnap_percentage The size of new snaphosts, expressed as
                 a percentage of the old origin device.  Any number between
                 1 and 100. Default is '100'.

                 fssnap_devices The origin LVM devices to use for
                 snapshots. Wildcards and negation are allowed, first match
                 (positive or negative) wins.  Default is: !*/swap
                 !*/lv_swap glob:/etc/yum/fssnap.d/*.conf

                 fssnap_abort_on_errors When fssnap_automatic_pre or
                 fssnap_automatic_post is enabled, it's possible to specify
                 which fssnap errors should make the transaction fail. The
                 default is `any'.

                 `broken-setup' - Abort current transaction if snapshot
                 support is unavailable because lvm is missing or broken.

                 `snapshot-failure' - Abort current transaction if creating
                 a snapshot fails (e.g. there is not enough free space to
                 make a snapshot).

                 `any' - Abort current transaction if any of the above
                 occurs.

                 `none' - Never abort a transaction in case of errors.

                 depsolve_loop_limit Set the number of times any attempt to
                 depsolve before we just give up. This shouldn't be needed
                 as yum should always solve or fail, however it has been
                 observed that it can loop forever with very large system
                 upgrades. Setting this to `0' (or "<forever>") makes yum
                 try forever. Default is `100'.

                 usr_w_check Either `0' or `1'. Set this to `0' to disable
                 the checking for writability on /usr in the installroot
                 (when going into the depsolving stage). Default is `1'
                 (perform the check).

                 skip_missing_names_on_install If set to False, 'yum
                 install' will fail if it can't find any of the provided
                 names (package, group, rpm file). Boolean (1, 0, True,
                 False, yes, no). Defaults to True.

                 skip_missing_names_on_update If set to False, 'yum update'
                 will fail if it can't find any of the provided names
                 (package, group, rpm file). It will also fail if the
                 provided name is a package which is available, but not
                 installed. Boolean (1, 0, True, False, yes, no). Defaults
                 to True.

                 shell_exit_status Determines the exit status that should
                 be returned by `yum shell' when it terminates after
                 reading the `exit' command or EOF.  Possible values are:
                 0, ?.  If ? is set, the exit status is that of the last
                 command executed before `exit' (bash-like behavior).
                 Defaults to 0.


-------------------------------------------------------------------------------------

::

          The repository section(s) take the following form:

                 Example: [repositoryid]
                 name=Some name for this repository
                 baseurl=url://path/to/repository/

                 repositoryid Must be a unique name for each repository,
                 one word.

                 name A human readable string describing the repository.

                 baseurl Must be a URL to the directory where the yum
                 repository's `repodata' directory lives. Can be an
                 http://, ftp:// or file:// URL.

                 You can specify multiple URLs in one baseurl statement.
                 The best way to do this is like this:
                 [repositoryid]
                 name=Some name for this repository
                 baseurl=url://server1/path/to/repository/
                         url://server2/path/to/repository/
                         url://server3/path/to/repository/

                 The URLs listed are considered different locations
                 (mirrors) of the same repository.  That means, if one URL
                 fails, another one is tried, and so on.  The order in
                 which the URLs are tried is determined by the
                 failovermethod option.

                 If you list more than one baseurl= statement in a
                 repository you will find yum will ignore the earlier ones
                 and probably act bizarrely. Don't do this, you've been
                 warned.

                 You can use HTTP basic auth by prepending "user:password@"
                 to the server name in the baseurl line.  For example:
                 "baseurl=http://user:passwd@example.com/".

                 metalink Specifies a URL to a metalink file for the
                 repomd.xml, a list of mirrors for the entire repository
                 are generated by converting the mirrors for the repomd.xml
                 file to a baseurl. The metalink file also contains the
                 latest timestamp from the data in the repomd.xml, the
                 length of the repomd.xml and checksum data. This data is
                 checked against any downloaded repomd.xml file and all of
                 the information from the metalink file must match. This
                 can be used instead of or with the baseurl option.
                 Substitution variables, described below, can be used with
                 this option. This option disables the mirrorlist option.
                 As a special hack is the mirrorlist URL contains the word
                 "metalink" then the value of mirrorlist is copied to
                 metalink (if metalink is not set).

                 mirrorlist Specifies a URL to a file containing a list of
                 baseurls. This can be used instead of or with the baseurl
                 option. Substitution variables, described below, can be
                 used with this option.  As a special hack is the
                 mirrorlist URL contains the word "metalink" then the value
                 of mirrorlist is copied to metalink (if metalink is not
                 set).

                 enabled Either `1' or `0'. This tells yum whether or not
                 use this repository.

                 keepcache Overrides the keepcache option from the [main]
                 section for this repository.

                 gpgcheck Either `1' or `0'. This tells yum whether or not
                 it should perform a GPG signature check on the packages
                 gotten from this repository.

                 repo_gpgcheck Either `1' or `0'. This tells yum whether or
                 not it should perform a GPG signature check on the
                 repodata from this repository.

                 gpgkey A URL pointing to the ASCII-armored GPG key file
                 for the repository. This option is used if yum needs a
                 public key to verify a package and the required key hasn't
                 been imported into the RPM database. If this option is
                 set, yum will automatically import the key from the
                 specified URL. You will be prompted before the key is
                 installed unless the assumeyes option is set.

                 Multiple URLs may be specified here in the same manner as
                 the baseurl option (above). If a GPG key is required to
                 install a package from a repository, all keys specified
                 for that repository will be installed.

                 gpgcakey A URL pointing to the ASCII-armored CA key file
                 for the repository. This is a normal gpg public key - but
                 this key will be used to validate detached signatures of
                 all other keys. The idea is you are asked to confirm
                 import for this key. After that any other gpg key needed
                 for package or repository verification, if it has a
                 detached signature which matches this key will be
                 automatically imported without user confirmation.

                 exclude Same as the [main] exclude option but only for
                 this repository.  Substitution variables, described below,
                 are honored here.

                 Can be disabled using --disableexcludes.

                 includepkgs Inverse of exclude, yum will exclude any
                 package in the repo. that doesn't match this list. This
                 works in conjunction with exclude and doesn't override it,
                 so if you exclude=*.i386 and includepkgs=python* then only
                 packages starting with python that do not have an i386
                 arch. will be seen by yum in this repo.

                 Substitution variables, described below, are honored here.

                 Can be disabled using --disableexcludes.

                 enablegroups Either `0' or `1'. Determines whether yum
                 will allow the use of package groups for this repository.
                 Default is `1' (package groups are allowed).

                 failovermethod Either `roundrobin' or `priority'.

                 `roundrobin' randomly selects a URL out of the list of
                 URLs to start with and proceeds through each of them as it
                 encounters a failure contacting the host.

                 `priority' starts from the first baseurl listed and reads
                 through them sequentially.

                 failovermethod defaults to `roundrobin' if not specified.

                 keepalive Either `1' or `0'. This tells yum whether or not
                 HTTP/1.1 keepalive should be used with this repository.
                 See the global option in the [main] section above for more
                 information.

                 timeout Overrides the timeout option from the [main]
                 section for this repository.

                 http_caching Overrides the http_caching option from the
                 [main] section for this repository.

                 retries Overrides the retries option from the [main]
                 section for this repository.

                 throttle Overrides the throttle option from the [main]
                 section for this repository.

                 bandwidth Overrides the bandwidth option from the [main]
                 section for this repository.

                 ip_resolve Overrides the ip_resolve option from the [main]
                 section for this repository.

                 ftp_disable_epsv Overrides the ftp_disable_epsv option
                 from the [main] section for this repository.

                 deltarpm_percentage Overrides the deltarpm_percentage
                 option from the [main] section for this repository.

                 deltarpm_metadata_percentage Overrides the
                 deltarpm_metadata_percentage option from the [main]
                 section for this repository.

                 sslcacert Overrides the sslcacert option from the [main]
                 section for this repository.

                 sslverify Overrides the sslverify option from the [main]
                 section for this repository.

                 sslclientcert Overrides the sslclientcert option from the
                 [main] section for this repository.

                 sslclientkey Overrides the sslclientkey option from the
                 [main] section for this repository.

                 ssl_check_cert_permissions Overrides the
                 ssl_check_cert_permissions option from the [main] section
                 for this repository.

                 metadata_expire Overrides the metadata_expire option from
                 the [main] section for this repository.

                 metadata_expire_filter Overrides the
                 metadata_expire_filter option from the [main] section for
                 this repository.

                 mirrorlist_expire Overrides the mirrorlist_expire option
                 from the [main] section for this repository.

                 proxy URL to the proxy server for this repository. Set to
                 '_none_' to disable the global proxy setting for this
                 repository. If this is unset it inherits it from the
                 global setting

                 proxy_username username to use for proxy.  If this is
                 unset it inherits it from the global setting

                 proxy_password password for this proxy.  If this is unset
                 it inherits it from the global setting

                 username username to use for basic authentication to a
                 repo or really any url.  If this is unset it inherits it
                 from the global setting

                 password password to use with the username for basic
                 authentication.  If this is unset it inherits it from the
                 global setting

                 cost relative cost of accessing this repository. Useful
                 for weighing one repo's packages as greater/less than any
                 other. defaults to 1000

                 skip_if_unavailable If set to True yum will continue
                 running if this repository cannot be contacted for any
                 reason. This should be set carefully as all repos are
                 consulted for any given command. Defaults to False.

                 async If set to True Yum will download packages and
                 metadata from this repo in parallel, if possible.
                 Defaults to True.

                 ui_repoid_vars Overrides the ui_repoid_vars option from
                 the [main] section for this repository.

                 compare_providers_priority During depsolving, when
                 choosing the best provider among several, yum will respect
                 the priority of each provider's repository (note that
                 there are other factors which yum considers, which may
                 overweigh the repository priority). The value is an
                 integer from 1 to 99, 1 being the most preferred
                 repository, and 99 being the least preferred one. By
                 default all repositories have the priority of 80.


-----------------------------------------------------------------------------

::

          The inclusion of external configuration files is supported for
          /etc/yum/yum.conf and the .repo files in the /etc/yum/repos.d
          directory. To include a URL, use a line of the following format:

          include=url://to/some/location

          The configuration file will be inserted at the position of the
          "include=" line.  Included files may contain further include
          lines. Yum will abort with an error if an inclusion loop is
          detected.


-------------------------------------------------------------------------------------

::

          Any of the configurations options which are a list of items can
          be specfied using the glob syntax:
          glob:/etc/path/somewhere.d/*.conf. This will read in all files
          matching that glob and include all lines in each file (excluding
          comments and blank lines) as items in the list.


-----------------------------------------------------------

::

          There are a number of variables you can use to ease maintenance
          of yum's configuration files. They are available in the values of
          several options including name, baseurl and commands.

                 $releasever This will be replaced with the value of the
                 version of the package listed in distroverpkg. This
                 defaults to the version of `redhat-release' package.

                 $arch This will be replaced with the architecture or your
                 system as detected by yum.

                 $basearch This will be replaced with your base
                 architecture in yum. For example, if your $arch is i686
                 your $basearch will be i386.

                 $uuid This will be replaced with a unique but persistent
                 uuid for this machine.  The value that is first generated
                 will be stored in /var/lib/yum/uuid and reused until this
                 file is deleted.

                 $YUM0-$YUM9 These will be replaced with the value of the
                 shell environment variable of the same name. If the shell
                 environment variable does not exist then the configuration
                 file variable will not be replaced.

          When variable names are parsed in a string, all alphanumeric
          characters and underscores immediately following a $ sign are
          interpreted as part of a name.  If a variable is undefined, it
          will not be replaced.  For example, the strings $releasever-foo
          or $releasever/foo will be expanded with the $releasever value
          accordingly, whereas $releaseverfoo or $releasever_foo will not
          be expanded.

          As of 3.2.28, any properly named file in /etc/yum/vars is turned
          into a variable named after the filename (or overrides any of the
          above variables).  Filenames may contain only alphanumeric
          characters and underscores and be in lowercase.

          Note that no warnings/errors are given if the files are
          unreadable, so creating files that only root can read may be
          confusing for users.

          Also note that only the first line will be read and all new line
          characters are removed, as a convenience. However, no other
          checking is performed on the data. This means it is possible to
          have bad character data in any value.


---------------------------------------------------

::

          /etc/yum/yum.conf
          /etc/yum/repos.d/
          /etc/yum/pluginconf.d/
          /etc/yum/protected.d
          /etc/yum/vars


---------------------------------------------------------

::

          yum(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the yum (Yum Package Manager) project.
          Information about the project can be found at 
          ⟨https://github.com/rpm-software-management/yum⟩.  It is not known
          how to report bugs for this man page; if you know, please send a
          mail to man-pages@man7.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/rpm-software-management/yum.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-04-02.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Seth Vidal                                                   yum.conf(5)

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
