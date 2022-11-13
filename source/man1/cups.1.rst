.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cups(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   cups(1)                        Apple Inc.                        cups(1)

NAME
-------------------------------------------------

::

          cups - a standards-based, open source printing system


---------------------------------------------------------------

::

          CUPS is the software you use to print from applications like word
          processors, email readers, photo editors, and web browsers. It
          converts the page descriptions produced by your application (put
          a paragraph here, draw a line there, and so forth) into something
          your printer can understand and then sends the information to the
          printer for printing.

          Now, since every printer manufacturer does things differently,
          printing can be very complicated.  CUPS does its best to hide
          this from you and your application so that you can concentrate on
          printing and less on how to print. Generally, the only time you
          need to know anything about your printer is when you use it for
          the first time, and even then CUPS can often figure things out on
          its own.

      HOW DOES IT WORK?
          The first time you print to a printer, CUPS creates a queue to
          keep track of the current status of the printer (everything OK,
          out of paper, etc.) and any pages you have printed. Most of the
          time the queue points to a printer connected directly to your
          computer via a USB port, however it can also point to a printer
          on your network, a printer on the Internet, or multiple printers
          depending on the configuration. Regardless of where the queue
          points, it will look like any other printer to you and your
          applications.

          Every time you print something, CUPS creates a job which contains
          the queue you are sending the print to, the name of the document
          you are printing, and the page descriptions. Job are numbered
          (queue-1, queue-2, and so forth) so you can monitor the job as it
          is printed or cancel it if you see a mistake. When CUPS gets a
          job for printing, it determines the best programs (filters,
          printer drivers, port monitors, and backends) to convert the
          pages into a printable format and then runs them to actually
          print the job.

          When the print job is completely printed, CUPS removes the job
          from the queue and moves on to any other jobs you have submitted.
          You can also be notified when the job is finished, or if there
          are any errors during printing, in several different ways.

      WHERE DO I BEGIN?
          The easiest way to start is by using the web interface to
          configure your printer. Go to "http://localhost:631" and choose
          the Administration tab at the top of the page. Click/press on the
          Add Printer button and follow the prompts.

          When you are asked for a username and password, enter your login
          username and password or the "root" username and password.

          After the printer is added you will be asked to set the default
          printer options (paper size, output mode, etc.) for the printer.
          Make any changes as needed and then click/press on the Set
          Default Options button to save them. Some printers also support
          auto-configuration - click/press on the Query Printer for Default
          Options button to update the options automatically.

          Once you have added the printer, you can print to it from any
          application. You can also choose Print Test Page from the
          maintenance menu to print a simple test page and verify that
          everything is working properly.

          You can also use the lpadmin(8) and lpinfo(8) commands to add
          printers to CUPS.  Additionally, your operating system may
          include graphical user interfaces or automatically create printer
          queues when you connect a printer to your computer.

      HOW DO I GET HELP?
          The CUPS web site (http://www.CUPS.org) provides access to the
          cups and cups-devel mailing lists, additional documentation and
          resources, and a bug report database. Most vendors also provide
          online discussion forums to ask printing questions for your
          operating system of choice.


---------------------------------------------------------------

::

          CUPS commands use the following environment variables to override
          the default locations of files and so forth. For security
          reasons, these environment variables are ignored for setuid
          programs:

          CUPS_ANYROOT
               Whether to allow any X.509 certificate root (Y or N).

          CUPS_CACHEDIR
               The directory where semi-persistent cache files can be
               found.

          CUPS_DATADIR
               The directory where data files can be found.

          CUPS_ENCRYPTION
               The default level of encryption (Always, IfRequested, Never,
               Required).

          CUPS_EXPIREDCERTS
               Whether to allow expired X.509 certificates (Y or N).

          CUPS_GSSSERVICENAME
               The Kerberos service name used for authentication.

          CUPS_SERVER
               The hostname/IP address and port number of the CUPS
               scheduler (hostname:port or ipaddress:port).

          CUPS_SERVERBIN
               The directory where server helper programs, filters,
               backend, etc. can be found.

          CUPS_SERVERROOT
               The root directory of the server.

          CUPS_STATEDIR
               The directory where state files can be found.

          CUPS_USER
               Specifies the name of the user for print requests.

          HOME Specifies the home directory of the current user.

          IPP_PORT
               Specifies the default port number for IPP requests.

          LOCALEDIR
               Specifies the location of localization files.

          LPDEST
               Specifies the default print queue (System V standard).

          PRINTER
               Specifies the default print queue (Berkeley standard).

          TMPDIR
               Specifies the location of temporary files.


---------------------------------------------------

::

          ~/.cups/client.conf
          ~/.cups/lpoptions


-------------------------------------------------------------------

::

          CUPS conforms to the Internet Printing Protocol version 2.1 and
          implements the Berkeley and System V UNIX print commands.


---------------------------------------------------

::

          CUPS printer drivers, backends, and PPD files are deprecated and
          will no longer be supported in a future feature release of CUPS.
          Printers that do not support IPP can be supported using
          applications such as ippeveprinter(1).


---------------------------------------------------------

::

          cancel(1), client.conf(7), cupsctl(8), cupsd(8), lp(1),
          lpadmin(8), lpinfo(8), lpoptions(1), lpr(1), lprm(1), lpq(1),
          lpstat(1), CUPS Online Help (http://localhost:631/help), CUPS Web
          Site (http://www.CUPS.org), PWG Internet Printing Protocol
          Workgroup (http://www.pwg.org/ipp)


-----------------------------------------------------------

::

          Copyright © 2007-2019 by Apple Inc.

COLOPHON
---------------------------------------------------------

::

          This page is part of the CUPS (a standards-based, open source
          printing system) project.  Information about the project can be
          found at ⟨http://www.cups.org/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.cups.org/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/apple/cups⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   26 April 2019                     CUPS                           cups(1)

--------------

Pages that refer to this page:
`cups-config(1) <../man1/cups-config.1.html>`__, 
`ippeveprinter(1) <../man1/ippeveprinter.1.html>`__, 
`client.conf(5) <../man5/client.conf.5.html>`__, 
`cups-files.conf(5) <../man5/cups-files.conf.5.html>`__, 
`backend(7) <../man7/backend.7.html>`__, 
`filter(7) <../man7/filter.7.html>`__, 
`cupsd(8) <../man8/cupsd.8.html>`__, 
`cupsd-helper(8) <../man8/cupsd-helper.8.html>`__, 
`cupsfilter(8) <../man8/cupsfilter.8.html>`__, 
`cups-lpd(8) <../man8/cups-lpd.8.html>`__

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
