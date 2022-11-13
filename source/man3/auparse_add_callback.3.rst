.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

auparse_add_callback(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUPARSE_ADD_CALLBACK(3)      Linux Audit API     AUPARSE_ADD_CALLBACK(3)

NAME
-------------------------------------------------

::

          auparse_add_callback - add a callback handler for notifications


---------------------------------------------------------

::

          #include <auparse.h>

          void
          auparse_add_callback(auparse_state_t *au, auparse_callback_ptr callback,
                               void *user_data, user_destroy user_destroy_func);


---------------------------------------------------------------

::

          auparse_add_callback adds a callback function to the parse state
          which is invoked to notify the application of parsing events.
          This is part of the event feed API.

          The signature of the callback is:

          void
          auparse_callback(auparse_state_t *au, auparse_cb_event_t cb_event_type,
                           void *user_data);

          When the callback is invoked it is passed:

          au
                  a pointer to the parse_state

          cb_event_type
                 enumerated value indicating the reason why the callback
                 was invoked

          user_data
                 pointer to user supplied private data. May be NULL.

          user_destroy_func
                 pointer to function called when user_data is destroyed.
                 May be NULL.  The signature is:

                 void destroy(void *user_data);

                 The destroy() function should be prepared to accept
                 user_data possibly being NULL.

          The cb_event_type argument indicates why the callback was
          invoked. It's possible values are:

          AUPARSE_CB_EVENT_READY
                 A complete event has been parsed and is ready to be
                 examined. This is logically equivalent to the parse state
                 immediately following auparse_next_event()

          See auparse_feed(3) for a complete code example.


-----------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          auparse_feed(3), auparse_flush_feed(3).


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

   Red Hat                         May 2007         AUPARSE_ADD_CALLBACK(3)

--------------

Pages that refer to this page:
`auparse_feed(3) <../man3/auparse_feed.3.html>`__

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
