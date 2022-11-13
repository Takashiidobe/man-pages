.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_journal_print(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| THREAD SAFETY <#THREAD_SAFETY>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_JOURNAL_PRINT(3)         sd_journal_print         SD_JOURNAL_PRINT(3)

NAME
-------------------------------------------------

::

          sd_journal_print, sd_journal_printv, sd_journal_send,
          sd_journal_sendv, sd_journal_perror,
          SD_JOURNAL_SUPPRESS_LOCATION, sd_journal_print_with_location,
          sd_journal_printv_with_location, sd_journal_send_with_location,
          sd_journal_sendv_with_location, sd_journal_perror_with_location -
          Submit log entries to the journal


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          int sd_journal_print(int priority, const char *format, ...);

          int sd_journal_printv(int priority, const char *format,
                                va_list ap);

          int sd_journal_send(const char *format, ...);

          int sd_journal_sendv(const struct iovec *iov, int n);

          int sd_journal_perror(const char *message);

          int sd_journal_print_with_location(const char *file,
                                             const char *line,
                                             const char *func,
                                             int priority,
                                             const char *format, ...);

          int sd_journal_printv_with_location(int priority,
                                              const char *file,
                                              const char *line,
                                              const char *func,
                                              const char *format,
                                              va_list ap);

          int sd_journal_send_with_location(const char *file,
                                            const char *line,
                                            const char *func,
                                            const char *format, ...);

          int sd_journal_sendv_with_location(const char *file,
                                             const char *line,
                                             const char *func,
                                             const struct iovec *iov,
                                             int n);

          int sd_journal_perror_with_location(const char *file,
                                              const char *line,
                                              const char *func,
                                              const char *message);


---------------------------------------------------------------

::

          sd_journal_print() may be used to submit simple, plain text log
          entries to the system journal. The first argument is a priority
          value. This is followed by a format string and its parameters,
          similar to printf(3) or syslog(3). Note that currently the
          resulting message will be truncated to LINE_MAX - 8. The priority
          value is one of LOG_EMERG, LOG_ALERT, LOG_CRIT, LOG_ERR,
          LOG_WARNING, LOG_NOTICE, LOG_INFO, LOG_DEBUG, as defined in
          syslog.h, see syslog(3) for details. It is recommended to use
          this call to submit log messages in the application locale or
          system locale and in UTF-8 format, but no such restrictions are
          enforced. Note that log messages written using this function are
          generally not expected to end in a new-line character. However,
          as all trailing whitespace (including spaces, new-lines,
          tabulators and carriage returns) are automatically stripped from
          the logged string, it is acceptable to specify one (or more).
          Empty lines (after trailing whitespace removal) are suppressed.
          On non-empty lines, leading whitespace (as well as inner
          whitespace) is left unmodified.

          sd_journal_printv() is similar to sd_journal_print() but takes a
          variable argument list encapsulated in an object of type va_list
          (see stdarg(3) for more information) instead of the format
          string. It is otherwise equivalent in behavior.

          sd_journal_send() may be used to submit structured log entries to
          the system journal. It takes a series of format strings, each
          immediately followed by their associated parameters, terminated
          by NULL. The strings passed should be of the format
          "VARIABLE=value". The variable name must be in uppercase and
          consist only of characters, numbers and underscores, and may not
          begin with an underscore. (All assignments that do not follow
          this syntax will be ignored.) The value can be of any size and
          format. It is highly recommended to submit text strings formatted
          in the UTF-8 character encoding only, and submit binary fields
          only when formatting in UTF-8 strings is not sensible. A number
          of well-known fields are defined, see systemd.journal-fields(7)
          for details, but additional application defined fields may be
          used. A variable may be assigned more than one value per entry.
          If this function is used, trailing whitespace is automatically
          removed from each formatted field.

          sd_journal_sendv() is similar to sd_journal_send() but takes an
          array of struct iovec (as defined in uio.h, see readv(3) for
          details) instead of the format string. Each structure should
          reference one field of the entry to submit. The second argument
          specifies the number of structures in the array.
          sd_journal_sendv() is particularly useful to submit binary
          objects to the journal where that is necessary. Note that this
          function will not strip trailing whitespace of the passed fields,
          but passes the specified data along unmodified. This is different
          from both sd_journal_print() and sd_journal_send() described
          above, which are based on format strings, and do strip trailing
          whitespace.

          sd_journal_perror() is a similar to perror(3) and writes a
          message to the journal that consists of the passed string,
          suffixed with ": " and a human-readable representation of the
          current error code stored in errno(3). If the message string is
          passed as NULL or empty string, only the error string
          representation will be written, prefixed with nothing. An
          additional journal field ERRNO= is included in the entry
          containing the numeric error code formatted as decimal string.
          The log priority used is LOG_ERR (3).

          Note that sd_journal_send() is a wrapper around
          sd_journal_sendv() to make it easier to use when only text
          strings shall be submitted. Also, the following two calls are
          mostly equivalent:

              sd_journal_print(LOG_INFO, "Hello World, this is PID %lu!", (unsigned long) getpid());

              sd_journal_send("MESSAGE=Hello World, this is PID %lu!", (unsigned long) getpid(),
                              "PRIORITY=%i", LOG_INFO,
                              NULL);

          Note that these calls implicitly add fields for the source file,
          function name and code line where invoked. This is implemented
          with macros. If this is not desired, it can be turned off by
          defining SD_JOURNAL_SUPPRESS_LOCATION before including
          sd-journal.h.

          sd_journal_print_with_location(),
          sd_journal_printv_with_location(),
          sd_journal_send_with_location(),
          sd_journal_sendv_with_location(), and
          sd_journal_perror_with_location() are similar to their
          counterparts without "_with_location", but accept additional
          parameters to explicitly set the source file name, function, and
          line. Those arguments must contain valid journal entries
          including the variable name, e.g.  "CODE_FILE=src/foo.c",
          "CODE_LINE=666", "CODE_FUNC=myfunc". These variants are primarily
          useful when writing custom wrappers, for example in bindings for
          a different language.

          syslog(3) and sd_journal_print() may largely be used
          interchangeably functionality-wise. However, note that log
          messages logged via the former take a different path to the
          journal server than the later, and hence global chronological
          ordering between the two streams cannot be guaranteed. Using
          sd_journal_print() has the benefit of logging source code line,
          filenames, and functions as metadata along all entries, and
          guaranteeing chronological ordering with structured log entries
          that are generated via sd_journal_send(). Using syslog() has the
          benefit of being more portable.

          These functions implement a client to the Native Journal
          Protocol[1].


-----------------------------------------------------------------

::

          The ten functions return 0 on success or a negative errno-style
          error code. The errno(3) variable itself is not altered.

          If systemd-journald(8) is not running (the socket is not
          present), those functions do nothing, and also return 0.


-------------------------------------------------------------------

::

          All functions listed here are thread-safe and may be called in
          parallel from multiple threads.

          sd_journal_sendv() and sd_journal_sendv_with_location() are
          "async signal safe" in the meaning of signal-safety(7).

          sd_journal_print(), sd_journal_printv(), sd_journal_send(),
          sd_journal_perror(), and their counterparts with "_with_location"
          are not async signal safe.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-journal(3), sd_journal_stream_fd(3), syslog(3),
          perror(3), errno(3), systemd.journal-fields(7), signal(7),
          socket(7)

.. _notes-top-1:


---------------------------------------------------

::

           1. Native Journal Protocol
              https://systemd.io/JOURNAL_NATIVE_PROTOCOL

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

   systemd 249                                          SD_JOURNAL_PRINT(3)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__, 
`sd_journal_stream_fd(3) <../man3/sd_journal_stream_fd.3.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`file-hierarchy(7) <../man7/file-hierarchy.7.html>`__, 
`systemd.journal-fields(7) <../man7/systemd.journal-fields.7.html>`__, 
`systemd-journald.service(8) <../man8/systemd-journald.service.8.html>`__

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
