.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_journal_get_cutoff_realtime_usec(3) — Linux manual page
==========================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_JOURNAL_GET_CUTOFF_REALTIME_USEC(3)ff_realtime_usecF_REALTIME_USEC(3)

NAME
-------------------------------------------------

::

          sd_journal_get_cutoff_realtime_usec,
          sd_journal_get_cutoff_monotonic_usec - Read cut-off timestamps
          from the current journal entry


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          int sd_journal_get_cutoff_realtime_usec(sd_journal *j,
                                                  uint64_t *from,
                                                  uint64_t *to);

          int sd_journal_get_cutoff_monotonic_usec(sd_journal *j,
                                                   sd_id128_t boot_id,
                                                   uint64_t *from,
                                                   uint64_t *to);


---------------------------------------------------------------

::

          sd_journal_get_cutoff_realtime_usec() retrieves the realtime
          (wallclock) timestamps of the first and last entries accessible
          in the journal. It takes three arguments: the journal context
          object j and two pointers from and to pointing at 64-bit unsigned
          integers to store the timestamps in. The timestamps are in
          microseconds since the epoch, i.e.  CLOCK_REALTIME. Either one of
          the two timestamp arguments may be passed as NULL in case the
          timestamp is not needed, but not both.

          sd_journal_get_cutoff_monotonic_usec() retrieves the monotonic
          timestamps of the first and last entries accessible in the
          journal. It takes three arguments: the journal context object j,
          a 128-bit identifier for the boot boot_id, and two pointers to
          64-bit unsigned integers to store the timestamps, from and to.
          The timestamps are in microseconds since boot-up of the specific
          boot, i.e.  CLOCK_MONOTONIC. Since the monotonic clock begins new
          with every reboot it only defines a well-defined point in time
          when used together with an identifier identifying the boot, see
          sd_id128_get_boot(3) for more information. The function will
          return the timestamps for the boot identified by the passed boot
          ID. Either one of the two timestamp arguments may be passed as
          NULL in case the timestamp is not needed, but not both.


-----------------------------------------------------------------

::

          sd_journal_get_cutoff_realtime_usec() and
          sd_journal_get_cutoff_monotonic_usec() return 1 on success, 0 if
          not suitable entries are in the journal or a negative errno-style
          error code.

          Locations pointed to by parameters from and to will be set only
          if the return value is positive, and obviously, the parameters
          are non-null.


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

          systemd(1), sd-journal(3), sd_journal_open(3),
          sd_journal_get_realtime_usec(3), sd_id128_get_boot(3),
          clock_gettime(2)

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

   systemd 249                       SD_JOURNAL_GET_CUTOFF_REALTIME_USEC(3)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__, 
`sd_journal_get_realtime_usec(3) <../man3/sd_journal_get_realtime_usec.3.html>`__

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
