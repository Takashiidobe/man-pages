.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

avc_cache_stats(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   avc_cache_stats(3)      SELinux API documentation     avc_cache_stats(3)

NAME
-------------------------------------------------

::

          avc_cache_stats, avc_av_stats, avc_sid_stats - obtain userspace
          SELinux AVC statistics


---------------------------------------------------------

::

          #include <selinux/selinux.h>
          #include <selinux/avc.h>

          void avc_av_stats(void);

          void avc_sid_stats(void);

          void avc_cache_stats(struct avc_cache_stats *stats);


---------------------------------------------------------------

::

          The userspace AVC maintains two internal hash tables, one to
          store security ID's and one to cache access decisions.

          avc_av_stats() and avc_sid_stats() produce log messages
          indicating the status of the access decision and SID tables,
          respectively.  The messages contain the number of entries in the
          table, number of hash buckets and number of buckets used, and
          maximum number of entries in a single bucket.

          avc_cache_stats() populates a structure whose fields reflect
          cache activity:

                 struct avc_cache_stats {
                     unsigned  entry_lookups;
                     unsigned  entry_hits;
                     unsigned  entry_misses;
                     unsigned  entry_discards;
                     unsigned  cav_lookups;
                     unsigned  cav_hits;
                     unsigned  cav_probes;
                     unsigned  cav_misses;
                 };

          entry_lookups
                 Number of queries made.

          entry_hits
                 Number of times a decision was found in the aeref
                 argument.

          entry_misses
                 Number of times a decision was not found in the aeref
                 argument.

          entry_discards
                 Number of times a decision was not found in the aeref
                 argument and the aeref argument was non-NULL.

          cav_lookups
                 Number of cache lookups.

          cav_hits
                 Number of cache hits.

          cav_misses
                 Number of cache misses.

          cav_probes
                 Number of entries examined while searching the cache.


---------------------------------------------------

::

          When the cache is flushed as a result of a call to avc_reset() or
          a policy change notification, the statistics returned by
          avc_cache_stats() are reset to zero.  The SID table, however, is
          left unchanged.

          When a policy change notification is received, a call to
          avc_av_stats() is made before the cache is flushed.


-----------------------------------------------------

::

          Eamon Walsh <ewalsh@tycho.nsa.gov>


---------------------------------------------------------

::

          avc_init(3), avc_has_perm(3), avc_context_to_sid(3),
          avc_add_callback(3), selinux(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the selinux (Security-Enhanced Linux user-
          space libraries and tools) project.  Information about the
          project can be found at 
          ⟨https://github.com/SELinuxProject/selinux/wiki⟩.  If you have a
          bug report for this manual page, see
          ⟨https://github.com/SELinuxProject/selinux/wiki/Contributing⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/SELinuxProject/selinux⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                  27 May 2004            avc_cache_stats(3)

--------------

Pages that refer to this page:
`avc_add_callback(3) <../man3/avc_add_callback.3.html>`__, 
`avc_context_to_sid(3) <../man3/avc_context_to_sid.3.html>`__, 
`avc_has_perm(3) <../man3/avc_has_perm.3.html>`__, 
`avc_open(3) <../man3/avc_open.3.html>`__

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
