.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmloadderivedconfig(3) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOADDERIVEDCONFIG(3)  Library Functions Manual  PMLOADDERIVEDCONFIG(3)

NAME
-------------------------------------------------

::

          pmLoadDerivedConfig - load derived metric definitions from files


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmLoadDerivedConfig(char *path);

          cc ... -lpcp


---------------------------------------------------------------

::

          Derived metrics may be used to extend the available metrics with
          new (derived) metrics using simple arithmetic expressions.  The
          definitions of these metrics can be persisted and loaded
          programatically by monitor tools using pmLoadDerivedConfig.

          The path parameter defines a colon separated list of files and/or
          directories (the syntax is the same as for the $PATH variable for
          sh(1)), from which derived metric specifications are to be
          sourced.  The path components are expanded into a list of files
          as follows: if a component is a file, then that file is added to
          the list, else if a component is a directory then recursive
          descent is used to enumerate all files below that directory and
          these are added to the list.  Each file in the resulting list is
          parsed in order, and according to the derived metrics syntax
          described below.

          Each line of the file(s) identified by path is either a comment
          line (with a ``#'' in the first position of the line) or the
          declaration of a derived performance metric, specified as:

          * the name of the derived metric, using the same ``dot notation''
            syntax that is used for PCP performance metrics, see
            PCPIntro(1) and PMNS(5).
          * an equals sign (``='')
          * a valid expression for a derived metric, as described in
            pmRegisterDerived(3).

          For each line containing a derived metric definition,
          pmRegisterDerived(3) is called to register the new derived
          metric.

          Once a derived metric has been declared, it may be assigned
          additional attributes with a line of the form:

          * the name of the derived metric,
          * a left parenthesis, an attribute type and a right parenthesis,
          * an equals sign (``=''),
          * an attribute value.

          Currently, attribute type may be either oneline or helptext to
          designate the ``one line'' or expanded help text to be associated
          with the derived metric, see pmLookupText(3).

          The attribute value may be either arbitrary text following the
          ``='' and ending at the end of the line, else a string enclosed
          in either single quotes (') or double quotes (").  In the latter
          case, the attribute value may span multiple lines, and a simple
          escape mechanism is supported, namely for any character ``x'',
          ``\x'' is replaced by ``x'' (this allows quotes to be escaped
          within a string, for example), and there is a special case when
          the ``\'' comes at the end of the line in which case the
          following newline is not included in the attribute value.

          Outside of attribute values, white space is ignored in the lines,
          and blank lines are ignored altogether.

          Because pmLoadDerivedConfig may process many files, each of which
          may contain many derived metric specifications, it is not
          possible to provide a specific error status on return.  Hence the
          result from pmLoadDerivedConfig will be the number of derived
          metrics successfully loaded from files on the given path.
          Catastrophic errors such as not being able to open one of the
          files on the given path will cause an immediate return with a
          negative return value that can be passed to pmErrStr(3) to obtain
          the associated error message.

          When errors are encountered in the derived metric specifications
          diagnostic messages are generated by pmRegisterDerived(3) and
          displayed via pmprintf(3).


-------------------------------------------------------

::

          # sample derived metric definitions
          bad_in_pkts = network.interface.in.errors + network.interface.in.drops
          # note the following would need to be on a single line ...
          disk.dev.read_pct = 100 * delta(disk.dev.read) /
                      (delta(disk.dev.read) + delta(disk.dev.write))
          disk.dev.read_pct(oneline) = percentage of disk reads
          disk.dev.read_pct(helptext) = '\
          Percentage of disk reads compared to the total number of
          disk reads and disk writes.'


---------------------------------------------------------

::

          sh(1), PCPIntro(1), PMAPI(3), pmLookupText(3),
          pmRegisterDerived(3), pmprintf(3) and PMNS(5).

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

   Performance Co-Pilot                              PMLOADDERIVEDCONFIG(3)

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
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pminfo(1) <../man1/pminfo.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmaddderived(3) <../man3/pmaddderived.3.html>`__, 
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__, 
`pmreconnectcontext(3) <../man3/pmreconnectcontext.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`zbxpcp(3) <../man3/zbxpcp.3.html>`__

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
