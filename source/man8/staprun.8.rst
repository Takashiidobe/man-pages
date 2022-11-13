.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

staprun(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `M                                |                                   |
| ODULE DETACHING AND ATTACHING <#M |                                   |
| ODULE_DETACHING_AND_ATTACHING>`__ |                                   |
| \|                                |                                   |
| `FILE SWITCHING BY SIGN           |                                   |
| AL <#FILE_SWITCHING_BY_SIGNAL>`__ |                                   |
| \|                                |                                   |
| `SAFETY AND S                     |                                   |
| ECURITY <#SAFETY_AND_SECURITY>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STAPRUN(8)               System Manager's Manual              STAPRUN(8)

NAME
-------------------------------------------------

::

          staprun - systemtap runtime


---------------------------------------------------------

::

          staprun [ OPTIONS ] MODULE [ MODULE-OPTIONS ]


---------------------------------------------------------------

::

          The staprun program is the back-end of the Systemtap tool.  It
          expects a kernel module produced by the front-end stap tool.

          Splitting the systemtap tool into a front-end and a back-end
          allows a user to compile a systemtap script on a development
          machine that has the kernel development tools (needed to compile
          the script) and then transfer the resulting kernel module to a
          production machine that doesn't have any development tools
          installed.

          Please refer to stappaths (7) for the version number, or run rpm
          -q systemtap (fedora/red hat) apt-get -v systemtap (ubuntu)


-------------------------------------------------------

::

          The staprun program supports the following options.  Any other
          option prints a list of supported options.

          -v     Verbose mode. The level of verbosity is also set in the
                 SYSTEMTAP_VERBOSE environment variable.

          -V     Print version number and exit.

          -w     Suppress warnings from the script.

          -u     Load the uprobes.ko module.

          -c CMD Command CMD will be run and the staprun program will exit
                 when CMD does.  The '_stp_target' variable will contain
                 the pid for CMD.

          -x PID The '_stp_target' variable will be set to PID.

          -o FILE
                 Send output to FILE. If the module uses bulk mode, the
                 output will be in percpu files FILE_x(FILE_cpux in
                 background and bulk mode) where 'x' is the cpu number.
                 This supports strftime(3) formats for FILE.

          -b BUFFER_SIZE
                 The systemtap module will specify a buffer size.  Setting
                 one here will override that value. The value should be an
                 integer between 1 and 4095 which be assumed to be the
                 buffer size in MB. That value will be per-cpu if bulk mode
                 is used.

          -L     Load module and start probes, then detach from the module
                 leaving the probes running.  The module can be attached to
                 later by using the -A option.

          -A     Attach to loaded systemtap module.

          -C WHEN
                 Control coloring of error messages. WHEN must be either
                 "never", "always", or "auto" (i.e. enable only if at a
                 terminal). If the option is missing, then "auto" is
                 assumed. Colors can be modified using the SYSTEMTAP_COLORS
                 environment variable. See the stap(1) manual page for more
                 information on syntax and behaviour.

          -d     Delete a module.  Only detached or unused modules the user
                 has permission to access will be deleted. Use "*" (quoted)
                 to delete all unused modules.

          -D     Run staprun in background as a daemon and show it's pid.

          -R     Rename the module to a unique name before inserting it.

          -r N:URI
                 Pass the given number and URI data to the tapset functions
                 remote_id() and remote_uri().

          -S size[,N]
                 Sets the maximum size of output file and the maximum
                 number of output files.  If the size of output file will
                 exceed size , systemtap switches output file to the next
                 file. And if the number of output files exceed N ,
                 systemtap removes the oldest output file. You can omit the
                 second argument.

          -T timeout
                 Sets maximum time reader thread will wait before dumping
                 trace buffer. Value is in ms, default is 200ms. Setting
                 this to a high value decreases number of stapio wake-ups,
                 allowing deeper sleep for embedded platforms. But it
                 impacts interactivity on terminal as traces are dumped
                 less often in case of low throughput.  There is no
                 interactivity or performance impact for high throughput as
                 trace is dumped when buffer is full, before this timeout
                 expires.

          var1=val
                 Sets the value of global variable var1 to val. Global
                 variables contained within a module are treated as module
                 options and can be set from the staprun command line.


-----------------------------------------------------------

::

          MODULE is either a module path or a module name.  If it is a
          module name, the module will be looked for in the following
          directory (where 'VERSION' is the output of "uname -r"):

                 /lib/modules/VERSION/systemtap

          Any additional arguments on the command line are passed to the
          module.  One use of these additional module arguments is to set
          the value of global variables declared within the module.

           $ stap -p4 -m mod1 -e 'global var1="foo"; probe
          begin{printf("%s\n", var1); exit()}'

          Running this with an additional module argument:

           $ staprun mod1.ko var1="HelloWorld"
           HelloWorld

          Spaces and exclamation marks currently cannot be passed into
          global variables this way.


---------------------------------------------------------

::

          See the stapex(3stap) manual page for a collection of sample
          scripts.

          Here is a very basic example of how to use staprun.  First, use
          stap to compile a script.  The stap program will report the
          pathname to the resulting module.

           $ stap -p4 -e 'probe begin { printf("Hello World!\n"); exit() }'
           /home/user/.systemtap/cache/85/stap_8553d83f78c_265.ko

          Run staprun with the pathname to the module as an argument.

           $ staprun /home/user/.systemtap/cache/85/stap_8553d83f78c_265.ko
           Hello World!


-----------------------------------------------------------------------------------------------------

::

          After the staprun program installs a Systemtap kernel module,
          users can detach from the kernel module and reattach to it later.
          The -L option loads the module and automatically detaches.  Users
          can also detach from the kernel module interactively by sending
          the SIGQUIT signal from the keyboard (typically by typing
          Ctrl-\).

          To reattach to a kernel module, the staprun -A option would be
          used.


-----------------------------------------------------------------------------------------

::

          After staprun launched the stapio program, users can command it
          to switch output file to next file when it outputs to file(s)
          (running staprun with -o option) by sending a SIGUSR2 signal to
          the stapio process. When it receives SIGUSR2, it will switch
          output file to new file with suffix .N where N is the sequential
          number.  For example,

           $ staprun -o foo ...

          outputs trace logs to foo and if it receives SIGUSR2 signal, it
          switches output to foo.1 file. And receiving SIGUSR2 again, it
          switches to foo.2 file.


-------------------------------------------------------------------------------

::

          Systemtap, in the default kernel-module runtime mode, is an
          administrative tool.  It exposes kernel internal data structures
          and potentially private user information.  See the stap(1) manual
          page for additional information on safety and security.

          To increase system security, users of systemtap must be root, or
          in the stapusr group in order to execute this setuid staprun
          program.  A user may select a particular privilege level with the
          stap --privilege= option, which staprun will later enforce.

          stapdev
                 Members of the stapdev group can write and load script
                 modules with root-equivalent privileges, without
                 particular security constraints.  (Many safety constraints
                 remain.)

          stapsys
                 Members of the stapsys group have almost all the
                 privileges of stapdev, except for guru mode constructs.

          stapusr
                 Members only of the stapusr group may any-privileged
                 modules placed into the /lib/modules/VERSION/systemtap by
                 the system administrator.

          stapusr
                 Members only of the stapusr group may also write and load
                 low-privilege script modules, which are normally limited
                 to manipulating their own processes (and not the kernel
                 nor other users' processes).

          Part of the privilege enforcement mechanism may require using a
          stap-server and administrative trust in its cryptographic signer;
          see the stap-server(8) manual page for a for more information.

          On a kernel with FIPS mode enabled, staprun normally refuses to
          attempt to load systemtap-generated kernel modules.  This is
          because on some kernels, this results in a panic.  If your kernel
          includes corrections such as linux commit #002c77a48b47, then you
          can force staprun to attempt module loads anyway, by setting the
          STAP_FIPS_OVERRIDE environment variable to any value.


---------------------------------------------------

::

          /lib/modules/VERSION/systemtap
                 If MODULE is a module name, the module will be looked for
                 in this directory.  Users who are only in the 'stapusr'
                 group can install modules located in this directory.  This
                 directory must be owned by the root user and not be world
                 writable.


---------------------------------------------------------

::

          stap(1), stapprobes(3stap), stap-server(8), stapdyn(8),
          stapex(3stap)


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

                                                                 STAPRUN(8)

--------------

Pages that refer to this page: `stap(1) <../man1/stap.1.html>`__, 
`stap-merge(1) <../man1/stap-merge.1.html>`__, 
`stappaths(7) <../man7/stappaths.7.html>`__, 
`stapbpf(8) <../man8/stapbpf.8.html>`__, 
`stapdyn(8) <../man8/stapdyn.8.html>`__, 
`stap-server(8) <../man8/stap-server.8.html>`__

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
