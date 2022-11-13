.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-calibrate(1) — Linux manual page
======================================

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

   LTTNG-CALIBRATE(1)            LTTng Manual            LTTNG-CALIBRATE(1)

NAME
-------------------------------------------------

::

          lttng-calibrate - Quantify LTTng overhead


---------------------------------------------------------

::

          lttng [GENERAL OPTIONS] calibrate


---------------------------------------------------------------

::

          The lttng calibrate commands quantifies the overhead of LTTng
          tracers.

          The lttng calibrate command can be used to find out the combined
          average overhead of the LTTng tracers and the instrumentation
          mechanisms used. This overhead can be calibrated in terms of time
          or using any of the PMU performance counter available on the
          system.

          For now, the only implemented calibration is the Linux kernel
          function instrumentation (kretprobes).

      Calibrate Linux kernel function instrumentation
          As an example, we use an i7 processor with 4 general-purpose PMU
          registers. This information is available by issuing dmesg,
          looking for generic registers.

          The following sequence of commands gathers a trace executing a
          kretprobe hooked on an empty function, gathering PMU counters LLC
          (Last Level Cache) misses information (use lttng add-context
          --list to get the list of available PMU counters).

              lttng create calibrate-function
              lttng enable-event calibrate --kernel \
                                           --function=lttng_calibrate_kretprobe
              lttng add-context --kernel --type=perf:cpu:LLC-load-misses \
                                         --type=perf:cpu:LLC-store-misses \
                                         --type=perf:cpu:LLC-prefetch-misses
              lttng start

              for a in $(seq 1 10); do
                  lttng calibrate --kernel --function
              done

              lttng destroy
              babeltrace $(ls -1drt ~/lttng-traces/calibrate-function-* | tail -n 1)

          The output from babeltrace(1) can be saved to a text file and
          opened in a spreadsheet (for example, in LibreOffice) to focus on
          the per-PMU counter delta between consecutive calibrate_entry and
          calibrate_return events. Note that these counters are per-CPU, so
          scheduling events would need to be present to account for
          migration between CPUs. Therefore, for calibration purposes, only
          events staying on the same CPU must be considered.

          Here’s an example of the average result, for the i7, on 10
          samples:

          ┌─────────────────────────┬─────────┬────────────────────┐
          │PMU counter              │ Average │ Standard deviation │
          ├─────────────────────────┼─────────┼────────────────────┤
          │                         │         │                    │
          │perf_LLC_load_misses     │ 5.0     │ 0.577              │
          ├─────────────────────────┼─────────┼────────────────────┤
          │                         │         │                    │
          │perf_LLC_store_misses    │ 1.6     │ 0.516              │
          ├─────────────────────────┼─────────┼────────────────────┤
          │                         │         │                    │
          │perf_LLC_prefetch_misses │ 9.0     │ 14.742             │
          └─────────────────────────┴─────────┴────────────────────┘

          As we can notice, the load and store misses are relatively stable
          across runs (their standard deviation is relatively low) compared
          to the prefetch misses. We could conclude from this information
          that LLC load and store misses can be accounted for quite
          precisely, but prefetches within a function seems to behave too
          erratically (not much causality link between the code executed
          and the CPU prefetch activity) to be accounted for.


-------------------------------------------------------

::

          General options are described in lttng(1).

      Domain
          One of:

          -k, --kernel
              Quantify LTTng overhead in the Linux kernel domain.

          -u, --userspace
              Quantify LTTng overhead in the user space domain.

      Calibration
          --function
              Use dynamic function entry/return probes to calibrate
              (default).

              This option requires the --kernel option.

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

          •   LTTng project website <http://lttng.org>

          •   LTTng documentation <http://lttng.org/docs>

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

          lttng(1)

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

   LTTng 2.9.0-pre                10/04/2016             LTTNG-CALIBRATE(1)

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
