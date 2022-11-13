.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmmergelabels(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `PYTH                             |                                   |
| ON SYNOPSIS <#PYTHON_SYNOPSIS>`__ |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \|                                |                                   |
| `PY                               |                                   |
| THON EXAMPLE <#PYTHON_EXAMPLE>`__ |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMMERGELABELS(3)        Library Functions Manual        PMMERGELABELS(3)

NAME
-------------------------------------------------

::

          pmMergeLabels, pmMergeLabelSets - merge sets of performance
          metric labels


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmMergeLabels(char **sets, int nsets, char *buffer, int
                  length);

          int pmMergeLabelSets(pmLabelSet **sets, int nsets, char *buffer,
                  int length, int (*filter)(const pmLabel *, const char *,
                  void *), void *arg);

          cc ... -lpcp


-----------------------------------------------------------------------

::

          from pcp import pmapi

          buffer = pmapi.pmContext().pmMergeLabels(sets)
          buffer = pmapi.pmContext().pmMergeLabelSets(sets, filter)


---------------------------------------------------------------

::

          pmMergeLabels takes multiple (nsets) performance metric label
          sets and merges them into a single result buffer of length bytes.
          Both the input sets and the result buffer are name:value pairs in
          the "JSONB" format described on pmLookupLabels(3).

          The pmMergeLabelSets interface serves the same purpose, but
          allows for indexed sets of labels to be merged.  The format of
          the pmLabelSet data structure is described in detail in
          pmLookupLabels(3).

          Although names may repeat across the provided label sets,
          duplicate names are not allowed in the final buffer.  Any label
          names occuring in more than one of the input label sets are
          reduced to one using the rules described in the "PRECEDENCE"
          section of pmLookupLabels.  The position of each element in the
          sets array is significant in terms of the precedence rules -
          earlier positions are taken to be of lower precedence to later
          positions.

          Values must be primitive JSON entities (e.g. numbers, strings),
          one-dimensional arrays or maps (i.e. simple associative arrays).

          In addition to using indexed label sets the pmMergeLabelSets
          interface provides an optional filter callback function.  If non-
          NULL, this function will be called for each label that would be
          added to the output buffer, allowing finer-grained control over
          the final merged set.  This mechanism can be used to filter
          individual labels based on their name, value, and/or flags.  If
          the filter function returns zero (false), then the given label is
          filtered from the resulting set.  Any non-zero return value
          indicates that the label should be included in the buffer.


---------------------------------------------------------------------

::

          import sys
          import json
          from pcp import pmapi
          import cpmapi as c_api

          def merge_callback(label, jsondata, data=None):
              d = json.loads(jsondata)
              labelsD.update(d)
              return 0

          ctx = pmapi.pmContext()

          for metric in sys.argv[1:]:
              pmid = ctx.pmLookupName(metric)[0]
              lset = ctx.pmLookupLabels(pmid)
              labelsD = {}
              ctx.pmMergeLabelSets(lset, merge_callback)
              print("== %s ===" % metric)
              for n,v in labelsD.items():
                  print("    %s = %s" % (n,v))
              ctx.pmFreeLabelSets(lset)


---------------------------------------------------------------

::

          On success, both pmMergeLabels and pmMergeLabelSets returns the
          number of bytes written into the supplied buffer.

          Failure to parse the input strings, failure to allocate memory,
          or any internal inconsistencies found will result in a negative
          return code.


---------------------------------------------------------

::

          pminfo(1), PMAPI(3) and pmLookupLabels(3).

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

   Performance Co-Pilot               PCP                  PMMERGELABELS(3)

--------------

Pages that refer to this page:
`pmlookuplabels(3) <../man3/pmlookuplabels.3.html>`__

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
