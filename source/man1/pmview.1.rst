.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmview(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMAND LINE O                   |                                   |
| PTIONS <#COMMAND_LINE_OPTIONS>`__ |                                   |
| \| `WINDOW <#WINDOW>`__ \|        |                                   |
| `EXAM                             |                                   |
| INER VIEWER <#EXAMINER_VIEWER>`__ |                                   |
| \|                                |                                   |
| `METRIC                           |                                   |
|  SELECTION <#METRIC_SELECTION>`__ |                                   |
| \| `MENUS <#MENUS>`__ \|          |                                   |
| `                                 |                                   |
| TIME CONTROLS <#TIME_CONTROLS>`__ |                                   |
| \|                                |                                   |
| `SC                               |                                   |
| ALE CONTROLS <#SCALE_CONTROLS>`__ |                                   |
| \|                                |                                   |
| `TIME I                           |                                   |
| NFORMATION <#TIME_INFORMATION>`__ |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMVIEW(1)                General Commands Manual               PMVIEW(1)

NAME
-------------------------------------------------

::

          pmview - performance metrics 3D visualization back-end


---------------------------------------------------------

::

          pmview [-Cz] [-A align] [-a archive[,archive,...]]  [-c
          configfile] [-h host] [-n pmnsfile] [-O origin] [-p port] [-R
          logconfig] [-r addconfig] [-S starttime] [-t interval] [-T
          endtime] [-x version] [-Z timezone] [-geometry geometry]
          [-display display] [-name name] [-title title] [-xrm
          "resourceName: value" ...]  [other X11-args]


---------------------------------------------------------------

::

          pmview is a generalized 3D performance metrics visualization tool
          for the Performance Co-Pilot (PCP(1)).

          pmview is the base utility behind performance metrics
          visualization tools such as dkvis(1), mpvis(1), osvis(1) and
          nfsvis(1), It is also used by a range of related tools that are
          specific to optional Performance Domain Agents (PMDA) and/or PCP
          add-on products.  pmview may also be used to construct customized
          3D performance displays.

          pmview displays performance metrics as colored blocks and
          cylinders arranged on monochrome base planes. Each object may
          represent a single performance metric, or a stack of several
          performance metrics.  Since the objects are modulated by the
          value of the metric they represent, only numerical metrics may be
          visualized.  Objects representing a single metric may be
          modulated in terms of height, color, or height and color.
          Objects in a stack may only be height modulated, but the stack
          can be normalized to the maximum height.  Labels may be added to
          the scene to help identify groups of metrics.

          A configuration file (as specified by the -c option, or read from
          standard input) is used to specify the position, color, maximum
          value and labels of metrics and metric instances in the scene.
          The maximum value acts as a normalization factor and is used to
          scale the object height and/or color in proportion to the metric
          values.  Metric values which exceed the associated maximum value
          are displayed as solid white objects.  If a metric is
          unavailable, the object will have minimum height and will be
          colored grey.

          Normally, the tool operates in ``live'' mode where performance
          metrics are fetched in real-time.  The user can view metrics from
          any host running pmcd(1).  pmview can also replay archives of
          performance metrics (see pmlogger(1)) and allow the user to
          interactively control the current replay time and rate using the
          VCR paradigm.  This is particularly useful for retrospective
          comparisons and for post-mortem analysis of performance problems
          where a remote system is not accessible or a performance analyst
          is not available on-site.

          All metrics in the Performance Metrics Name Space (PMNS) with
          numeric value semantics from any number of hosts or archives may
          be visualized.  pmview examines the semantics of the metrics and
          where sensible, converts metric values to a rate before scaling.


---------------------------------------------------------------------------------

::

          The -S, -T, -O and -A options may be used to define a time window
          to restrict the samples retrieved, set an initial origin within
          the time window, or specify a ``natural'' alignment of the sample
          times; refer to PCPIntro(1) for a complete description of these
          options.

          The other available options are:

          -a archive[,archive,...]]
                 Specify an archive from which metrics can be obtained for
                 a particular host.  archive is the basename of an archive,
                 or the name of a directory conytaining archives,
                 previously created by pmlogger(1).  Multiple sets of
                 archives (separated by commas or in different -a options)
                 from different hosts may be given, but an error will occur
                 if there is more than one set of archives from the same
                 host. Any metrics that are not associated with a specific
                 host or archive in the configuration file will use the
                 first set of archives as their source.

          -C     Parse the configuration file and exit before displaying
                 the pmview window.  Any errors in the configuration file
                 are displayed.

          -c configfile
                 Load the configuration from configfile rather than
                 standard input.

          -h host
                 Fetch performance metrics from pmcd(1) on host, rather
                 than the default localhost.  Implies that pmview will run
                 in live mode, so no archives can be specified on the
                 command line or in the configuration file.  Only one -h
                 option may be given.

          -n pmnsfile
                 Normally pmview operates on the distributed Performance
                 Metrics Name Space (PMNS), however if the -n option is
                 specified an alternative local PMNS is loaded from the
                 file pmnsfile.

          -p port
                 Connect to the time controls (see pmtime(1)) on this port.
                 Used when a tool launches another tool so that they can
                 connect to the same time controls.

          -R logconfig
                 Use logconfig as the pmlogger(1) config when recording.

          -r addconfig
                 Append addconfig onto the pmlogger(1) config generated by
                 pmview when recording.

          -t interval
                 The update interval used to fetch metrics from the live or
                 archive sources.  The interval argument follows the syntax
                 described in PCPIntro(1), and in the simplest form may be
                 an unsigned integer (the implied units in this case are
                 seconds).  The default is 2.0 seconds.

          -x version
                 Use the specified version of the pmlaunch(5)
                 specification.  The versions currently supported are
                 ``1.0'' and the default version ``2.0''.

          -Z timezone
                 By default, pmview reports the time of day according to
                 the local timezone on the system where pmview is run.  The
                 -Z option changes the default timezone to timezone which
                 should be in the format of the environment variable TZ as
                 described in environ(7).

          -z     Change the reporting timezone to the local timezone at the
                 host that is the source of the performance metrics, as
                 identified via either the -h option, or the first -a
                 option.

          -geometry geometry
          -display display
          -name name
          -title title
          -xrm "resourceName: value"

                 Most standard X(1) command line arguments may be used.


