.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

auparse_feed(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUPARSE_FEED(3)              Linux Audit API             AUPARSE_FEED(3)

NAME
-------------------------------------------------

::

          auparse_feed - feed data into parser


---------------------------------------------------------

::

          #include <auparse.h>

          int auparse_feed(auparse_state_t *au, const char *data, size_t data_len);

          au     The audit parse state

          data   a buffer of data to feed into the parser, it is data_len
                 bytes long. The data is copied in the parser, upon return
                 the caller may free or reuse the data buffer.

          data_len
                 number of bytes in data


---------------------------------------------------------------

::

          auparse_feed supplies new data for the parser to consume.
          auparse_init() must have been called with a source type of
          AUSOURCE_FEED and a NULL pointer.

          The parser consumes as much data as it can invoking a user
          supplied callback specified with auparse_add_callback with a
          cb_event_type of AUPARSE_CB_EVENT_READY each time the parser
          recognizes a complete event in the data stream. Data not fully
          parsed will persist and be prepended to the next feed data. After
          all data has been feed to the parser auparse_flush_feed should be
          called to signal the end of input data and flush any pending
          parse data through the parsing system.


-------------------------------------------------------

::

          void
          auparse_callback(auparse_state_t *au, auparse_cb_event_t cb_event_type,
                           void *user_data)
          {
              int *event_cnt = (int *)user_data;

              if (cb_event_type == AUPARSE_CB_EVENT_READY) {
                  if (auparse_first_record(au) <= 0) return;
                  printf("event: %d\n", *event_cnt);
                  printf("records:%d\n", auparse_get_num_records(au));
                  do {
                      printf("fields:%d\n", auparse_get_num_fields(au));
                      printf("type=%d ", auparse_get_type(au));
                      const au_event_t *e = auparse_get_timestamp(au);
                      if (e == NULL) return;
                      printf("event time: %u.%u:%lu\n",
                              (unsigned)e->sec, e->milli, e->serial);
                      auparse_first_field(au);
                      do {
                          printf("%s=%s (%s)\n", auparse_get_field_name(au),
                                 auparse_get_field_str(au),
                                 auparse_interpret_field(au));
                      } while (auparse_next_field(au) > 0);
                      printf("\n");

                  } while(auparse_next_record(au) > 0);
                  (*event_cnt)++;
              }
          }

          main(int argc, char **argv)
          {
              char *filename = argv[1];
              FILE *fp;
              char buf[256];
              size_t len;
              int *event_cnt = malloc(sizeof(int));

              au = auparse_init(AUSOURCE_FEED, 0);

              *event_cnt = 1;
              auparse_add_callback(au, auparse_callback, event_cnt, free);

              if ((fp = fopen(filename, "r")) == NULL) {
                  fprintf(stderr, "could not open '%s', %s\n", filename, strerror(errno));
                  return 1;
              }

              while ((len = fread(buf, 1, sizeof(buf), fp))) {
                  auparse_feed(au, buf, len);
              }
              auparse_flush_feed(au);
          }


-----------------------------------------------------------------

::

          Returns -1 if an error occurs; otherwise, 0 for success.


---------------------------------------------------------

::

          auparse_add_callback(3), auparse_flush_feed(3),
          auparse_feed_age_events(3), auparse_feed_has_data(3)


-----------------------------------------------------

::

          John Dennis

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

   Red Hat                         May 2007                 AUPARSE_FEED(3)

--------------

Pages that refer to this page:
`auparse_add_callback(3) <../man3/auparse_add_callback.3.html>`__, 
`auparse_feed_age_events(3) <../man3/auparse_feed_age_events.3.html>`__, 
`auparse_feed_has_data(3) <../man3/auparse_feed_has_data.3.html>`__, 
`auparse_flush_feed(3) <../man3/auparse_flush_feed.3.html>`__, 
`auparse_init(3) <../man3/auparse_init.3.html>`__

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
