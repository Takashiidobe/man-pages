.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

labels.conf(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LABELS.CONF(5)             File Formats Manual            LABELS.CONF(5)

NAME
-------------------------------------------------

::

          labels.conf - Performance Co-Pilot labels configuration


---------------------------------------------------------

::

          /etc/pcp/labels.conf


---------------------------------------------------------------

::

          Several Performance Co-Pilot (PCP) tools and utilities support
          the use of metric labels.  This functionality applied a
          hierarchical set of labels to each instance of every metric, as
          described in pmLookupLabels(3).

          The pmcd(1) and pmproxy(1) daemons are particularly important to
          the labels system, respectively providing the labels in real-time
          and then discovering recorded (archive) labels and indexing these
          for pmseries(1) queries using a redis-server(1).

          The /etc/pcp/labels.conf file is a single point of configuration
          for behaviour affecting all labels exported by pmcd or through
          tools using PMAPI local context services.  It uses the common
          ``ini'' file format and any variable it specifies that is not in
          an explicit square-bracket enclosed section is considered a
          [global] variable.

          The available configuration variables are as follows :

          machineid_hash=none|sha256
               When specified in the [global] section, controls the manner
               in which the local machine-id(5) is exported as a label.
               The default setting (none) exports a "machineid" context
               label with value reflecting the contents of the
               /etc/machine-id file, on any platforms that provide this
               file.  The alternative (sha256) exports a "machineid_sha256"
               label, instead, and the value is the SHA256 (one-way) hash
               of the file.


---------------------------------------------------------

::

          pmcd(1), pmproxy(1), pmseries(1), redis-server(1), PMAPI(3),
          pmLookupLabels(3) and machine-id(5).

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

   Performance Co-Pilot               PCP                    LABELS.CONF(5)

--------------

Pages that refer to this page: `pmcd(1) <../man1/pmcd.1.html>`__, 
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