-----------------------------------------------------

::

          The pmview window is comprised of a menu bar, time and scale
          controls, metric and time values, and an ``examiner'' viewer (see
          ivview(1)), which displays the 3D scene.


-----------------------------------------------------------------------

::

          The left, right and bottom edges of the examiner viewer contain a
          variety of thumb wheels and buttons that can be used to adjust
          the visualization of the 3D scene.  The Rotx and Roty thumb
          wheels allow the user to rotate the scene about the x and y axes,
          respectively.  The dolly thumb wheel moves the virtual camera
          closer and further from the scene allowing the user to examine
          specific parts in detail or view the entire scene.  On the right
          edge of the viewer are eight buttons which affect the way the
          user can interact with the scene.

          Pointer
              Changes the cursor to a pointer which allows blocks to be
              selected in the scene.  See the Metric Selection section
              below.

          Hand
              Changes the cursor to a hand which allows the scene to be
              rotated, translated and dollied using a combination of mouse
              buttons.  The left mouse button can be used to rotate the
              scene in the direction of the mouse.  Releasing the left
              mouse button before the mouse has stopped moving will cause
              the scene to continue to rotate, which can be stopped by
              pressing the left mouse button again.  The middle mouse
              button will ``pan'' the scene, and both mouse buttons act as
              a dolly for the virtual camera.

          Question Mark
              Displays the SGI Help information for the examiner viewer.

          Home
              Changes the scene back to its original position, unless the
              home position has been changed by the home pointer button.

          Home Pointer
              Changes the home position of the scene to be the scene
              currently in view.

          Eye Resizes the scene so that it completely fits into the 3D
              viewing area.

          Cross-hairs
              Moves the object under the cursor to the center of the
              viewing area, if the hand cursor has been selected.  Pressing
              the ``s'' key while the cursor is over an object has the same
              effect.

          Perspective Box
              Switches the display between perspective and orthogonal
              projections.

          Pressing the right mouse button within the scene window will
          bring up a menu of options which affect how the 3D scene is
          drawn.  The options include drawing the blocks as wire frames,
          and turning on stereo viewing.


