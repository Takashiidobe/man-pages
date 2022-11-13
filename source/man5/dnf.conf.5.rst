.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dnf.conf(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DISTRIBUTIO                      |                                   |
| N-SPECIFIC CONFIGURATION <#DISTRI |                                   |
| BUTION-SPECIFIC_CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `[MAIN]                           |                                   |
|  OPTIONS <#%5BMAIN%5D_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `[MAIN] OPTIONS - COLORS          |                                   |
| <#%5BMAIN%5D_OPTIONS_-_COLORS>`__ |                                   |
| \|                                |                                   |
| `REPO OPTIONS <#REPO_OPTIONS>`__  |                                   |
| \|                                |                                   |
| `RE                               |                                   |
| PO VARIABLES <#REPO_VARIABLES>`__ |                                   |
| \|                                |                                   |
| `OPTIONS F                        |                                   |
| OR BOTH [MAIN] AND REPO <#OPTIONS |                                   |
| _FOR_BOTH_%5BMAIN%5D_AND_REPO>`__ |                                   |
| \|                                |                                   |
| `TYPES                            |                                   |
| OF OPTIONS <#TYPES_OF_OPTIONS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DNF.CONF(5)                        DNF                       DNF.CONF(5)

NAME
-------------------------------------------------

::

          dnf.conf - DNF Configuration Reference


---------------------------------------------------------------

::

          DNF by default uses the global configuration file at
          /etc/dnf/dnf.conf and all *.repo files found under
          /etc/yum.repos.d. The latter is typically used for repository
          configuration and takes precedence over global configuration.

          The configuration file has INI format consisting of section
          declaration and name=value options below each on separate line.
          There are two types of sections in the configuration files: main
          and repository. Main section defines all global configuration
          options and should be only one.

          The repository sections define the configuration for each (remote
          or local) repository. The section name of the repository in
          brackets serve as repo ID reference and should be unique across
          configuration files. The allowed characters of repo ID string are
          lower and upper case alphabetic letters, digits, -, _, .  and :.
          The minimal repository configuration file should aside from repo
          ID consists of baseurl, metalink or mirrorlist option definition.


---------------------------------------------------------------------------------------------------------------

::

          Configuration options, namely best and skip_if_unavailable, can
          be set in the DNF configuration file by your distribution to
          override the DNF defaults.


-------------------------------------------------------------------------

::

          allow_vendor_change
                 boolean

                 If disabled dnf will stick to vendor when upgrading or
                 downgrading rpms.  Default is True

                 WARNING:
                    This option is currently not supported for downgrade
                    and distro-sync commands

          arch   string

                 The architecture used for installing packages. By default
                 this is auto-detected. Often used together with ignorearch
                 option.

          assumeno
                 boolean

                 If enabled dnf will assume No where it would normally
                 prompt for confirmation from user input. Default is False.

          assumeyes
                 boolean

                 If enabled dnf will assume Yes where it would normally
                 prompt for confirmation from user input (see also
                 defaultyes). Default is False.

          autocheck_running_kernel
                 boolean

                 Automatic check whether there is installed newer kernel
                 module with security update than currently running kernel.
                 Default is True.

          basearch
                 string

                 The base architecture used for installing packages. By
                 default this is auto-detected.

          best   boolean

                 True instructs the solver to either use a package with the
                 highest available version or fail. On False, do not fail
                 if the latest version cannot be installed and go with the
                 lower version. The default is False.  Note this option in
                 particular can be set in your configuration file by your
                 distribution. Also note that the use of the highest
                 available version is only guaranteed for the packages
                 directly requested and not for their dependencies.

          cachedir
                 string

                 Path to a directory used by various DNF subsystems for
                 storing cache data.  Has a reasonable root-writable
                 default depending on the distribution. DNF needs to be
                 able to create files and directories at this location.

          cacheonly
                 boolean

                 If set to True DNF will run entirely from system cache,
                 will not update the cache and will use it even in case it
                 is expired. Default is False.

          check_config_file_age
                 boolean

                 Specifies whether dnf should automatically expire metadata
                 of repos, which are older than their corresponding
                 configuration file (usually the dnf.conf file and the
                 foo.repo file).  Default is True (perform the check).
                 Expire of metadata is also affected by metadata age.  See
                 also metadata_expire.

          clean_requirements_on_remove
                 boolean

                 Remove dependencies that are no longer used during dnf
                 remove. A package only qualifies for removal via
                 clean_requirements_on_remove if it was installed through
                 DNF but not on explicit user request, i.e. it was pulled
                 in as a dependency. The default is True.  (installonlypkgs
                 are never automatically removed.)

          config_file_path
                 string

                 Path to the default main configuration file. Default is
                 /etc/dnf/dnf.conf.

          debuglevel
                 integer

                 Debug messages output level, in the range 0 to 10. The
                 higher the number the more debug output is put to stdout.
                 Default is 2.

          debug_solver
                 boolean

                 Controls whether the libsolv debug files should be created
                 when solving the transaction. The debug files are created
                 in the ./debugdata directory.  Default is False.

          defaultyes
                 boolean

                 If enabled the default answer to user confirmation prompts
                 will be Yes. Not to be confused with assumeyes which will
                 not prompt at all. Default is False.

          diskspacecheck
                 boolean

                 Controls wheather rpm shoud check available disk space
                 during the transaction.  Default is True.

          errorlevel
                 integer

                 Error messages output level, in the range 0 to 10. The
                 higher the number the more error output is put to stderr.
                 Default is 3. This is deprecated in DNF and overwritten by
                 --verbose commandline option.

          exit_on_lock
                 boolean

                 Should the dnf client exit immediately when something else
                 has the lock. Default is False.

          gpgkey_dns_verification
                 boolean

                 Should the dnf attempt to automatically verify GPG
                 verification keys using the DNS system. This option
                 requires the unbound python module (python3-unbound) to be
                 installed on the client system. This system has two main
                 features. The first one is to check if any of the already
                 installed keys have been revoked. Automatic removal of the
                 key is not yet available, so it is up to the user, to
                 remove revoked keys from the system. The second feature is
                 automatic verification of new keys when a repository is
                 added to the system. In interactive mode, the result is
                 written to the output as a suggestion to the user. In
                 non-interactive mode (i.e. when -y is used), this system
                 will automatically accept keys that are available in the
                 DNS and are correctly signed using DNSSEC. It will also
                 accept keys that do not exist in the DNS system and their
                 NON-existence is cryptographically proven using DNSSEC.
                 This is mainly to preserve backward compatibility.
                 Default is False.

          group_package_types
                 list

                 List of the following: optional, default, mandatory. Tells
                 dnf which type of packages in groups will be installed
                 when ‘groupinstall’ is called. Default is: default,
                 mandatory.

          ignorearch
                 boolean

                 If set to True, RPM will allow attempts to install
                 packages incompatible with the CPU’s architecture.
                 Defaults to False. Often used together with arch option.

          installonlypkgs
                 list

                 List of provide names of packages that should only ever be
                 installed, never upgraded. Kernels in particular fall into
                 this category.  These packages are never removed by dnf
                 autoremove even if they were installed as dependencies
                 (see clean_requirements_on_remove for auto removal
                 details).  This option append the list values to the
                 default installonlypkgs list used by DNF. The number of
                 kept package versions is regulated by installonly_limit.

          installonly_limit
                 integer

                 Number of installonly packages allowed to be installed
                 concurrently. Defaults to 3. The minimal number of
                 installonly packages is 2. Value 0 means unlimited number
                 of installonly packages. Value 1 is explicitely not
                 allowed since it complicates kernel upgrades due to
                 protection of the running kernel from removal.

          installroot
                 string

                 The root of the filesystem for all packaging operations.
                 It requires an absolute path. See also –installroot
                 commandline option.

          install_weak_deps
                 boolean

                 When this option is set to True and a new package is about
                 to be installed, all packages linked by weak dependency
                 relation (Recommends or Supplements flags) with this
                 package will be pulled into the transaction.  Default is
                 True.

          keepcache
                 boolean

                 Keeps downloaded packages in the cache when set to True.
                 Even if it is set to False and packages have not been
                 installed they will still persist until next successful
                 transaction. The default is False.

          logdir string

                 Directory where the log files will be stored. Default is
                 /var/log.

          logfilelevel
                 integer

                 Log file messages output level, in the range 0 to 10. The
                 higher the number the more debug output is put to logs.
                 Default is 9.

                 This option controls dnf.log, dnf.librepo.log and
                 hawkey.log. Although dnf.librepo.log and hawkey.log are
                 affected only by setting the logfilelevel to 10.

          log_compress
                 boolean

                 When set to True, log files are compressed when they are
                 rotated. Default is False.

          log_rotate
                 integer

                 Log files are rotated log_rotate times before being
                 removed. If log_rotate is 0, the rotation is not
                 performed.  Default is 4.

          log_size
                 storage size

                 Log  files are rotated when they grow bigger than log_size
                 bytes. If log_size is 0, the rotation is not performed.
                 The default is 1 MB. Valid units are ‘k’, ‘M’, ‘G’.

                 The size applies for individual log files, not the sum of
                 all log files.  See also log_rotate.

          metadata_timer_sync
                 time in seconds

                 The minimal period between two consecutive makecache timer
                 runs. The command will stop immediately if it’s less than
                 this time period since its last run. Does not affect
                 simple makecache run. Use 0 to completely disable
                 automatic metadata synchronizing. The default corresponds
                 to three hours. The value is rounded to the next commenced
                 hour.

          module_obsoletes
                 boolean

                 This option controls whether dnf should apply modular
                 obsoletes when possible.

          module_platform_id
                 string

                 Set this to $name:$stream to override PLATFORM_ID detected
                 from /etc/os-release.  It is necessary to perform a system
                 upgrade and switch to a new platform.

          module_stream_switch
                 boolean

                 This option controls whether it’s possible to switch
                 enabled streams of a module.

          multilib_policy
                 string

                 Controls how multilib packages are treated during install
                 operations. Can either be "best" (the default) for the
                 depsolver to prefer packages which best match the system’s
                 architecture, or "all" to install all available packages
                 with compatible architectures.

          obsoletes
                 boolean

                 This option only has affect during an install/update. It
                 enables dnf’s obsoletes processing logic, which means it
                 makes dnf check whether any dependencies of given package
                 are no longer required and removes them.  Useful when
                 doing distribution level upgrades.  Default is ‘true’.

                 Command-line option: –obsoletes

          persistdir
                 string

                 Directory where DNF stores its persistent data between
                 runs. Default is "/var/lib/dnf".

          pluginconfpath
                 list

                 List of directories that are searched for plugin
                 configurations to load. All configuration files found in
                 these directories, that are named same as a plugin, are
                 parsed. The default path is /etc/dnf/plugins.

          pluginpath
                 list

                 List of directories that are searched for plugins to load.
                 Plugins found in any of the directories in this
                 configuration option are used. The default contains a
                 Python version-specific path.

          plugins
                 boolean

                 Controls whether the plugins are enabled. Default is True.

          protected_packages
                 list

                 List of packages that DNF should never completely remove.
                 They are protected via Obsoletes as well as user/plugin
                 removals.

                 The default is: dnf, glob:/etc/yum/protected.d/*.conf and
                 glob:/etc/dnf/protected.d/*.conf. So any packages which
                 should be protected can do so by including a file in
                 /etc/dnf/protected.d with their package name in it.

                 DNF will protect also the package corresponding to the
                 running version of the kernel. See also
                 protect_running_kernel option.

          protect_running_kernel
                 boolean

                 Controls whether the package corresponding to the running
                 version of kernel is protected from removal. Default is
                 True.

          releasever
                 string

                 Used for substitution of $releasever in the repository
                 configuration.  See also repo variables.

          reposdir
                 list

                 DNF searches for repository configuration files in the
                 paths specified by reposdir. The behavior of reposdir
                 could differ when it is used along with --installroot
                 option.

          rpmverbosity
                 string

                 RPM debug scriptlet output level. One of: critical,
                 emergency, error, warn, info or debug. Default is info.

          strict boolean

                 If disabled, all unavailable packages or packages with
                 broken dependencies given to DNF command will be skipped
                 without raising the error causing the whole operation to
                 fail. Currently works for install command only. The
                 default is True.

          tsflags
                 list

                 List of strings adding extra flags for the RPM
                 transaction.

                        ┌─────────────┬────────────────────────────┐
                        │tsflag value │ RPM Transaction Flag       │
                        ├─────────────┼────────────────────────────┤
                        │noscripts    │ RPMTRANS_FLAG_NOSCRIPTS    │
                        ├─────────────┼────────────────────────────┤
                        │test         │ RPMTRANS_FLAG_TEST         │
                        ├─────────────┼────────────────────────────┤
                        │notriggers   │ RPMTRANS_FLAG_NOTRIGGERS   │
                        ├─────────────┼────────────────────────────┤
                        │nodocs       │ RPMTRANS_FLAG_NODOCS       │
                        ├─────────────┼────────────────────────────┤
                        │justdb       │ RPMTRANS_FLAG_JUSTDB       │
                        ├─────────────┼────────────────────────────┤
                        │nocontexts   │ RPMTRANS_FLAG_NOCONTEXTS   │
                        ├─────────────┼────────────────────────────┤
                        │nocaps       │ RPMTRANS_FLAG_NOCAPS       │
                        ├─────────────┼────────────────────────────┤
                        │nocrypto     │ RPMTRANS_FLAG_NOFILEDIGEST │
                        └─────────────┴────────────────────────────┘

                 The nocrypto option will also set the _RPMVSF_NOSIGNATURES
                 and _RPMVSF_NODIGESTS VS flags. The test option provides a
                 transaction check without performing the transaction. It
                 includes downloading of packages, gpg keys check
                 (including permanent import of additional keys if
                 necessary), and rpm check to prevent file conflicts.  The
                 nocaps is supported with rpm-4.14 or later. When nocaps is
                 used but rpm doesn’t support it, DNF only reports it as an
                 invalid tsflag.

          upgrade_group_objects_upgrade
                 boolean

                 Set this to False to disable the automatic running of
                 group upgrade when running the upgrade command. Default is
                 True (perform the operation).

          varsdir
                 list

                 List of directories where variables definition files are
                 looked for. Defaults to "/etc/dnf/vars", "/etc/yum/vars".
                 See variable files in Configuration reference.

          zchunk boolean

                 Enables or disables the use of repository metadata
                 compressed using the zchunk format (if available). Default
                 is True.


-------------------------------------------------------------------------------------------

::

          color  string

                 Controls if DNF uses colored output on the command line.
                 Possible values: “auto”, “never”, “always”. Default is
                 “auto”.

          color_list_available_downgrade
                 color

                 Color of available packages that are older than installed
                 packages.  The option is used during list operations.
                 Default is magenta.

          color_list_available_install
                 color

                 Color of packages that are available for installation and
                 none of their versions in installed.  The option is used
                 during list operations. Default is bold,cyan.

          color_list_available_reinstall
                 color

                 Color of available packages that are identical to
                 installed versions and are available for reinstalls.
                 Default is bold,underline,green.  The option is used
                 during list operations.

          color_list_available_upgrade
                 color

                 Color of available packages that are newer than installed
                 packages. Default is bold,blue.  The option is used during
                 list operations.

          color_list_installed_extra
                 color

                 Color of installed packages that do not have any version
                 among available packages.  The option is used during list
                 operations. Default is bold,red.

          color_list_installed_newer
                 color

                 Color of installed packages that are newer than any
                 version among available packages.  The option is used
                 during list operations. Default is bold,yellow.

          color_list_installed_older
                 color

                 Color of installed packages that are older than any
                 version among available packages.  The option is used
                 during list operations. Default is yellow.

          color_list_installed_reinstall
                 color

                 Color of installed packages that are among available
                 packages and can be reinstalled.  The option is used
                 during list operations. Default is cyan.

          color_search_match
                 color

                 Color of patterns matched in search output. Default is
                 bold,magenta.

          color_update_installed
                 color

                 Color of removed packages. Default is red.  This option is
                 used during displaying transactions.

          color_update_local
                 color

                 Color of local packages that are installed from the
                 @commandline repository.  This option is used during
                 displaying transactions. Default is green.

          color_update_remote
                 color

                 Color of packages that are installed/upgraded/downgraded
                 from remote repositories.  This option is used during
                 displaying transactions. Default is bold,green.


-----------------------------------------------------------------

::

          baseurl
                 list

                 List of URLs for the repository. Defaults to [].

                 URLs are tried in the listed order (equivalent to yum’s
                 “failovermethod=priority” behaviour).

          cost   integer

                 The relative cost of accessing this repository, defaulting
                 to 1000. This value is compared when the priorities of two
                 repositories are the same. The repository with the lowest
                 cost is picked. It is useful to make the library prefer
                 on-disk repositories to remote ones.

          enabled
                 boolean

                 Include this repository as a package source. The default
                 is True.

          gpgkey list of strings

                 URLs of a GPG key files that can be used for signing
                 metadata and packages of this repository, empty by
                 default. If a file can not be verified using the already
                 imported keys, import of keys from this option is
                 attempted and the keys are then used for verification.

          metalink
                 string

                 URL of a metalink for the repository. Defaults to None.

          mirrorlist
                 string

                 URL of a mirrorlist for the repository. Defaults to None.

          module_hotfixes
                 boolean

                 Set this to True to disable module RPM filtering and make
                 all RPMs from the repository available. The default is
                 False.  This allows user to create a repository with
                 cherry-picked hotfixes that are included in a package set
                 on a modular system.

          name   string

                 A human-readable name of the repository. Defaults to the
                 ID of the repository.

          priority
                 integer

                 The priority value of this repository, default is 99. If
                 there is more than one candidate package for a particular
                 operation, the one from a repo with the lowest priority
                 value is picked, possibly despite being less convenient
                 otherwise (e.g. by being a lower version).

          type   string

                 Type of repository metadata. Supported values are: rpm-md.
                 Aliases for rpm-md: rpm, repomd, rpmmd, yum, YUM.


---------------------------------------------------------------------

::

          Right side of every repo option can be enriched by the following
          variables:

          $arch
             Refers to the system’s CPU architecture e.g, aarch64, i586,
             i686 and x86_64.

          $basearch
             Refers to the base architecture of the system. For example,
             i686 and i586 machines both have a base architecture of i386,
             and AMD64 and Intel64 machines have a base architecture of
             x86_64.

          $releasever
             Refers to the release version of operating system which DNF
             derives from information available in RPMDB.

          In addition to these hard coded variables, user-defined ones can
          also be used. They can be defined either via variable files, or
          by using special environmental variables. The names of these
          variables must be prefixed with DNF_VAR_ and they can only
          consist of alphanumeric characters and underscores:

             $ DNF_VAR_MY_VARIABLE=value

          To use such variable in your repository configuration remove the
          prefix. E.g.:

             [myrepo]
             baseurl=https://example.site/pub/fedora/$MY_VARIABLE/releases/$releasever

          Note that it is not possible to override the arch and basearch
          variables using either variable files or environmental variables.

          Although users are encouraged to use named variables, the
          numbered environmental variables DNF0 - DNF9 are still supported:

             $ DNF1=value

             [myrepo]
             baseurl=https://example.site/pub/fedora/$DNF1/releases/$releasever


-------------------------------------------------------------------------------------------------------------

::

          Some options can be applied in either the main section, per
          repository, or in a combination. The value provided in the main
          section is used for all repositories as the default value, which
          repositories can then override in their configuration.

          bandwidth
                 storage size

                 Total bandwidth available for downloading. Meaningful when
                 used with the throttle option. Storage size is in bytes by
                 default but can be specified with a unit of storage. Valid
                 units are ‘k’, ‘M’, ‘G’.

          countme
                 boolean

                 Determines whether a special flag should be added to a
                 single, randomly chosen metalink/mirrorlist query each
                 week.  This allows the repository owner to estimate the
                 number of systems consuming it, by counting such queries
                 over a week’s time, which is much more accurate than just
                 counting unique IP addresses (which is subject to both
                 overcounting and undercounting due to short DHCP leases
                 and NAT, respectively).

                 The flag is a simple “countme=N” parameter appended to the
                 metalink and mirrorlist URL, where N is an integer
                 representing the “longevity” bucket this system belongs
                 to.  The following 4 buckets are defined, based on how
                 many full weeks have passed since the beginning of the
                 week when this system was installed: 1 = first week, 2 =
                 first month (2-4 weeks), 3 = six months (5-24 weeks) and 4
                 = more than six months (> 24 weeks).  This information is
                 meant to help distinguish short-lived installs from
                 long-term ones, and to gather other statistics about
                 system lifecycle.

                 Default is False.

          deltarpm
                 boolean

                 When enabled, DNF will save bandwidth by downloading much
                 smaller delta RPM files, rebuilding them to RPM locally.
                 However, this is quite CPU and I/O intensive. Default is
                 True.

          deltarpm_percentage
                 integer

                 When the relative size of delta vs pkg is larger than
                 this, delta is not used.  Default value is 75 (Deltas must
                 be at least 25% smaller than the pkg).  Use 0 to turn off
                 delta rpm processing. Local repositories (with file://
                 baseurl) have delta rpms turned off by default.

          enablegroups
                 boolean

                 Determines whether DNF will allow the use of package
                 groups for this repository. Default is True (package
                 groups are allowed).

          excludepkgs
                 list

                 Exclude packages of this repository, specified by a name
                 or a glob and separated by a comma, from all operations.
                 Can be disabled using --disableexcludes command line
                 switch.  Defaults to [].

          fastestmirror
                 boolean

                 If enabled a metric is used to find the fastest available
                 mirror. This overrides the order provided by the
                 mirrorlist/metalink file itself. This file is often
                 dynamically generated by the server to provide the best
                 download speeds and enabling fastestmirror overrides this.
                 The default is False.

          gpgcheck
                 boolean

                 Whether to perform GPG signature check on packages found
                 in this repository.  The default is False.

                 This option can only be used to strengthen the active RPM
                 security policy set with the %_pkgverify_level macro (see
                 the /usr/lib/rpm/macros file for details).  That means, if
                 the macro is set to ‘signature’ or ‘all’ and this option
                 is False, it will be overridden to True during DNF
                 runtime, and a warning will be printed.  To squelch the
                 warning, make sure this option is True for every enabled
                 repository, and also enable localpkg_gpgcheck.

          includepkgs
                 list

                 Include packages of this repository, specified by a name
                 or a glob and separated by a comma, in all operations.
                 Inverse of excludepkgs, DNF will exclude any package in
                 the repository that doesn’t match this list. This works in
                 conjunction with excludepkgs and doesn’t override it, so
                 if you ‘excludepkgs=*.i386’ and ‘includepkgs=python*’ then
                 only packages starting with python that do not have an
                 i386 arch will be seen by DNF in this repo.  Can be
                 disabled using --disableexcludes command line switch.
                 Defaults to [].

          ip_resolve
                 IP address type

                 Determines how DNF resolves host names. Set this to
                 ‘4’/’IPv4’ or ‘6’/’IPv6’ to resolve to IPv4 or IPv6
                 addresses only. By default, DNF resolves to either
                 addresses.

          localpkg_gpgcheck
                 boolean

                 Whether to perform a GPG signature check on local packages
                 (packages in a file, not in a repository).  The default is
                 False.  This option is subject to the active RPM security
                 policy (see gpgcheck for more details).

          max_parallel_downloads
                 integer

                 Maximum number of simultaneous package downloads. Defaults
                 to 3. Maximum of 20.

          metadata_expire
                 time in seconds

                 The period after which the remote repository is checked
                 for metadata update and in the positive case the local
                 metadata cache is updated. The default corresponds to 48
                 hours. Set this to -1 or never to make the repo never
                 considered expired. Expire of metadata can be also
                 triggered by change of timestamp of configuration files
                 (dnf.conf, <repo>.repo). See also check_config_file_age.

          minrate
                 storage size

                 This sets the low speed threshold in bytes per second. If
                 the server is sending data at the same or slower speed
                 than this value for at least timeout option seconds, DNF
                 aborts the connection. The default is 1000. Valid units
                 are ‘k’, ‘M’, ‘G’.

          password
                 string

                 The password to use for connecting to a repository with
                 basic HTTP authentication. Empty by default.

          proxy  string

                 URL of a proxy server to connect through. Set to an empty
                 string to disable the proxy setting inherited from the
                 main section and use direct connection instead. The
                 expected format of this option is
                 <scheme>://<ip-or-hostname>[:port].  (For backward
                 compatibility, ‘_none_’ can be used instead of the empty
                 string.)

                 Note: The curl environment variables (such as http_proxy)
                 are effective if this option is unset. See the curl man
                 page for details.

          proxy_username
                 string

                 The username to use for connecting to the proxy server.
                 Empty by default.

          proxy_password
                 string

                 The password to use for connecting to the proxy server.
                 Empty by default.

          proxy_auth_method
                 string

                 The authentication method used by the proxy server. Valid
                 values are

                           ┌──────────┬──────────────────────────┐
                           │method    │ meaning                  │
                           ├──────────┼──────────────────────────┤
                           │basic     │ HTTP Basic               │
                           │          │ authentication           │
                           └──────────┴──────────────────────────┘

                           │digest    │ HTTP Digest              │
                           │          │ authentication           │
                           ├──────────┼──────────────────────────┤
                           │negotiate │ HTTP Negotiate (SPNEGO)  │
                           │          │ authentication           │
                           ├──────────┼──────────────────────────┤
                           │ntlm      │ HTTP NTLM authentication │
                           ├──────────┼──────────────────────────┤
                           │digest_ie │ HTTP Digest              │
                           │          │ authentication with an   │
                           │          │ IE flavor                │
                           ├──────────┼──────────────────────────┤
                           │ntlm_wb   │ NTLM delegating to       │
                           │          │ winbind helper           │
                           ├──────────┼──────────────────────────┤
                           │none      │ None auth method         │
                           ├──────────┼──────────────────────────┤
                           │any       │ All suitable methods     │
                           └──────────┴──────────────────────────┘

                 Defaults to any

          proxy_sslcacert
                 string

                 Path to the file containing the certificate authorities to
                 verify proxy SSL certificates.  Empty by default - uses
                 system default.

          proxy_sslverify
                 boolean

                 When enabled, proxy SSL certificates are verified. If the
                 client can not be authenticated, connecting fails and the
                 repository is not used any further. If False, SSL
                 connections can be used, but certificates are not
                 verified. Default is True.

          proxy_sslclientcert
                 string

                 Path to the SSL client certificate used to connect to
                 proxy server.  Empty by default.

          proxy_sslclientkey
                 string

                 Path to the SSL client key used to connect to proxy
                 server.  Empty by default.

          repo_gpgcheck
                 boolean

                 Whether to perform GPG signature check on this
                 repository’s metadata. The default is False.

          retries
                 integer

                 Set the number of total retries for downloading packages.
                 The number is accumulative, so e.g. for retries=10, dnf
                 will fail after any package download fails for eleventh
                 time. Setting this to 0 makes dnf try forever. Default is
                 10.

          skip_if_unavailable
                 boolean

                 If enabled, DNF will continue running and disable the
                 repository that couldn’t be synchronized for any reason.
                 This option doesn’t affect skipping of unavailable
                 packages after dependency resolution. To check
                 inaccessibility of repository use it in combination with
                 refresh command line option. The default is False.  Note
                 this option in particular can be set in your configuration
                 file by your distribution.

          sslcacert
                 string

                 Path to the file containing the certificate authorities to
                 verify SSL certificates.  Empty by default - uses system
                 default.

          sslverify
                 boolean

                 When enabled, remote SSL certificates are verified. If the
                 client can not be authenticated, connecting fails and the
                 repository is not used any further. If False, SSL
                 connections can be used, but certificates are not
                 verified. Default is True.

          sslverifystatus
                 boolean

                 When enabled, revocation status of the server certificate
                 is verified using the “Certificate Status Request” TLS
                 extension (aka. OCSP stapling). Default is False.

          sslclientcert
                 string

                 Path to the SSL client certificate used to connect to
                 remote sites.  Empty by default.

          sslclientkey
                 string

                 Path to the SSL client key used to connect to remote
                 sites.  Empty by default.

          throttle
                 storage size

                 Limits the downloading speed. It might be an absolute
                 value or a percentage, relative to the value of the
                 bandwidth option option. 0 means no throttling (the
                 default). The absolute value is in bytes by default but
                 can be specified with a unit of storage. Valid units are
                 ‘k’, ‘M’, ‘G’.

          timeout
                 time in seconds

                 Number of seconds to wait for a connection before timing
                 out. Used in combination with minrate option option.
                 Defaults to 30 seconds.

          username
                 string

                 The username to use for connecting to repo with basic HTTP
                 authentication. Empty by default.

          user_agent
                 string

                 The User-Agent string to include in HTTP requests sent by
                 DNF.  Defaults to

                    libdnf (NAME VERSION_ID; VARIANT_ID; OS.BASEARCH)

                 where NAME, VERSION_ID and VARIANT_ID are OS identifiers
                 read from the os-release(5) file, and OS and BASEARCH are
                 the canonical OS name and base architecture, respectively.
                 Example:

                    libdnf (Fedora 31; server; Linux.x86_64)


-------------------------------------------------------------------------

::

          boolean
                 This is a data type with only two possible values.

                 One of following options can be used: 1, 0, True, False,
                 yes, no

          integer
                 It is a whole number that can be written without a
                 fractional component.

          list   It is an option that could represent one or more strings
                 separated by space or comma characters.

          string It is a sequence of symbols or digits without any
                 whitespace character.

          color  A string describing color and modifiers separated with a
                 comma, for example “red,bold”.

                 • Colors: black, blue, cyan, green, magenta, red, white,
                   yellow

                 • Modifiers: bold, blink, dim, normal, reverse, underline


---------------------------------------------------

::

          Cache Files
                 /var/cache/dnf

          Main Configuration File
                 /etc/dnf/dnf.conf

          Repository
                 /etc/yum.repos.d/

          Variables
                 Any properly named file in /etc/dnf/vars is turned into a
                 variable named after the filename (or overrides any of the
                 above variables but those set from commandline). Filenames
                 may contain only alphanumeric characters and underscores
                 and be in lowercase.  Variables are also read from
                 /etc/yum/vars for YUM compatibility reasons.


---------------------------------------------------------

::

          • dnf(8), DNF Command Reference


-----------------------------------------------------

::

          See AUTHORS in DNF source distribution.


-----------------------------------------------------------

::

          2012-2020, Red Hat, Licensed under GPLv2+

COLOPHON
---------------------------------------------------------

::

          This page is part of the dnf (DNF Package Manager) project.
          Information about the project can be found at 
          ⟨https://github.com/rpm-software-management/dnf⟩.  It is not known
          how to report bugs for this man page; if you know, please send a
          mail to man-pages@man7.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/rpm-software-management/dnf.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-19.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   4.8.0                         Aug 27, 2021                   DNF.CONF(5)

--------------

Pages that refer to this page:
`yum-aliases(1) <../man1/yum-aliases.1.html>`__, 
`dnf(8) <../man8/dnf.8.html>`__,  `yum(8) <../man8/yum.8.html>`__, 
`yum-shell(8) <../man8/yum-shell.8.html>`__

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
