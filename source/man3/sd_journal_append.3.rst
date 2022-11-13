.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_journal_get_fd(3) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| SIGNAL SAFETY <#SIGNAL_SAFETY>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_JOURNAL_GET_FD(3)        sd_journal_get_fd       SD_JOURNAL_GET_FD(3)

NAME
-------------------------------------------------

::

          sd_journal_get_fd, sd_journal_get_events, sd_journal_get_timeout,
          sd_journal_process, sd_journal_wait, sd_journal_reliable_fd,
          SD_JOURNAL_NOP, SD_JOURNAL_APPEND, SD_JOURNAL_INVALIDATE -
          Journal change notification interface


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          int sd_journal_get_fd(sd_journal *j);

          int sd_journal_get_events(sd_journal *j);

          int sd_journal_get_timeout(sd_journal *j,
                                     uint64_t *timeout_usec);

          int sd_journal_process(sd_journal *j);

          int sd_journal_wait(sd_journal *j, uint64_t timeout_usec);

          int sd_journal_reliable_fd(sd_journal *j);


---------------------------------------------------------------

::

          sd_journal_get_fd() returns a file descriptor that may be
          asynchronously polled in an external event loop and is signaled
          as soon as the journal changes, because new entries or files were
          added, rotation took place, or files have been deleted, and
          similar. The file descriptor is suitable for usage in poll(2).
          Use sd_journal_get_events() for an events mask to watch for. The
          call takes one argument: the journal context object. Note that
          not all file systems are capable of generating the necessary
          events for wakeups from this file descriptor for changes to be
          noticed immediately. In particular network files systems do not
          generate suitable file change events in all cases. Cases like
          this can be detected with sd_journal_reliable_fd(), below.
          sd_journal_get_timeout() will ensure in these cases that wake-ups
          happen frequently enough for changes to be noticed, although with
          a certain latency.

          sd_journal_get_events() will return the poll() mask to wait for.
          This function will return a combination of POLLIN and POLLOUT and
          similar to fill into the ".events" field of struct pollfd.

          sd_journal_get_timeout() will return a timeout value for usage in
          poll(). This returns a value in microseconds since the epoch of
          CLOCK_MONOTONIC for timing out poll() in timeout_usec. See
          clock_gettime(2) for details about CLOCK_MONOTONIC. If there is
          no timeout to wait for, this will fill in (uint64_t) -1 instead.
          Note that poll() takes a relative timeout in milliseconds rather
          than an absolute timeout in microseconds. To convert the absolute
          'us' timeout into relative 'ms', use code like the following:

              uint64_t t;
              int msec;
              sd_journal_get_timeout(m, &t);
              if (t == (uint64_t) -1)
                msec = -1;
              else {
                struct timespec ts;
                uint64_t n;
                clock_gettime(CLOCK_MONOTONIC, &ts);
                n = (uint64_t) ts.tv_sec * 1000000 + ts.tv_nsec / 1000;
                msec = t > n ? (int) ((t - n + 999) / 1000) : 0;
              }

          The code above does not do any error checking for brevity's sake.
          The calculated msec integer can be passed directly as poll()'s
          timeout parameter.

          After each poll() wake-up sd_journal_process() needs to be called
          to process events. This call will also indicate what kind of
          change has been detected (see below; note that spurious wake-ups
          are possible).

          A synchronous alternative for using sd_journal_get_fd(),
          sd_journal_get_events(), sd_journal_get_timeout() and
          sd_journal_process() is sd_journal_wait(). It will synchronously
          wait until the journal gets changed. The maximum time this call
          sleeps may be controlled with the timeout_usec parameter. Pass
          (uint64_t) -1 to wait indefinitely. Internally this call simply
          combines sd_journal_get_fd(), sd_journal_get_events(),
          sd_journal_get_timeout(), poll() and sd_journal_process() into
          one.

          sd_journal_reliable_fd() may be used to check whether the wake-up
          events from the file descriptor returned by sd_journal_get_fd()
          are known to be quickly triggered. On certain file systems where
          file change events from the OS are not available (such as NFS)
          changes need to be polled for repeatedly, and hence are detected
          only with a considerable latency. This call will return a
          positive value if the journal changes are detected quickly and
          zero when they need to be polled for. Note that there is usually
          no need to invoke this function directly as
          sd_journal_get_timeout() will request appropriate timeouts
          anyway.

          Note that all of the above change notification interfaces do not
          report changes instantly. Latencies are introduced for multiple
          reasons: as mentioned certain storage backends require time-based
          polling, in other cases wake-ups are optimized by coalescing
          events, and the OS introduces additional IO/CPU scheduling
          latencies.


-----------------------------------------------------------------