-------------------------------------------------------------------------

::

          When the pointer cursor is active, more information about the 3D
          scene can be obtained.  Text describing the metric represented by
          the block under the cursor will be displayed in the top text box
          of the pmview window.  The text contains the source and name of
          the metric, current value and units, and the percentage of the
          expected maximum (or normalization) value.  The text box is
          updated whenever the scene is updated with the latest metric
          values or when the cursor is moved over another block in the
          scene.  Moving the cursor over a base plane block, text or the
          surrounding space will clear the text box.

          Clicking the left mouse button on a block will bind the text box
          on that metric instance so that the metric can be monitored while
          performing other actions with the mouse.  The block will be
          highlighted with a red wire frame.  Clicking the left mouse
          button on text or the space surrounding the scene will unselect
          the object, causing the text box to revert to the original
          behavior of showing the metric underneath the cursor.

          Selecting a base plane instead of a modulated block will cause
          all the blocks on that base plane to be selected.  When more than
          one object is selected, the text box behaves as if nothing is
          selected, so the metric displayed is the metric currently under
          the cursor.  Multiple selections are also possible by pressing
          the SHIFT key while selecting an object with the left mouse
          button.


---------------------------------------------------

::

          There are four menus in pmview's user interface which allow
          scenes to be recorded, saved and printed (File), access to the
          time controls (Options), launching other tools (Launch) and
          online help (Help).

          File/Record
              When in ``live'' mode, this option will launch pmlogger(1)
              processes to record the current scene into an archive folio
              (see pmafm(1)) so that it may be replayed at a later time.
              This option is not available in ``replay'' mode.

              When File/Record is selected, a file chooser dialog will
              prompt for the name of the new archive folio.  If the
              directory to the folio does not exist, pmview will attempt to
              create it.  It is usually convenient to keep each folio
              within its own directory as there will be several other files
              associated with the folio, including the generated archives.

              Once a valid folio has been created, pmview will launch a
              pmlogger(1) process for each host to collect the metrics
              required from that host in the current scene.  The current
              selections do not affect the set of metrics that are
              recorded.

              While recording is in progress, a red dot will appear in the
              time controls button in the top left-hand corner of the
              pmview window.  The File/Record option will also change to
              File/Stop Recording as only one recording session is possible
              at any one time.  Selecting blocks or launching other tools
              will have no affect on the recording session.

              The record session may be terminated by selecting File/Stop
              Recording.  This will display dialogs for each pmlogger(1)
              instance describing the size and location of the archive
              files before terminating each process.  When all pmlogger(1)
              processes have been terminated, the red dot is removed from
              the time controls button, and the menu reverts back to
              File/Record to allow another recording session to take place.

              If the application exists while recording, a dialog will
              appear allowing you to terminate each pmlogger(1) process, or
              leave it running unattached.

              An archive folio may be replayed using the command: ``pmafm
              folio replay''.  See pmafm(1) for more details.

              It is not uncommon for a front-end script which generates a
              pmview scene to use metrics that are not contained in the
              scene.  For example, osvis(1) uses several hinv metrics to
              determine the size and layout of some objects.  As these
              metrics are also needed when replaying the generated archive
              with the front-end script, a complete pmlogger(1) config can
              be specified (-R) that overrides the pmview generated config,
              or an additional config can be appended (-r) to the pmview
              generated config.

          File/Save
              Saves the current scene to a human-readable Open Inventor
              file (see inventor(1)).  A file dialog will prompt for the
              location of the file.  The default file extension is ``.iv''
              which is recognized by ivview(1) and some Web browsers.

          File/Print
              Outputs the current scene to a printer.  A print dialog will
              be displayed allowing a specific printer to be selected.

          File/Quit
              pmview immediately exits.  If recording was active, dialogs
              will be displayed for each pmlogger(1) process so that they
              may be terminated.

          Options/Show Time Control
              Displays the time controls (see pmtime(1)) that are driving
              this instance of pmview.  The time controls may be shared by
              other tools, including pmchart(1), that have been launched by
              other instances of pmview and oview(1).  Therefore, this menu
              item may appear to have no affect if the time controls are
              already visible.

          Options/New Time Control
              Disconnect with the current time controls (which may be
              shared by other tools, see pmtime(1)) and use a new time
              control that is not connected to any other tools.  The new
              time control will be immediately displayed.

          Launch
              The launch menu is generated from a menu specification file
              (see pmlaunch(5)).  The menu contains tools that may be
              launched based on the sources and names of the selected
              metrics in the scene.  For example, if the selected metrics
              are from three different hosts, then three copies of a tool
              may be launched, one for each host.  The behavior of a launch
              depends on the selected metrics and the tools being launched.

              On selection of a Launch menu item pmview generates state
              information in the pmlaunch(5) metrics specification format.
              This provides a description of the selected metrics (or if
              there are no selections, all the metrics) in the scene
              without any geometry information.

              Tools which can monitor multiple hosts and user specified
              metrics may be launched only once for those metrics (eg
              pmdumptext(1)).  Other tools which have a fixed view for one
              host (eg mpvis(1)), may be launched multiple times, once for
              each host in the selected metric list.  If the launched tools
              have time controls, they will share the time controls with
              the launching pmview.

              The set of launched tools is configurable, and may include
              IRIX and user applications.  See pmlaunch(5) for more
              details.

          Help/...
              If pcp.books.help has been installed, then the insight(1)
              books for pmview are displayed.


