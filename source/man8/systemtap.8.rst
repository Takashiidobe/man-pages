.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemtap(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `GLOBAL P                         |                                   |
| ARAMETERS <#GLOBAL_PARAMETERS>`__ |                                   |
| \|                                |                                   |
| `SCRIPT P                         |                                   |
| ARAMETERS <#SCRIPT_PARAMETERS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMTAP(8)             System Manager's Manual            SYSTEMTAP(8)

NAME
-------------------------------------------------

::

          systemtap - SystemTap initscript service


---------------------------------------------------------

::

          service systemtap COMMAND [OPTIONS] [SCRIPT...]


---------------------------------------------------------------

::

          The SystemTap initscript aims to provide a way to run scripts as
          a service and easily control them individually. Scripts can be
          configured to start upon manual request, or during system
          startup. On dracut-based systems, it is also possible to
          integrate scripts in the initramfs and have them start during
          early-boot.

          There are various parameters and options available to modify
          global behaviour, as well as script behaviour. Dependencies
          between scripts can be established so that starting one starts
          others.

          The configuration file of the initscript is located at
          ${prefix}/etc/systemtap/config. Acceptable parameters are
          detailed in the GLOBAL PARAMETERS section.

          Scripts must be placed in the ${prefix}/etc/systemtap/script.d
          directory and must have a .stp extension. When referring to them
          on the command-line however, there in no need to include the .stp
          extension.  Script names can only contain alphanumeric characters
          (and '_') and must not start with a number. The scripts directory
          may be changed by setting the SCRIPT_PATH parameter in the
          configuration file.


---------------------------------------------------------

::

          One of the commands below must be specified:

          start  Start SCRIPTs. If no scripts are specified, start the
                 scripts specified by the DEFAULT_START configuration. If
                 DEFAULT_START is not set, start all scripts in the script
                 directory. For scripts already started, the command is
                 ignored.  The command will fail if the scripts fail to
                 start (see also the PASSALL configuration).

                 If the AUTOCOMPILE configuration is on, the command will
                 try to compile or update the specified scripts when one of
                 the below conditions is true:

                 - The compiled cache file does not exist.

                 - The mtime (modified timestamp) of the original script
                   file is newer than the time of the compiled script
                   cache.

                 - The specified stap options used to compile the script
                   has been changed (see also the SCRIPT PARAMETERS
                   section).

                 - The result of `uname -a` has been changed.

          stop   Stop SCRIPTs. If no scripts are specified, stop all
                 running scripts. For scripts already stopped, the command
                 is ignored. The command will fail if the scripts fail to
                 stop (see also the PASSALL configuration).

          restart
                 Stop and start SCRIPTs.

          status Show the state of SCRIPTs and their dependencies.

          compile
                 Compile SCRIPTs but do not start them. If the scripts have
                 already been compiled, prompt for confirmation before
                 overwriting cache. Compile for the current kernel, or the
                 kernel release specified by the -r option.

          onboot Make SCRIPTs part of the initramfs so that they are
                 started earlier during the boot process. This command is
                 only available on dracut-based systems. If no scripts are
                 specified, create a normal initramfs devoid of any
                 SystemTap files.

                 The initramfs is created for the current kernel, or the
                 kernel release specified by the -r option. The path of the
                 created initramfs defaults to /boot/initramfs-KVER.img,
                 where KVER is the output of `uname -r`. The bootloader is
                 also updated (using new-kernel-pkg(8)) to make the kernel
                 entry use the new initramfs file. Use the -o option to
                 specify a different path (the bootloader will not be
                 updated).

                 If the output file already exists, it is overwritten,
                 unless the -b switch is given, in which case the file is
                 appended .bak rather than overwritten.  However, if there
                 is already a .bak version of the file, the backup will not
                 be overwritten.

                 WARNING: do not use the -o option of stap(1) with onboot
                 scripts because the script is started before the root
                 filesystem is even mounted.  Increase the buffer size if
                 more space is needed.

          cleanup
                 Delete the compiled SCRIPTs from cache. If no scripts are
                 specified, then all compiled scripts are deleted. Only the
                 cache for the current kernel is deleted, or the kernel
                 release specified by the -r option. Prompt for
                 confirmation before deleting.


-------------------------------------------------------

::

          Many of the commands can also take options. However, since users
          can't pass these options on boot, they are only meant for
          managing scripts after boot and for testing. Available options
          are:

          -c CONFIG_FILE
                 Specify a different configuration file in place of the
                 default one.

          -R     When using the start and stop commands, also include the
                 scripts' dependencies (recursively).

          -r KERNEL_RELEASE
                 When using the compile, onboot, and cleanup commands,
                 specify the target kernel version rather than using the
                 current one. Must be in the same format as `uname -r`.

          -y     Answer yes for all prompts.

          -o PATH.IMG
                 When using the onboot command, specify the output path of
                 the created initramfs. When specified, the bootloader
                 configuration is not updated.

          -b     When using the onboot command, backup an existing
                 initramfs image by adding a .bak extension rather than
                 overwriting it. Without this option, the initramfs is
                 overwritten.


---------------------------------------------------------------------------

::

          These parameters affect the general behaviour of the SystemTap
          initscript service. They can be specified in the configuration
          file.

          SCRIPT_PATH
                 Specify the absolute path of the script directory. These
                 are the scripts on which the initscript can operate.
                 Scripts must have the .stp extension.  The default path is
                 ${prefix}/etc/systemtap/script.d.

          CONFIG_PATH
                 Specify the absolute path of the script configuration
                 directory. These configuration files contain options for
                 specific scripts. They must have the .conf extension. The
                 default path is ${prefix}/etc/systemtap/conf.d.

          CACHE_PATH
                 Specify the absolute path of the cache directory. The
                 default path is ${prefix}/var/cache/systemtap.

          TEMP_PATH
                 Specify the absolute path of the temporary directory in
                 which SystemTap makes temporary directories to compile
                 scripts. The default path is /tmp.

          STAT_PATH
                 Specify the absolute path of the directory containing PID
                 files used to track the status of SystemTap scripts. The
                 default path is ${prefix}/var/run/systemtap.

          LOG_FILE
                 Specify the absolute path of the log file. All messages
                 are sent to this file, including compilation and runtime
                 errors. The default path is
                 ${prefix}/var/log/systemtap.log.

          PASSALL
                 If this is set yes, initscript commands that operate on
                 multiple scripts will report as failed when the action
                 could not be performed on at least one script. If set to
                 no, only a warning is emitted. The default is yes.

          RECURSIVE
                 If this is set yes, the initscript will always follow
                 script dependencies recursively. This means that there is
                 no need to specify the -R option.  This flag is effective
                 only if you specify script(s) from the command-line. The
                 default is no.

          AUTOCOMPILE
                 If this is set yes, the initscript automatically tries to
                 compile specified scripts when needed if there is no valid
                 cache. Otherwise, the related command simply fails. The
                 default is yes.

          DEFAULT_START
                 Specify scripts which will be started by default. If
                 omitted (or empty), all scripts in the script directory
                 will be started. The default is "".

          ALLOW_CACHEONLY
                 If this is set yes, the initscript will also allow
                 operating on scripts that are located in the cache
                 directory, but not in the script directory. The default is
                 no.

                 WARNING: the initscript may load unexpected obsolete
                 caches with this option.  The cache directory should be
                 checked before enabling this option.

          LOG_BOOT_ERR
                 Because boot-time scripts are run before the root
                 filesystem is mounted, staprun's stderr cannot be logged
                 to the LOG_FILE as usual. However, the log can instead be
                 output to /var/run/systemtap/$script.log by setting
                 LOG_BOOT_ERR to yes. If STAT_PATH is different from the
                 default, the log files will be moved there upon executing
                 any of the initscript commands. The default is no.

          Here is a global configuration file example:

                 SCRIPT_PATH=/var/systemtap/script.d/
                 PASSALL=yes
                 RECURSIVE=no


---------------------------------------------------------------------------

::

          These parameters affect the compilation or runtime behaviour of
          specific SystemTap scripts. They must be placed in config files
          located in the CONFIG_PATH directory.

          <SCRIPT>_OPT
                 Specify options passed to the stap(1) command for the
                 SCRIPT. Here, SCRIPT is the name of the script file
                 without the .stp extension. Note that the -F option is
                 always added.

                 The following options are ignored when compiling scripts:
                 -p, -m, -r, -c, -x, -e, -s, -o, -h, -V, -k.

                 The following options are ignored when running starting
                 scripts: -h, -V, -v, -t, -p, -I, -e, -R, -r, -m, -k, -g,
                 -P, -D, -b, -u, -q, -w, -l, -d, -L, -F, and all long
                 options.

          <SCRIPT>_REQ
                 Specify script dependencies (i.e. which script this script
                 requires). For example, if foo.stp requires (or needs to
                 run after) bar.stp, set

                 foo_REQ="bar"

                 Specify multiple scripts by separating their names by
                 spaces.

          Here is a script configuration file example:

                 script1_OPT="-o /var/log/script1.out"
                 script2_OPT="-o /var/log/script2.out"
                 script2_REQ="script1"


---------------------------------------------------------

::

          INSTALLING SCRIPTS
                 We first copy a SystemTap script (e.g. "script1.stp") into
                 the script directory:

                 # cp script1.stp /etc/systemtap/script.d/

                 We can then set any script options, for example:

                 # vi /etc/systemtap/conf.d/group1
                 script1_OPT="-o /var/log/group1.out"

                 We then install a script (e.g. "script2.stp") which needs
                 to run after script1. In this case, we can do the
                 following:

                 # cp script2.stp /etc/systemtap/script.d/
                 # vi /etc/systemtap/conf.d/group1
                 script2_OPT="-o /var/log/group2.out"
                 script2_REQ="script1"

                 This way, if stap(1) fails to run script1, the initscript
                 will not even try to run script2.

          TESTING
                 After installing scripts, we can test that they work by
                 simply doing:

                 # service systemtap start
                 # service systemtap stop

                 We could be more specific as well, for example:

                 # service systemtap start script1
                 # service systemtap stop script1

                 If there were no errors, we are ready to use it.

          ENABLING SERVICE
                 After we're satisfied with the scripts and their tests, we
                 can enable the SystemTap initscript service:

                 # chkconfig systemtap on

          DELETING SCRIPTS
                 Scripts are deleted by simply removing them from the
                 script directory and removing any configuration lines
                 specific to them:

                 # rm /etc/systemtap/script.d/script2.stp
                 # vi /etc/systemtap/conf.d/group1

                 If the script is still running, we also need to stop it:

                 # service systemtap stop script2

                 We can then also remove the cache associated with the
                 script:

                 # service systemtap cleanup script2

          PREPARING FOR KERNEL UPDATES
                 Usually, there is nothing to do when booting into a new
                 kernel. The initscript will see that the kernel version is
                 different and will compile the scripts. The compilation
                 can be done beforehand as well to avoid having to compile
                 during boot by using the -r option:

                 # service systemtap compile myscript -r <NEW_KERNEL_VERSION>

          IMPORTING COMPILED SCRIPTS
                 For environments which lack compilation infrastructure
                 (e.g. no compilers or debuginfo), such as a production
                 system, the scripts can be compiled on another
                 (development) machine and then transferred over to the
                 production system:

                 # service systemtap compile myscript -r \
                 >   <KERNEL_VERSION_OF_TARGET_MACHINE>
                 # tar czf stap-scripts-<kernel-version>.tar.gz \
                 >   /var/cache/systemtap/<kernel-version> \
                 >   /etc/systemtap/conf.d/<configfile>

                 And then copy this package to the target machine and
                 extract it.

          STARTING SCRIPTS DURING EARLY-BOOT
                 The initscript also allows us to start scripts earlier
                 during the boot process by creating an initramfs
                 containing the script's module. The system must be dracut-
                 based for this to work. Starting a script at this stage
                 gives access to information otherwise very hard to obtain.

                 We first install the script by copying it into the script
                 directory as usual and setting whatever options we'd like:

                 # cp myscript.stp /etc/systemtap/script.d
                 # vi /etc/systemtap/conf.d/myscript.conf

                 To add the script to the initramfs, we use the onboot
                 command:

                 # service systemtap onboot myscript

                 If the script is not already compiled and cached, it will
                 be done at this point.  A new initramfs will then be
                 created at the default location. We can use the -b option
                 to ensure that the existing initramfs is backed up. We can
                 then restart the system.

          USING A DIFFERENT INITRAMFS
                 If we would prefer to only start the script for one boot
                 and not others, it might be easier to instead use the -o
                 option to specify a different initramfs output file:

                 # service systemtap onboot myscript \
                 >   -o /boot/special_initramfs.img

                 Once the initramfs is created, it's simply a matter of
                 changing the command-line options at boot-time so that the
                 new image is used rather than the usual one.

          CREATING AN INITRAMFS FOR A DIFFERENT KERNEL
                 Just like the compile command, we can use the -r option to
                 specify the kernel for which we want to create the
                 initramfs. This is useful when we are about to upgrade and
                 would like to prepare in advance. For example:

                 # service systemtap onboot myscript \
                 >   -r 3.12.6-200.fc19.x86_64

          REMOVING SCRIPTS FROM THE INITRAMFS
                 Finally, to remove all script from the initramfs, we
                 simple run the onboot command without specifying any
                 scripts:

                 # service systemtap onboot

                 This will simply create a standard initramfs without any
                 SystemTap modules inserted.

          TROUBLESHOOTING EARLY-BOOT ISSUES
                 There can be many reasons for which the module didn't
                 insert or did not work as expected. It may be useful to
                 turn on dracut debugging by adding 'rdinitdebug' to the
                 kernel command-line and checking dmesg/journalctl -ae.
                 Also, the stderr output of staprun can be captured by
                 setting the LOG_BOOT_ERR option to yes.


---------------------------------------------------------

::

          stap(1) dracut(8) new-kernel-pkg(8)


-------------------------------------------------

::

          Use the Bugzilla link of the project web page or our mailing
          list.  http://sourceware.org/systemtap/ ,
          <systemtap@sourceware.org>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemtap (a tracing and live-system
          analysis tool) project.  Information about the project can be
          found at ⟨https://sourceware.org/systemtap/⟩.  If you have a bug
          report for this manual page, send it to systemtap@sourceware.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://sourceware.org/git/systemtap.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                               SYSTEMTAP(8)

--------------

Pages that refer to this page: `stap(1) <../man1/stap.1.html>`__

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
