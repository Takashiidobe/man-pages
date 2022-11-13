.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

audit2allow(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUDIT2ALLOW(1)                     NSA                    AUDIT2ALLOW(1)

NAME
-------------------------------------------------

::

          audit2allow - generate SELinux policy allow/dontaudit rules from
          logs of denied operations

          audit2why - translates SELinux audit messages into a description
          of why the access was denied (audit2allow -w)


---------------------------------------------------------

::

          audit2allow [options]


-------------------------------------------------------

::

          -a | --all
                 Read input from audit and message log, conflicts with -i

          -b | --boot
                 Read input from audit messages since last boot conflicts
                 with -i

          -d | --dmesg
                 Read input from output of /bin/dmesg.  Note that all audit
                 messages are not available via dmesg when auditd is
                 running; use "ausearch -m avc | audit2allow"  or "-a"
                 instead.

          -D | --dontaudit
                 Generate dontaudit rules (Default: allow)

          -h | --help
                 Print a short usage message

          -i  <inputfile> | --input <inputfile>
                 read input from <inputfile>

          -l | --lastreload
                 read input only after last policy reload

          -m <modulename> | --module <modulename>
                 Generate module/require output <modulename>

          -M <modulename>
                 Generate loadable module package, conflicts with -o

          -p <policyfile> | --policy <policyfile>
                 Policy file to use for analysis

          -o <outputfile> | --output <outputfile>
                 append output to <outputfile>

          -r | --requires
                 Generate require output syntax for loadable modules.

          -N | --noreference
                 Do not generate reference policy, traditional style allow
                 rules.  This is the default behavior.

          -R | --reference
                 Generate reference policy using installed macros.  This
                 attempts to match denials against interfaces and may be
                 inaccurate.

          -x | --xperms
                 Generate extended permission access vector rules

          -w | --why
                 Translates SELinux audit messages into a description of
                 why the access was denied

          -v | --verbose
                 Turn on verbose output


---------------------------------------------------------------

::

          This utility scans the logs for messages logged when the system
          denied permission for operations, and generates a snippet of
          policy rules which, if loaded into policy, might have allowed
          those operations to succeed. However, this utility only generates
          Type Enforcement (TE) allow rules.  Certain permission denials
          may require other kinds of policy changes, e.g. adding an
          attribute to a type declaration to satisfy an existing
          constraint, adding a role allow rule, or modifying a constraint.
          The audit2why(8) utility may be used to diagnose the reason when
          it is unclear.

          Care must be exercised while acting on the output of this utility
          to ensure that the operations being permitted do not pose a
          security threat. Often it is better to define new domains and/or
          types, or make other structural changes to narrowly allow an
          optimal set of operations to succeed, as opposed to blindly
          implementing the sometimes broad changes recommended by this
          utility.   Certain permission denials are not fatal to the
          application, in which case it may be preferable to simply
          suppress logging of the denial via a 'dontaudit' rule rather than
          an 'allow' rule.


-------------------------------------------------------

::

          NOTE: These examples are for systems using the audit package. If you do
          not use the audit package, the AVC messages will be in /var/log/messages.
          Please substitute /var/log/messages for /var/log/audit/audit.log in the
          examples.

          Using audit2allow to generate module policy

          $ cat /var/log/audit/audit.log | audit2allow -m local > local.te
          $ cat local.te
          module local 1.0;

          require {
                  class file {  getattr open read };

                  type myapp_t;
                  type etc_t;
           };

          allow myapp_t etc_t:file { getattr open read };
          <review local.te and customize as desired>

          Using audit2allow to generate module policy using reference policy

          $ cat /var/log/audit/audit.log | audit2allow -R -m local > local.te
          $ cat local.te
          policy_module(local, 1.0)

          gen_require(`
                  type myapp_t;
                  type etc_t;
           };

          files_read_etc_files(myapp_t)
          <review local.te and customize as desired>

          Building module policy using Makefile

          # SELinux provides a policy devel environment under
          # /usr/share/selinux/devel including all of the shipped
          # interface files.
          # You can create a te file and compile it by executing

          $ make -f /usr/share/selinux/devel/Makefile local.pp

          # This make command will compile a local.te file in the current
          # directory. If you did not specify a "pp" file, the make file
          # will compile all "te" files in the current directory.  After
          # you compile your te file into a "pp" file, you need to install
          # it using the semodule command.

          $ semodule -i local.pp

          Building module policy manually

          # Compile the module
          $ checkmodule -M -m -o local.mod local.te

          # Create the package
          $ semodule_package -o local.pp -m local.mod

          # Load the module into the kernel
          $ semodule -i local.pp

          Using audit2allow to generate and build module policy

          $ cat /var/log/audit/audit.log | audit2allow -M local
          Generating type enforcement file: local.te

          Compiling policy: checkmodule -M -m -o local.mod local.te
          Building package: semodule_package -o local.pp -m local.mod

          ******************** IMPORTANT ***********************

          In order to load this newly created policy package into the kernel,
          you are required to execute

          semodule -i local.pp

          Using audit2allow to generate monolithic (non-module) policy

          $ cd /etc/selinux/$SELINUXTYPE/src/policy
          $ cat /var/log/audit/audit.log | audit2allow >> domains/misc/local.te
          $ cat domains/misc/local.te
          allow cupsd_config_t unconfined_t:fifo_file { getattr ioctl };
          <review domains/misc/local.te and customize as desired>
          $ make load


-----------------------------------------------------

::

          This manual page was written by Manoj Srivastava
          <srivasta@debian.org>, for the Debian GNU/Linux system. It was
          updated by Dan Walsh <dwalsh@redhat.com>

          The audit2allow utility has contributions from several people,
          including Justin R. Smith and Yuichi Nakamura.  and Dan Walsh

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

   Security Enhanced Linux       October 2010                AUDIT2ALLOW(1)

--------------

Pages that refer to this page:
`pmdaopenmetrics(1) <../man1/pmdaopenmetrics.1.html>`__

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
