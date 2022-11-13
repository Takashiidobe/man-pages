.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

auparse_init(3) — Linux manual page
===================================

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

   AUPARSE_INIT(3)              Linux Audit API             AUPARSE_INIT(3)

NAME
-------------------------------------------------

::

          auparse_init - initialize an instance of the audit parsing
          library


---------------------------------------------------------

::

          #include <auparse.h>

          auparse_state_t *auparse_init(ausource_t source, const void *b);


---------------------------------------------------------------

::

          auparse_init initializes an instance of the audit parsing
          library. The function returns an opaque pointer to the parser's
          internal state. It is used in subsequent calls to the library so.
          The source variable determines where the library looks for data.
          Legal values can be:

               AUSOURCE_LOGS - use audit logs
               AUSOURCE_FILE - use a file
               AUSOURCE_FILE_ARRAY - use several files
               AUSOURCE_BUFFER - use a buffer
               AUSOURCE_BUFFER_ARRAY - use an array of buffers
               AUSOURCE_DESCRIPTOR - use a particular descriptor
               AUSOURCE_FILE_POINTER - use a stdio FILE pointer
               AUSOURCE_FEED - feed data to parser with auparse_feed()

          The pointer 'b' is used to set the file name, array of filenames,
          the buffer address, or an array of pointers to buffers, or the
          descriptor number based on what source is given. When the data
          source is an array of files or buffers, you would create an array
          of pointers with the last one being a NULL pointer. Buffers
          should be NUL terminated.


-----------------------------------------------------------------

::

          Returns a NULL pointer if an error occurs; otherwise, the return
          value is an opaque pointer to the parser's internal state.


---------------------------------------------------------

::

          auparse_reset(3), auparse_destroy(3).  auparse_feed(3).


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

   Red Hat                         Feb 2007                 AUPARSE_INIT(3)

--------------

Pages that refer to this page:
`auparse_destroy(3) <../man3/auparse_destroy.3.html>`__, 
`auparse_new_buffer(3) <../man3/auparse_new_buffer.3.html>`__, 
`auparse_reset(3) <../man3/auparse_reset.3.html>`__, 
`auparse_set_eoe_timeout(3) <../man3/auparse_set_eoe_timeout.3.html>`__

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
