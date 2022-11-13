.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmparseunitsstr(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMPARSEUNITSSTR(3)      Library Functions Manual      PMPARSEUNITSSTR(3)

NAME
-------------------------------------------------

::

          pmParseUnitsStr - parse units specification


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmParseUnitsStr(const char *string, struct pmUnits *out,
                  double *outMult, char **errMsg);

          cc ... -lpcp


---------------------------------------------------------------

::

          pmParseUnitsStr is designed to encapsulate the interpretation of
          a units (dimension and scale) specification in command line
          switches for use by the PCP client tools.

          This function expects to be called with the unit/scale
          specification as string.  This specification takes the general
          form produced by pmUnitsStr(3).  Briefly, the format allows
          /-separated divisor and dividend, each listing space-separated
          dimensions/scales along the space, time, and count axes.  There
          are also a few extra possibilities:

          First, multiple equivalent sets of keywords are accepted for the
          time and space dimensions, insensitive to case.  For example,
          "microseconds", "microsecond", "microsec", "us" are considered
          synonymous, as are "kilobytes", "KB", "KiB", "kiloByte", and so
          on.

          Second, units may be offered in any order, e.g., ms kb count x
          10^3 or count x 10^3 kb ms.  They may not be repeated within the
          denominator or within the numerator.  Each scale/unit keyword may
          be immediately followed by positive or negative exponents, e.g.,
          ^-4.

          Third, numerical scaling factors may be supplied.  These are
          factored together with implicit scale conversions into the final
          outMult result.

          The out and outMult values must both be allocated before calling
          pmParseUnitsStr(3).  If the conversion is successful,
          pmParseUnitsStr returns 0, and fills in out and outMult with the
          unit/scales defined by the input parameter.  If the argument
          strings could not be parsed, it returns a negative status code.


---------------------------------------------------------

::

           ┌──────────────────────────────────┬────────────────┬─────────┐
           │             string               │      out       │ outMult │
           ├──────────────────────────────────┼────────────────┼─────────┤
           │2 count                           │ {0,1,0,0,0,0}  │ 0.5     │
           │count / 7.5 nanosecond            │ {0,1,-1,0,0,0} │ 7.5     │
           │10 kilobytes / 2.5e2 count x 10^3 │ {1,-1,0,1,3,0} │ 25      │
           │millisecond / second^2            │ {0,0,-1,0,0,3} │ 1000    │
           │mib/s                             │ {1,0,-1,2,0,3} │ 1       │
           └──────────────────────────────────┴────────────────┴─────────┘


-------------------------------------------------

::

          For backward compatibility, this interface interprets several
          traditional computer science interpretations of space units
          incorrectly by the International System of Units (SI) standard.

          The accepted unit string - in either singular or plural form -
          and the pmParseUnitsStr interpretation for each are:
          megabyte(mebibyte), gigabyte(gibibyte), terabyte(tebibyte),
          petabyte(pebibyte), exabyte(exbibyte), zettabyte(zebibyte) and
          yottabyte(yobibyte).


-----------------------------------------------------------------

::

          A zero status indicates success.  A negative status indicates an
          error, in which case the errMsg pointer will contain a textual
          error message, which the caller should later free(3).


---------------------------------------------------------

::

          PMAPI(3), pmUnitsStr(3), pmConvScale(3), and pmLookupDesc(3).

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

   Performance Co-Pilot               PCP                PMPARSEUNITSSTR(3)

--------------

Pages that refer to this page:
`pcp2elasticsearch(1) <../man1/pcp2elasticsearch.1.html>`__, 
`pcp2graphite(1) <../man1/pcp2graphite.1.html>`__, 
`pcp2influxdb(1) <../man1/pcp2influxdb.1.html>`__, 
`pcp2json(1) <../man1/pcp2json.1.html>`__, 
`pcp2spark(1) <../man1/pcp2spark.1.html>`__, 
`pcp2template(1) <../man1/pcp2template.1.html>`__, 
`pcp2xlsx(1) <../man1/pcp2xlsx.1.html>`__, 
`pcp2xml(1) <../man1/pcp2xml.1.html>`__, 
`pcp2zabbix(1) <../man1/pcp2zabbix.1.html>`__, 
`pmdaopenmetrics(1) <../man1/pmdaopenmetrics.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmfetchgroup(3) <../man3/pmfetchgroup.3.html>`__, 
`pmparseunitsstr(3) <../man3/pmparseunitsstr.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__

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
