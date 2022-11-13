.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pfm_get_event_encoding(3) — Linux manual page
=============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN <#RETURN>`__ \|           |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LIBPFM(3)               Linux Programmer's Manual              LIBPFM(3)

NAME
-------------------------------------------------

::

          pfm_get_event_encoding - get raw event encoding


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          int pfm_get_event_encoding(const char *str,int dfl_plm, char **fstr, int *idx, uint64_t *code, int *count);


---------------------------------------------------------------

::

          This function is used to retrieve the raw event encoding
          corresponding to the event string in str.  Only one event per
          call can be encoded. As such, str can contain only one symbolic
          event name.  The string may contain unit masks and modifiers. The
          default privilege level mask is passed in dfl_plm.  It may be
          used depending on the event.

          This function is deprecated. It is superseded by
          pfm_get_os_event_encoding() where the OS is set to PFM_OS_NONE.
          Encoding is retrieve through the pfm_pmu_encode_arg_t structure.

          The following examples illustrates the transition:

             int i, count = 0;
             uint64_t *codes;

             ret = pfm_get_event_encoding("RETIRED_INSTRUCTIONS", PFM_PLM3, NULL, &codes, &count);
             if (ret != PFM_SUCCESS)
                err(1", cannot get encoding %s", pfm_strerror(ret));

             for(i=0; i < count; i++)
                printf("count[%d]=0x%"PRIx64"\n", i, codes[i]);

          is equivalent to:

             pfm_pmu_encode_arg_t arg;
             int i;

             memset(&arg, 0, sizeof(arg));
             arg.size = sizeof(arg);

             ret = pfm_get_os_event_encoding("RETIRED_INSTRUCTIONS", PFM_PLM3, PFM_OS_NONE, &arg);
             if (ret != PFM_SUCCESS)
                err(1", cannot get encoding %s", pfm_strerror(ret));

             for(i=0; i < arg.count; i++)
                printf("count[%d]=0x%"PRIx64"\n", i, arg.codes[i]);

             free(arg.codes);

          The encoding may take several 64-bit integers. The function can use the array passed in code if the number
          of entries passed in count is big enough. However, if both *codes is NULL and count
          is 0, the function allocates the memory necessary to store the encoding. It is up to the caller to
          eventually free the memory. The number of 64-bit entries in codes is reflected in *count upon
          return regardless of whether the codes was allocated or used as is. If the number of 64-bit integers is
          greater than one, then the order in which each component is returned is PMU-model specific. Refer to the PMU
          specific man page.

          The raw encoding means the encoding as mandated by the underlying PMU model. It may not be directly suitable
          to pass to a kernel API. You may want to use API-specific library calls to ensure the correct encoding is passed.

          If fstr is not NULL, it will point to the fully qualified event string upon successful return. The string
          contains the event name, any umask set, and the value of all the modifiers. It reflects what the encoding will
          actually measure. The function allocates the memory to store the string. The caller must eventually free the
          string.

          Here is a example of how this function could be used:
          #include <inttypes.h>
          #include <err.h>
          #include <perfmon/pfmlib.h>
          int main(int argc, char **argv)
          {
             uint64_t *codes 0;
             int count = 0;
             int ret;

             ret = pfm_initialize();
             if (ret != PFMLIB_SUCCESS)
                err(1", cannot initialize library %s", pfm_strerror(ret));

             ret = pfm_get_event_encoding("RETIRED_INSTRUCTIONS", PFM_PLM3, NULL, &codes, &count);
             if (ret != PFM_SUCCESS)
                err(1", cannot get encoding %s", pfm_strerror(ret));

             for(i=0; i < count; i++)
                printf("count[%d]=0x%"PRIx64"\n", i, codes[i]);

             free(codes);
             return 0;
          }


-----------------------------------------------------

::

          The function returns in *codes the encoding of the event and in
          *count the number of 64-bit integers to support that encoding.
          Upon success, PFM_SUCCESS is returned otherwise a specific error
          code is returned.


-----------------------------------------------------

::

          PFM_ERR_TOOSMALL
                 The code argument is too small for the encoding.

          PFM_ERR_INVAL
                 The code or count argument is NULL or the str contains
                 more than one symbolic event.

          PFM_ERR_NOMEM
                 Not enough memory.

          PFM_ERR_NOTFOUND
                 Event not found.

          PFM_ERR_ATTR
                 Invalid event attribute (unit mask or modifier)

          PFM_ERR_ATTR_VAL
                 Invalid modifier value.

          PFM_ERR_ATTR_SET
                 attribute already set, cannot be changed.

          PFM_ERR_ATTR_UMASK
                 Missing unit mask.

          PFM_ERR_ATTR_FEATCOMB
                 Unit masks or features cannot be combined into a single
                 event.


-----------------------------------------------------

::

          Stephane Eranian <eranian@gmail.com>


---------------------------------------------------------

::

          pfm_get_os_event_encoding(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the perfmon2 (a performance monitoring
          library) project.  Information about the project can be found at
          ⟨http://perfmon2.sourceforge.net/⟩.  If you have a bug report for
          this manual page, send it to
          perfmon2-devel@lists.sourceforge.net.  This page was obtained
          from the project's upstream Git repository
          ⟨git://git.code.sf.net/p/perfmon2/libpfm4 perfmon2-libpfm4⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-04.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                September, 2009                   LIBPFM(3)

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
