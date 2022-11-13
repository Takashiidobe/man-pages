.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

inotifywait(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OUTPUT <#OUTPUT>`__ \|           |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `EVENTS <#EVENTS>`__ \|           |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   inotifywait(1)           General Commands Manual          inotifywait(1)

NAME
-------------------------------------------------

::

          inotifywait, fsnotifywait - wait for changes to files using
          inotify or fanotify


---------------------------------------------------------

::

          inotifywait [-hcmrPq] [-e <event> ] [-t <seconds> ] [--format
          <fmt> ] [--timefmt <fmt> ] <file> [ ... ]

          fsnotifywait [-hcmrPqIFS] [-e <event> ] [-t <seconds> ] [--format
          <fmt> ] [--timefmt <fmt> ] <file> [ ... ]


---------------------------------------------------------------

::

          inotifywait efficiently waits for changes to files using Linux's
          inotify(7) interface.  It is suitable for waiting for changes to
          files from shell scripts.  It can either exit once an event
          occurs, or continually execute and output events as they occur.

          fsnotifywait is similar to inotifywait but it is using Linux's
          fanotify(7) interface by default. If explicitly sepcified, it
          uses the inotify(7) interface.


-----------------------------------------------------

::

          inotifywait and fsnotifywait will output diagnostic information
          on standard error and event information on standard output.  The
          event output can be configured, but by default it consists of
          lines of the following form:

          watched_filename EVENT_NAMES event_filename

          watched_filename
                 is the name of the file on which the event occurred.  If
                 the file is a directory, a trailing slash is output.

          EVENT_NAMES
                 are the names of the inotify events which occurred,
                 separated by commas.

          event_filename
                 is output only when the event occurred on a directory, and
                 in this case the name of the file within the directory
                 which caused this event is output.

                 By default, any special characters in filenames are not
                 escaped in any way.  This can make the output of
                 inotifywait difficult to parse in awk scripts or similar.
                 The --csv and --format options will be helpful in this
                 case.


-------------------------------------------------------

::

          -h, --help
                 Output some helpful usage information.

          @<file>
                 When watching a directory tree recursively, exclude the
                 specified file from being watched.  The file must be
                 specified with a relative or absolute path according to
                 whether a relative or absolute path is given for watched
                 directories.  If a specific path is explicitly both
                 included and excluded, it will always be watched.

                 Note: If you need to watch a directory or file whose name
                 starts with @, give the absolute path.

          --fromfile <file>
                 Read filenames to watch or exclude from a file, one
                 filename per line.  If filenames begin with @ they are
                 excluded as described above.  If <file> is `-', filenames
                 are read from standard input.  Use this option if you need
                 to watch too many files to pass in as command line
                 arguments.

          -m, --monitor
                 Instead of exiting after receiving a single event, execute
                 indefinitely.  The default behaviour is to exit after the
                 first event occurs.

          -d, --daemon
                 Same as --monitor, except run in the background logging
                 events to a file that must be specified by --outfile.
                 Implies --syslog.

          -o, --outfile <file>
                 Output events to <file> rather than stdout.

          -s, --syslog
                 Output errors to syslog(3) system log module rather than
                 stderr.

          -P, --no-dereference
                 Do not follow symlinks.

          -r, --recursive
                 Watch all subdirectories of any directories passed as
                 arguments.  Watches will be set up recursively to an
                 unlimited depth.  Symbolic links are not traversed.  Newly
                 created subdirectories will also be watched.

                 Warning: If you use this option while watching the root
                 directory of a large tree, it may take quite a while until
                 all inotify watches are established, and events will not
                 be received in this time.  Also, since one inotify watch
                 will be established per subdirectory, it is possible that
                 the maximum amount of inotify watches per user will be
                 reached.  The default maximum is 8192; it can be increased
                 by writing to /proc/sys/fs/inotify/max_user_watches.

          -q, --quiet
                 If specified once, the program will be less verbose.
                 Specifically, it will not state when it has completed
                 establishing all inotify watches.

                 If specified twice, the program will output nothing at
                 all, except in the case of fatal errors.

          --exclude <pattern>
                 Do not process any events for the subset of files whose
                 filenames match the specified POSIX regular expression,
                 case sensitive.

          --excludei <pattern>
                 Do not process any events for the subset of files whose
                 filenames match the specified POSIX regular expression,
                 case insensitive.

          --include <pattern>
                 Process events only for the subset of files whose
                 filenames match the specified POSIX regular expression,
                 case sensitive.

          --includei <pattern>
                 Process events only for the subset of files whose
                 filenames match the specified POSIX regular expression,
                 case insensitive.

          -t <seconds>, --timeout <seconds>
                 Exit if an appropriate event has not occurred within
                 <seconds> seconds. If <seconds> is zero (the default),
                 wait indefinitely for an event.

          -e <event>, --event <event>
                 Listen for specific event(s) only.  The events which can
                 be listened for are listed in the EVENTS section.  This
                 option can be specified more than once.  If omitted, all
                 events are listened for.

          -c, --csv
                 Output in CSV (comma-separated values) format.  This is
                 useful when filenames may contain spaces, since in this
                 case it is not safe to simply split the output at each
                 space character.

          --timefmt <fmt>
                 Set a time format string as accepted by strftime(3) for
                 use with the `%T' conversion in the --format option.

          --no-newline
                 Don't print newline symbol after user-specified format in
                 the --format option.

          --format <fmt>
                 Output in a user-specified format, using printf-like
                 syntax.  The event strings output are limited to around
                 4000 characters and will be truncated to this length.  The
                 following conversions are supported:

          %w     This will be replaced with the name of the Watched file on
                 which an event occurred.

          %f     When an event occurs within a directory, this will be
                 replaced with the name of the File which caused the event
                 to occur.  Otherwise, this will be replaced with an empty
                 string.

          %e     Replaced with the Event(s) which occurred, comma-
                 separated.

          %Xe    Replaced with the Event(s) which occurred, separated by
                 whichever character is in the place of `X'.

          %T     Replaced with the current Time in the format specified by
                 the --timefmt option, which should be a format string
                 suitable for passing to strftime(3).

          %0     Replaced with NUL.

          %n     Replaced with Line Feed.

      fsnotifywait
          The following additional options are available:

          -I, --inotify
                 Watch using inotify.

          -F, --fanotify
                 Watch using fanotify (default).  fanotify support for
                 reporting events with inotify compatible information was
                 added in kernel v5.9.  With older kernels the command will
                 fail.  As of kernel v5.12, fanotify requires admin
                 privileges.

          -S, --filesystem
                 Watch entire filesystem of any directories passed as
                 arguments using fanotify.


---------------------------------------------------------------

::

          0      The program executed successfully, and an event occurred
                 which was being listened for.

          1      An error occurred in execution of the program, or an event
                 occurred which was not being listened for.  The latter
                 generally occurs if something happens which forcibly
                 removes the inotify watch, such as a watched file being
                 deleted or the filesystem containing a watched file being
                 unmounted.

          2      The -t option was used and an event did not occur in the
                 specified interval of time.


-----------------------------------------------------

::

          The following events are valid for use with the -e option:

          access A watched file or a file within a watched directory was
                 read from.

          modify A watched file or a file within a watched directory was
                 written to.

          attrib The metadata of a watched file or a file within a watched
                 directory was modified.  This includes timestamps, file
                 permissions, extended attributes etc.

          close_write
                 A watched file or a file within a watched directory was
                 closed, after being opened in writeable mode.  This does
                 not necessarily imply the file was written to.

          close_nowrite
                 A watched file or a file within a watched directory was
                 closed, after being opened in read-only mode.

          close  A watched file or a file within a watched directory was
                 closed, regardless of how it was opened.  Note that this
                 is actually implemented simply by listening for both
                 close_write and close_nowrite, hence all close events
                 received will be output as one of these, not CLOSE.

          open   A watched file or a file within a watched directory was
                 opened.

          moved_to
                 A file or directory was moved into a watched directory.
                 This event occurs even if the file is simply moved from
                 and to the same directory.

          moved_from
                 A file or directory was moved from a watched directory.
                 This event occurs even if the file is simply moved from
                 and to the same directory.

          move   A file or directory was moved from or to a watched
                 directory.  Note that this is actually implemented simply
                 by listening for both moved_to and moved_from, hence all
                 move events received will be output as one or both of
                 these, not MOVE.

          move_self
                 A watched file or directory was moved. After this event,
                 the file or directory is no longer being watched.

          create A file or directory was created within a watched
                 directory.

          delete A file or directory within a watched directory was
                 deleted.

          delete_self
                 A watched file or directory was deleted.  After this event
                 the file or directory is no longer being watched.  Note
                 that this event can occur even if it is not explicitly
                 being listened for.

          unmount
                 The filesystem on which a watched file or directory
                 resides was unmounted.  After this event the file or
                 directory is no longer being watched.  Note that this
                 event can occur even if it is not explicitly being
                 listened to.


---------------------------------------------------------

::

      Example 1
          Running inotifywait at the command-line to wait for any file in
          the `test' directory to be accessed.  After running inotifywait,
          `cat test/foo' is run in a separate console.

          % inotifywait test
          Setting up watches.
          Watches established.
          test/ ACCESS foo

      Example 2
          A short shell script to efficiently wait for httpd-related log
          messages and do something appropriate.

          #!/bin/sh
          while ! inotifywait -e modify /var/log/messages; do
            if tail -n1 /var/log/messages | grep httpd; then
              kdialog --msgbox "Apache needs love!"
            fi
          done

      Example 3
          A custom output format is used to watch `~/test'.  Meanwhile,
          someone runs `touch ~/test/badfile; touch ~/test/goodfile; rm
          ~/test/badfile' in another console.

          % inotifywait -m -r --format '%:e %f' ~/test
          Setting up watches.  Beware: since -r was given, this may take a while!
          Watches established.
          CREATE badfile
          OPEN badfile
          ATTRIB badfile
          CLOSE_WRITE:CLOSE badfile
          CREATE goodfile
          OPEN goodfile
          ATTRIB goodfile
          CLOSE_WRITE:CLOSE goodfile
          DELETE badfile

      Example 4
          Enforce file permissions in directory `~/test'

          inotifywait -qmr -e 'moved_to,create' --format '%w%f%0' --no-newline ~/test |\
              while IFS= read -r -d '' file
              do
                 chmod -v a+rX "$file"
              done


-------------------------------------------------------

::

          When using inotifywait, the filename that is outputted is not
          guaranteed to be up to date after a move because it is the inode
          that is being monitored. Additionally, none of the observed
          operations are guaranteed to have been performed on the filename
          inotifywait was instructed to monitor in cases when the file is
          known by several names in the filesystem.


-------------------------------------------------

::

          There are race conditions in the recursive directory watching
          code which can cause events to be missed if they occur in a
          directory immediately after that directory is created.  This is
          probably not fixable.

          It is assumed the inotify event queue will never overflow.


-------------------------------------------------------

::

          inotifywait was started by Rohan McGovern, and is currently
          maintained by Eric Curtin and Radu Voicilas.
          https://www.openhub.net/p/inotify-tools/contributors/summary
          gives you a more complete list of contributors.

          inotifywait is part of inotify-tools.  The inotify-tools website
          is located at:
          https://github.com/inotify-tools/inotify-tools/wiki 


---------------------------------------------------------

::

          inotifywatch(1), strftime(3), inotify(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of the inotify-tools (command-line programs
          providing a simple interface to inotify) project.  Information
          about the project can be found at 
          ⟨https://github.com/rvoicilas/inotify-tools/wiki⟩.  If you have a
          bug report for this manual page, send it to
          inotify-tools-general@lists.sourceforge.net.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/rvoicilas/inotify-tools.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-07-12.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   inotifywait 3.20.11.0          2020-05-16                 inotifywait(1)

--------------

Pages that refer to this page:
`inotifywatch(1) <../man1/inotifywatch.1.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__

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
