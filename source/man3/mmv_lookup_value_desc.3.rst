.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mmv_lookup_value_desc(3) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURNS <#RETURNS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MMV_LOOKUP_VALUE_DESC(3)Library Functions ManualMMV_LOOKUP_VALUE_DESC(3)

NAME
-------------------------------------------------

::

          mmv_lookup_value_desc - find a value in the Memory Mapped Value
          file


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/mmv_stats.h>

          pmAtomValue *mmv_lookup_value_desc(void *addr, const char
                  *metric, const char *inst);

          cc ... -lpcp_mmv -lpcp


---------------------------------------------------------------

::

          mmv_lookup_value_desc searches for the value of the instance
          identified by the external instance name inst of the metric
          metric in the MMV(5) file.  addr is the address returned from
          mmv_stats_init().

          The pointer returned points to a pmAtomValue union, which is
          defined as follows:

              typedef union {
                  __int32_t   l;      /* 32-bit signed */
                  __uint32_t  ul;     /* 32-bit unsigned */
                  __int64_t   ll;     /* 64-bit signed */
                  __uint64_t  ull;    /* 64-bit unsigned */
                  float       f;      /* 32-bit floating point */
                  double      d;      /* 64-bit floating point */
                  char         *cp;   /* char ptr */
               pmValueBlock *vbp;  /* pmValueBlock ptr */
              } pmAtomValue;

          MMV string values should be set using either of the
          mmv_set_string or mmv_set_strlen routines.


-------------------------------------------------------

::

          The function returns the address inside of the memory mapped
          region on success or NULL on failure.


---------------------------------------------------------

::

          mmv_stats_init(3), mmv_inc_value(3) and mmv(5).

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

   Performance Co-Pilot                            MMV_LOOKUP_VALUE_DESC(3)

--------------

Pages that refer to this page:
`mmv_inc_value(3) <../man3/mmv_inc_value.3.html>`__, 
`mmv_stats_init(3) <../man3/mmv_stats_init.3.html>`__, 
`mmv_stats_registry(3) <../man3/mmv_stats_registry.3.html>`__

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