-------------------------------------------------------------------

::

          In addition to the menu options for time controls, the current
          direction of the time controls (see pmtime(1)) is shown in a
          button in the top-left corner of the pmview window.  Pressing
          this button will display the time control and is identical in
          behavior to Options/Show Time Control.


---------------------------------------------------------------------

::

          Above the examiner window is a thumb wheel and an editable text
          box which allow the user to apply a multiplier to all values
          represented in the scene.  Spinning the wheel to the right and/or
          increasing the text value for the scale will increase the height
          of the bars.  Spinning the wheel to the left and/or lowering the
          text value will decrease the height of the bars.  The button to
          the right of the thumb wheel will reset the scale so that the
          bars appear at the original height for their current value.


-------------------------------------------------------------------------

::

          Beside the scale controls is another text box which displays the
          time of the fetched metrics.  The time will change with the time
          controller (see pmtime(1)).


---------------------------------------------------------------

::

          Are intended to be self-explanatory.  The environment variable
          PCP_STDERR can be set to force most startup warnings and errors
          to be sent to the standard error stream rather than posted in a
          dialog.


---------------------------------------------------

::

          $PCP_VAR_DIR/pmns/*
               default PMNS specification files

          $PCP_VAR_DIR/config/pmlaunch/pmlaunchrc
               menu specification file - provides a mapping between menu
               item and launched program

          $HOME/.pcp/pmlaunch/pmlaunchrc
               individual users menu specification

          /usr/lib/X11/app-defaults/PmView
               application resources

          /usr/lib/images/PmView.icon
               icon for pmview

          $PCP_SHARE_DIR/lib/pmview-args
               shell procedures for parsing pmview command line options in
               front end scripts

          /usr/lib/DPS/outline/base/
               directory where Inventor normally looks for the outlines of
               Type1 fonts.


---------------------------------------------------------------

::

          The default face of the 3D font in the pmview window can be
          altered via PMVIEW_FONT environment variable which can be set to
          the base name of a Type1 font file in the default Inventor fonts
          directory.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).


---------------------------------------------------------

::

          dkvis(1), insight(1), inventor(1), ivview(1), mpvis(1),
          nfsvis(1), osvis(1), oview(1), pcp(1), PCPIntro(1), pmafm(1),
          pmcd(1), pmchart(1), pmdumptext(1), pmlogger(1), pmtime(1),
          pmview(1), X(1), xconfirm(1), xlv_vis(1), pcp.conf(5), pmview(5),
          environ(7) and pmlaunch(5).

          Relevant information is also available from the on-line PCP
          Tutorial.

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot                                           PMVIEW(1)

--------------

Pages that refer to this page: `mkaf(1) <../man1/mkaf.1.html>`__, 
`pmdaweblog(1) <../man1/pmdaweblog.1.html>`__, 
`pmview(1) <../man1/pmview.1.html>`__, 
`pmview(5) <../man5/pmview.5.html>`__

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
