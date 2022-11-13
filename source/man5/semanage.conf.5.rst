.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semanage.conf(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   semanage.conf(5)       Linux System Administration      semanage.conf(5)

NAME
-------------------------------------------------

::

          semanage.conf - global configuration file for the SELinux
          Management library


---------------------------------------------------------------

::

          The semanage.conf file is usually located under the directory
          /etc/selinux and it is used for run-time configuration of the
          behavior of the SELinux Management library.

          Each line should contain a configuration parameter followed by
          the equal sign ("=") and then followed by the configuration value
          for that parameter. Anything after the "#" symbol is ignored
          similarly to empty lines.

          The following parameters are allowed:

                 module-store
                        Specify how the SELinux Management library should
                        interact with the SELinux policy store. When set to
                        "direct", the SELinux Management library writes to
                        the SELinux policy module store directly (this is
                        the default setting).  Otherwise a socket path or a
                        server name can be used for the argument.  If the
                        argument begins with "/" (as in "/foo/bar"), it
                        represents the path to a named socket that should
                        be used to connect the policy management server.
                        If the argument does not begin with a "/" (as in
                        "foo.com:4242"), it should be interpreted as the
                        name of a remote policy management server to be
                        used through a TCP connection (default port is 4242
                        unless a different one is specified after the
                        server name using the colon to separate the two
                        fields).

                 root   Specify an alternative root path to use for the
                        store. The default is "/"

                 store-root
                        Specify an alternative store_root path to use. The
                        default is "/var/lib/selinux"

                 compiler-directory
                        Specify an alternative directory that contains HLL
                        to CIL compilers. The default value is
                        "/usr/libexec/selinux/hll".

                 ignore-module-cache
                        Whether or not to ignore the cache of CIL modules
                        compiled from HLL. It can be set to either "true"
                        or "false" and is set to "false" by default.  If
                        the cache is ignored, then all CIL modules are
                        recompiled from their HLL modules.

                 policy-version
                        When generating the policy, by default semanage
                        will set the policy version to
                        POLICYDB_VERSION_MAX, as defined in
                        <sepol/policydb/policydb.h>. Change this setting if
                        a different version needs to be set for the policy.

                 target-platform
                        The target platform to generate policies for. Valid
                        values are "selinux" and "xen", and is set to
                        "selinux" by default.

                 expand-check
                        Whether or not to check "neverallow" rules when
                        executing all semanage command. It can be set to
                        either "0" (disabled) or "1" (enabled) and by
                        default it is enabled. There might be a large
                        penalty in execution time if this option is
                        enabled.

                 file-mode
                        By default the permission mode for the run-time
                        policy files is set to 0644.

                 save-previous
                        It controls whether the previous module directory
                        is saved after a successful commit to the policy
                        store and it can be set to either "true" or
                        "false". By default it is set to "false" (the
                        previous version is deleted).

                 save-linked
                        It controls whether the previously linked module is
                        saved (with name "base.linked") after a successful
                        commit to the policy store.  It can be set to
                        either "true" or "false" and by default it is set
                        to "false" (the previous module is deleted).

                 ignoredirs
                        List, separated by ";",  of directories to ignore
                        when setting up users homedirs.  Some distributions
                        use this to stop labeling /root as a homedir.

                 usepasswd
                        Whether or not to enable the use getpwent() to
                        obtain a list of home directories to label. It can
                        be set to either "true" or "false".  By default it
                        is set to "true".

                 disable-genhomedircon
                        It controls whether or not the genhomedircon
                        function is executed when using the semanage
                        command and it can be set to either "false" or
                        "true". By default the genhomedircon functionality
                        is enabled (equivalent to this option set to
                        "false").

                 handle-unknown
                        This option overrides the kernel behavior for
                        handling permissions defined in the kernel but
                        missing from the actual policy.  It can be set to
                        "deny", "reject" or "allow". By default the setting
                        from the policy is taken.

                 bzip-blocksize
                        It should be in the range 0-9. A value of 0 means
                        no compression. By default the bzip block size is
                        set to 9 (actual block size value is obtained after
                        multiplication by 100000).

                 bzip-small
                        When set to "true", the bzip algorithm shall try to
                        reduce its system memory usage. It can be set to
                        either "true" or "false" and by default it is set
                        to "false".

                 remove-hll
                        When set to "true", HLL files will be removed after
                        compilation into CIL. In order to delete HLL files
                        already compiled into CIL, modules will need to be
                        recompiled with the ignore-module-cache option set
                        to 'true' or using the ignore-module-cache option
                        with semodule. The remove-hll option can be set to
                        either "true" or "false" and by default it is set
                        to "false".

                        Please note that since this option deletes all HLL
                        files, an updated HLL compiler will not be able to
                        recompile the original HLL file into CIL.  In order
                        to compile the original HLL file into CIL, the same
                        HLL file will need to be reinstalled.

                 optimize-policy
                        When set to "true", the kernel policy will be
                        optimized upon rebuilds.  It can be set to either
                        "true" or "false" and by default it is set to
                        "false".


---------------------------------------------------------

::

          semanage(8)


-----------------------------------------------------

::

          This manual page was written by Guido Trentalancia
          <guido@trentalancia.com>.

          The SELinux management library was written by Tresys Technology
          LLC and Red Hat Inc.

COLOPHON
---------------------------------------------------------

::

          This page is part of the selinux (Security-Enhanced Linux user-
          space libraries and tools) project.  Information about the
          project can be found at 
          ⟨https://github.com/SELinuxProject/selinux/wiki⟩.  If you have a
          bug report for this manual page, see
          ⟨https://github.com/SELinuxProject/selinux/wiki/Contributing⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/SELinuxProject/selinux⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   semanage.conf                September 2011             semanage.conf(5)

--------------

Pages that refer to this page:
`genhomedircon(8) <../man8/genhomedircon.8.html>`__

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
