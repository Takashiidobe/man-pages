.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iptables-xml(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IPTABLES-XML(1)              iptables 1.8.7              IPTABLES-XML(1)

NAME
-------------------------------------------------

::

          iptables-xml — Convert iptables-save format to XML


---------------------------------------------------------

::

          iptables-xml [-c] [-v]


---------------------------------------------------------------

::

          iptables-xml is used to convert the output of iptables-save into
          an easily manipulatable XML format to STDOUT.  Use I/O-
          redirection provided by your shell to write to a file.

          -c, --combine
                 combine consecutive rules with the same matches but
                 different targets. iptables does not currently support
                 more than one target per match, so this simulates that by
                 collecting the targets from consecutive iptables rules
                 into one action tag, but only when the rule matches are
                 identical. Terminating actions like RETURN, DROP, ACCEPT
                 and QUEUE are not combined with subsequent targets.

          -v, --verbose
                 Output xml comments containing the iptables line from
                 which the XML is derived

          iptables-xml does a mechanistic conversion to a very expressive
          xml format; the only semantic considerations are for -g and -j
          targets in order to discriminate between <call> <goto> and <nane-
          of-target> as it helps xml processing scripts if they can tell
          the difference between a target like SNAT and another chain.

          Some sample output is:

          <iptables-rules>
            <table name="mangle">
              <chain name="PREROUTING" policy="ACCEPT" packet-count="63436"
          byte-count="7137573">
                <rule>
                 <conditions>
                  <match>
                    <p>tcp</p>
                  </match>
                  <tcp>
                    <sport>8443</sport>
                  </tcp>
                 </conditions>
                 <actions>
                  <call>
                    <check_ip/>
                  </call>
                  <ACCEPT/>
                 </actions>
                </rule>
              </chain>
            </table> </iptables-rules>

          Conversion from XML to iptables-save format may be done using the
          iptables.xslt script and xsltproc, or a custom program using
          libxsltproc or similar; in this fashion:

          xsltproc iptables.xslt my-iptables.xml | iptables-restore


-------------------------------------------------

::

          None known as of iptables-1.3.7 release


-----------------------------------------------------

::

          Sam Liddicott <azez@ufomechanic.net>


---------------------------------------------------------

::

          iptables-save(8), iptables-restore(8), iptables(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the iptables (administer and maintain packet
          filter rules) project.  Information about the project can be
          found at ⟨http://www.netfilter.org/⟩.  If you have a bug report
          for this manual page, see ⟨http://bugzilla.netfilter.org/⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨git://git.netfilter.org/iptables⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-11.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   iptables 1.8.7                                           IPTABLES-XML(1)

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
