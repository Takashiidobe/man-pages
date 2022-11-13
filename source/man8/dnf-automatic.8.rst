.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dnf-automatic(8) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RUN DNF-                         |                                   |
| AUTOMATIC <#RUN_DNF-AUTOMATIC>`__ |                                   |
| \|                                |                                   |
| `CONFIGURATION FILE FORMA         |                                   |
| T <#CONFIGURATION_FILE_FORMAT>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DNF-AUTOMATIC(8)                   DNF                  DNF-AUTOMATIC(8)

NAME
-------------------------------------------------

::

          dnf-automatic - DNF Automatic


---------------------------------------------------------

::

          dnf-automatic [<config file>]


---------------------------------------------------------------

::

          Alternative CLI to dnf upgrade with specific facilities to make
          it suitable to be executed automatically and regularly from
          systemd timers, cron jobs and similar.

          The operation of the tool is usually controlled by the
          configuration file or the function-specific timer units (see
          below). The command only accepts a single optional argument
          pointing to the config file, and some control arguments intended
          for use by the services that back the timer units. If no
          configuration file is passed from the command line,
          /etc/dnf/automatic.conf is used.

          The tool synchronizes package metadata as needed and then checks
          for updates available for the given system and then either exits,
          downloads the packages or downloads and applies the packages. The
          outcome of the operation is then reported by a selected
          mechanism, for instance via the standard output, email or MOTD
          messages.

          The systemd timer unit dnf-automatic.timer will behave as the
          configuration file specifies (see below) with regard to whether
          to download and apply updates. Some other timer units are
          provided which override the configuration file with some standard
          behaviours:

          • dnf-automatic-notifyonly

          • dnf-automatic-download

          • dnf-automatic-install

          Regardless of the configuration file settings, the first will
          only notify of available updates. The second will download, but
          not install them. The third will download and install them.


---------------------------------------------------------------------------

::

          You can select one that most closely fits your needs, customize
          /etc/dnf/automatic.conf for any specific behaviors, and enable
          the timer unit.

          For example: systemctl enable --now
          dnf-automatic-notifyonly.timer


-------------------------------------------------------------------------------------------

::

          The configuration file is separated into topical sections.

      [commands] section
          Setting the mode of operation of the program.

          apply_updates
                 boolean, default: False

                 Whether packages comprising the available updates should
                 be applied by dnf-automatic.timer, i.e. installed via RPM.
                 Implies download_updates. Note that if this is set to
                 False, downloaded packages will be left in the cache till
                 the next successful DNF transaction. Note that the other
                 timer units override this setting.

          download_updates
                 boolean, default: False

                 Whether packages comprising the available updates should
                 be downloaded by dnf-automatic.timer. Note that the other
                 timer units override this setting.

          network_online_timeout
                 time in seconds, default: 60

                 Maximal time dnf-automatic will wait until the system is
                 online. 0 means that network availability detection will
                 be skipped.

          random_sleep
                 time in seconds, default: 0

                 Maximal random delay before downloading.  Note that, by
                 default, the systemd timers also apply a random delay of
                 up to 1 hour.

          upgrade_type
                 either one of default, security, default: default

                 What kind of upgrades to look at. default signals looking
                 for all available updates, security only those with an
                 issued security advisory.

      [emitters] section
          Choosing how the results should be reported.

          emit_via
                 list, default: email, stdio, motd

                 List of emitters to report the results through. Available
                 emitters are stdio to print the result to standard output,
                 command to send the result to a custom command,
                 command_email to send an email using a command, and email
                 to send the report via email and motd sends the result to
                 /etc/motd file.

          system_name
                 string, default: hostname of the given system

                 How the system is called in the reports.

      [command] section
          The command emitter configuration. Variables usable in format
          string arguments are body with the message body.

          command_format
                 format string, default: cat

                 The shell command to execute.

          stdin_format
                 format string, default: {body}

                 The data to pass to the command on stdin.

      [command_email] section
          The command email emitter configuration. Variables usable in
          format string arguments are body with message body, subject with
          email subject, email_from with the “From:” address and email_to
          with a space-separated list of recipients.

          command_format
                 format string, default: mail -Ssendwait -s {subject} -r
                 {email_from} {email_to}

                 The shell command to execute.

          email_from
                 string, default: root

                 Message’s “From:” address.

          email_to
                 list, default: root

                 List of recipients of the message.

          stdin_format
                 format string, default: {body}

                 The data to pass to the command on stdin.

      [email] section
          The email emitter configuration.

          email_from
                 string, default: root

                 Message’s “From:” address.

          email_host
                 string, default: localhost

                 Hostname of the SMTP server used to send the message.

          email_to
                 list, default: root

                 List of recipients of the message.

      [base] section
          Can be used to override settings from DNF’s main configuration
          file. See conf_ref.


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

   4.8.0                         Aug 27, 2021              DNF-AUTOMATIC(8)

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