::

          sd_journal_get_fd() returns a valid file descriptor on success or
          a negative errno-style error code.

          sd_journal_get_events() returns a combination of POLLIN, POLLOUT
          and suchlike on success or a negative errno-style error code.

          sd_journal_reliable_fd() returns a positive integer if the file
          descriptor returned by sd_journal_get_fd() will generate wake-ups
          immediately for all journal changes. Returns 0 if there might be
          a latency involved.

          sd_journal_process() and sd_journal_wait() return a negative
          errno-style error code, or one of SD_JOURNAL_NOP,
          SD_JOURNAL_APPEND or SD_JOURNAL_INVALIDATE on success:

          •   If SD_JOURNAL_NOP is returned, the journal did not change
              since the last invocation.

          •   If SD_JOURNAL_APPEND is returned, new entries have been
              appended to the end of the journal. In this case it is
              sufficient to simply continue reading at the previous end
              location of the journal, to read the newly added entries.

          •   If SD_JOURNAL_INVALIDATE, journal files were added to or
              removed from the set of journal files watched (e.g. due to
              rotation or vacuuming), and thus entries might have appeared
              or disappeared at arbitrary places in the log stream,
              possibly before or after the previous end of the log stream.
              If SD_JOURNAL_INVALIDATE is returned, live-view UIs that want
              to reflect on screen the precise state of the log data on
              disk should probably refresh their entire display (relative
              to the cursor of the log entry on the top of the screen).
              Programs only interested in a strictly sequential stream of
              log data may treat SD_JOURNAL_INVALIDATE the same way as
              SD_JOURNAL_APPEND, thus ignoring any changes to the log view
              earlier than the old end of the log stream.


-------------------------------------------------------------------

::

          In general, sd_journal_get_fd(), sd_journal_get_events(), and
          sd_journal_get_timeout() are not "async signal safe" in the
          meaning of signal-safety(7). Nevertheless, only the first call to
          any of those three functions performs unsafe operations, so
          subsequent calls are safe.

          sd_journal_process() and sd_journal_wait() are not safe.
          sd_journal_reliable_fd() is safe.


---------------------------------------------------

::

          All functions listed here are thread-agnostic and only a single
          specific thread may operate on a given object during its entire
          lifetime. It's safe to allocate multiple independent objects and
          use each from a specific thread in parallel. However, it's not
          safe to allocate such an object in one thread, and operate or
          free it from any other, even if locking is used to ensure these
          threads don't operate on it at the very same time.

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          Iterating through the journal, in a live view tracking all
          changes:

              #include <stdio.h>
              #include <string.h>
              #include <systemd/sd-journal.h>

              int main(int argc, char *argv[]) {
                int r;
                sd_journal *j;
                r = sd_journal_open(&j, SD_JOURNAL_LOCAL_ONLY);
                if (r < 0) {
                  fprintf(stderr, "Failed to open journal: %s\n", strerror(-r));
                  return 1;
                }
                for (;;)  {
                  const void *d;
                  size_t l;
                  r = sd_journal_next(j);
                  if (r < 0) {
                    fprintf(stderr, "Failed to iterate to next entry: %s\n", strerror(-r));
                    break;
                  }
                  if (r == 0) {
                    /* Reached the end, let's wait for changes, and try again */
                    r = sd_journal_wait(j, (uint64_t) -1);
                    if (r < 0) {
                      fprintf(stderr, "Failed to wait for changes: %s\n", strerror(-r));
                      break;
                    }
                    continue;
                  }
                  r = sd_journal_get_data(j, "MESSAGE", &d, &l);
                  if (r < 0) {
                    fprintf(stderr, "Failed to read message field: %s\n", strerror(-r));
                    continue;
                  }
                  printf("%.*s\n", (int) l, (const char*) d);
                }
                sd_journal_close(j);
                return 0;
              }

          Waiting with poll() (this example lacks all error checking for
          the sake of simplicity):

              #include <poll.h>
              #include <time.h>
              #include <systemd/sd-journal.h>

              int wait_for_changes(sd_journal *j) {
                uint64_t t;
                int msec;
                struct pollfd pollfd;

                sd_journal_get_timeout(j, &t);
                if (t == (uint64_t) -1)
                  msec = -1;
                else {
                  struct timespec ts;
                  uint64_t n;
                  clock_gettime(CLOCK_MONOTONIC, &ts);
                  n = (uint64_t) ts.tv_sec * 1000000 + ts.tv_nsec / 1000;
                  msec = t > n ? (int) ((t - n + 999) / 1000) : 0;
                }

                pollfd.fd = sd_journal_get_fd(j);
                pollfd.events = sd_journal_get_events(j);
                poll(&pollfd, 1, msec);
                return sd_journal_process(j);
              }


---------------------------------------------------------

::

          systemd(1), sd-journal(3), sd_journal_open(3),
          sd_journal_next(3), poll(2), clock_gettime(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                         SD_JOURNAL_GET_FD(3)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__

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
