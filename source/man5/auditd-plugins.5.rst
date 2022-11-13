.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

auditd-plugins(5) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUDITD-PLUGINS(5)    System Administration Utilities   AUDITD-PLUGINS(5)

NAME
-------------------------------------------------

::

          auditd-plugins - realtime event receivers


---------------------------------------------------------------

::

          auditd can multiplex audit events in realtime. It takes audit
          events and distributes them to child programs that want to
          analyze events in realtime. When the audit daemon receives a
          SIGTERM or SIGHUP, it passes that signal to its child processes
          so that can reload the configuration or terminate.

          The child programs install a configuration file in a plugins
          directory which defaults to /etc/audit/plugins.d. This can be
          controlled by a auditd.conf config option plugin_dir if the admin
          wished to locate plugins somewhere else. But auditd will install
          its plugins in the default location.

          The plugin directory will be scanned and every plugin that is
          active will be started. If the plugin has a problem and exits, it
          will be started a maximum of max_restarts times as found in
          auditd.conf.

          Config file names are not allowed to have more than one '.' in
          the name or it will be treated as a backup copy and skipped.
          Config file options are given one per line with an equal sign
          between the keyword and its value. The available options are as
          follows:

          active The options for this are yes or no.

          direction
                 The option is dictated by the plugin.  In or out are the
                 only choices. You cannot make a plugin operate in a way it
                 wasn't designed just by changing this option. This option
                 is to give a clue to the event dispatcher about which
                 direction events flow. NOTE: inbound events are not
                 supported yet.

          path   This is the absolute path to the plugin executable. In the
                 case of internal plugins, it would be the name of the
                 plugin.

          type   This tells the dispatcher how the plugin wants to be run.
                 Choices are builtin and always.  Builtin should always be
                 given for plugins that are internal to the audit event
                 dispatcher. These are af_unix and syslog. The option
                 always should be given for most if not all plugins. The
                 default setting is always.

          args   This allows you to pass arguments to the child program.
                 Generally plugins do not take arguments and have their own
                 config file that instructs them how they should be
                 configured. At the moment, there is a limit of 2 args.

          format The valid options for this are binary and string.  Binary
                 passes the data exactly as the audit event dispatcher gets
                 it from the audit daemon. The string option tells the
                 dispatcher to completely change the event into a string
                 suitable for parsing with the audit parsing library. The
                 default value is string.


---------------------------------------------------

::

          /etc/auditd/auditd.conf /etc/audit/plugins.d


---------------------------------------------------------

::

          auditd.conf(5), auditd(8).


-----------------------------------------------------

::

          Steve Grubb

COLOPHON
---------------------------------------------------------

::

          This page is part of the audit (Linux Audit) project.
          Information about the project can be found at 
          ⟨http://people.redhat.com/sgrubb/audit/⟩.  If you have a bug
          report for this manual page, send it to linux-audit@redhat.com.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/linux-audit/audit-userspace.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Red Hat                         Aug 2018               AUDITD-PLUGINS(5)

--------------

Pages that refer to this page:
`auditd.conf(5) <../man5/auditd.conf.5.html>`__, 
`auditd(8) <../man8/auditd.8.html>`__

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
