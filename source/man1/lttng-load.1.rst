.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-load(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `RESOURCES <#RESOURCES>`__ \|     |                                   |
| `COPYRIGHTS <#COPYRIGHTS>`__ \|   |                                   |
| `THANKS <#THANKS>`__ \|           |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LTTNG-LOAD(1)                 LTTng Manual                 LTTNG-LOAD(1)

NAME
-------------------------------------------------

::

          lttng-load - Load LTTng tracing session configurations


---------------------------------------------------------

::

          lttng [GENERAL OPTIONS] load [--force] [--input-path=PATH]
                [--override-url=URL] [SESSION [--override-name=NAME]]


---------------------------------------------------------------

::

          The lttng load command loads the configurations of one or more
          tracing sessions from files.

          The lttng load command is used in conjunction with the
          lttng-save(1) command to save and restore the complete
          configurations of tracing sessions. This includes the enabled
          channels and event rules, the context added to channels, the
          tracing activity, and more.

          Once one or more tracing session configurations are loaded, they
          appear exactly as they were saved from the user’s point of view.

          The following directories are searched, non-recursively, in this
          order for configuration files:

           1. $LTTNG_HOME/.lttng/sessions ($LTTNG_HOME defaults to $HOME)

           2. /usr/local/etc/lttng/sessions

          The input path can be overridden with the --input-path option.
          When this option is specified, the default directories are NOT
          searched for configuration files. When it’s not specified, both
          default directories are searched for configuration files.

          If the input path is a directory, then:

          •   If SESSION is specified, the tracing session configuration
              named SESSION is searched for in all the files of this
              directory and loaded if found.

          •   If SESSION is not specified, the --all option is implicit:
              all the tracing session configurations found in all the files
              in this directory are loaded.

          If the input path is a file, then:

          •   If SESSION is specified, the tracing session configuration
              named SESSION is searched for in this file and loaded if
              found.

          •   If SESSION is not specified, the --all option is implicit:
              all the tracing session configurations found in this file are
              loaded.

          Aspects of the loaded configurations can be overridden at load
          time using the --override-url and --override-name options.

          By default, existing tracing sessions are not overwritten when
          loading: the command fails. The --force option can be used to
          allow this.


-------------------------------------------------------

::

          General options are described in lttng(1).

          -a, --all
              Load all tracing session configurations (default).

          -f, --force
              Overwrite existing tracing sessions when loading.

          -i PATH, --input-path=PATH
              Load tracing session configurations from PATH, either a
              directory or a file, instead of loading them from the default
              search directories.

          --override-name=NAME
              Override the name of the loaded tracing session
              configuration, SESSION, with NAME.

              You must specify a tracing session name to load (SESSION) and
              NOT use the --all option when using this option.

          --override-url=URL
              Override the URL of the loaded tracing session configurations
              with URL.

              This is the equivalent of the --set-url option of
              lttng-create(1). The validity of the URL override depends on
              the type of tracing session configurations to load. This
              option applies to all the loaded tracing session
              configurations.

      Program information
          -h, --help
              Show command help.

              This option, like lttng-help(1), attempts to launch
              /usr/bin/man to view the command’s man page. The path to the
              man pager can be overridden by the LTTNG_MAN_BIN_PATH
              environment variable.

          --list-options
              List available command options.


-----------------------------------------------------------------------------------

::

          LTTNG_ABORT_ON_ERROR
              Set to 1 to abort the process after the first error is
              encountered.

          LTTNG_HOME
              Overrides the $HOME environment variable. Useful when the
              user running the commands has a non-writable home directory.

          LTTNG_MAN_BIN_PATH
              Absolute path to the man pager to use for viewing help
              information about LTTng commands (using lttng-help(1) or
              lttng COMMAND --help).

          LTTNG_SESSION_CONFIG_XSD_PATH
              Path in which the session.xsd session configuration XML
              schema may be found.

          LTTNG_SESSIOND_PATH
              Full session daemon binary path.

              The --sessiond-path option has precedence over this
              environment variable.

          Note that the lttng-create(1) command can spawn an LTTng session
          daemon automatically if none is running. See lttng-sessiond(8)
          for the environment variables influencing the execution of the
          session daemon.


---------------------------------------------------

::

          $LTTNG_HOME/.lttngrc
              User LTTng runtime configuration.

              This is where the per-user current tracing session is stored
              between executions of lttng(1). The current tracing session
              can be set with lttng-set-session(1). See lttng-create(1) for
              more information about tracing sessions.

          $LTTNG_HOME/lttng-traces
              Default output directory of LTTng traces. This can be
              overridden with the --output option of the lttng-create(1)
              command.

          $LTTNG_HOME/.lttng
              User LTTng runtime and configuration directory.

          $LTTNG_HOME/.lttng/sessions
              Default location of saved user tracing sessions (see
              lttng-save(1) and lttng-load(1)).

          /usr/local/etc/lttng/sessions
              System-wide location of saved tracing sessions (see
              lttng-save(1) and lttng-load(1)).

              Note
              $LTTNG_HOME defaults to $HOME when not explicitly set.


---------------------------------------------------------------

::

          0
              Success

          1
              Command error

          2
              Undefined command

          3
              Fatal error

          4
              Command warning (something went wrong during the command)


-------------------------------------------------

::

          If you encounter any issue or usability problem, please report it
          on the LTTng bug tracker <https://bugs.lttng.org/projects/lttng-
          tools>.


-----------------------------------------------------------

::

          •   LTTng project website <https://lttng.org>

          •   LTTng documentation <https://lttng.org/docs>

          •   Git repositories <http://git.lttng.org>

          •   GitHub organization <http://github.com/lttng>

          •   Continuous integration <http://ci.lttng.org/>

          •   Mailing list <http://lists.lttng.org> for support and
              development: lttng-dev@lists.lttng.org

          •   IRC channel <irc://irc.oftc.net/lttng>: #lttng on
              irc.oftc.net


-------------------------------------------------------------

::

          This program is part of the LTTng-tools project.

          LTTng-tools is distributed under the GNU General Public License
          version 2 <http://www.gnu.org/licenses/old-
          licenses/gpl-2.0.en.html>. See the LICENSE
          <https://github.com/lttng/lttng-tools/blob/master/LICENSE> file
          for details.


-----------------------------------------------------

::

          Special thanks to Michel Dagenais and the DORSAL laboratory
          <http://www.dorsal.polymtl.ca/> at École Polytechnique de
          Montréal for the LTTng journey.

          Also thanks to the Ericsson teams working on tracing which helped
          us greatly with detailed bug reports and unusual test cases.


-------------------------------------------------------

::

          LTTng-tools was originally written by Mathieu Desnoyers, Julien
          Desfossez, and David Goulet. More people have since contributed
          to it.

          LTTng-tools is currently maintained by Jérémie Galarneau
          <mailto:jeremie.galarneau@efficios.com>.


---------------------------------------------------------

::

          lttng-save(1), lttng(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the LTTng-Tools (    LTTng tools) project.
          Information about the project can be found at 
          ⟨http://lttng.org/⟩.  It is not known how to report bugs for this
          man page; if you know, please send a mail to man-pages@man7.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.lttng.org/lttng-tools.git⟩ on 2019-11-19.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2019-11-14.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   LTTng 2.12.0-pre               10/29/2018                  LTTNG-LOAD(1)

--------------

Pages that refer to this page: `lttng(1) <../man1/lttng.1.html>`__, 
`lttng-add-context(1) <../man1/lttng-add-context.1.html>`__, 
`lttng-calibrate(1) <../man1/lttng-calibrate.1.html>`__, 
`lttng-create(1) <../man1/lttng-create.1.html>`__, 
`lttng-destroy(1) <../man1/lttng-destroy.1.html>`__, 
`lttng-disable-channel(1) <../man1/lttng-disable-channel.1.html>`__, 
`lttng-disable-event(1) <../man1/lttng-disable-event.1.html>`__, 
`lttng-disable-rotation(1) <../man1/lttng-disable-rotation.1.html>`__, 
`lttng-enable-channel(1) <../man1/lttng-enable-channel.1.html>`__, 
`lttng-enable-event(1) <../man1/lttng-enable-event.1.html>`__, 
`lttng-enable-rotation(1) <../man1/lttng-enable-rotation.1.html>`__, 
`lttng-help(1) <../man1/lttng-help.1.html>`__, 
`lttng-list(1) <../man1/lttng-list.1.html>`__, 
`lttng-load(1) <../man1/lttng-load.1.html>`__, 
`lttng-metadata(1) <../man1/lttng-metadata.1.html>`__, 
`lttng-regenerate(1) <../man1/lttng-regenerate.1.html>`__, 
`lttng-rotate(1) <../man1/lttng-rotate.1.html>`__, 
`lttng-save(1) <../man1/lttng-save.1.html>`__, 
`lttng-set-session(1) <../man1/lttng-set-session.1.html>`__, 
`lttng-snapshot(1) <../man1/lttng-snapshot.1.html>`__, 
`lttng-start(1) <../man1/lttng-start.1.html>`__, 
`lttng-status(1) <../man1/lttng-status.1.html>`__, 
`lttng-stop(1) <../man1/lttng-stop.1.html>`__, 
`lttng-track(1) <../man1/lttng-track.1.html>`__, 
`lttng-untrack(1) <../man1/lttng-untrack.1.html>`__, 
`lttng-version(1) <../man1/lttng-version.1.html>`__, 
`lttng-view(1) <../man1/lttng-view.1.html>`__, 
`lttng-sessiond(8) <../man8/lttng-sessiond.8.html>`__

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
