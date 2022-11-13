.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ascii-xfr(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `USAGE WITH                       |                                   |
|  MINICOM <#USAGE_WITH_MINICOM>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ASCII-XFR(1)               Linux Users Manual               ASCII-XFR(1)

NAME
-------------------------------------------------

::

          ascii-xfr - upload/download files using the ASCII protocol


---------------------------------------------------------

::

          ascii-xfr -s|-r [-ednv] [-l linedelay] [-c characterdelay]
          filename


---------------------------------------------------------------

::

          Ascii-xfr Transfers files in ASCII mode. This means no flow
          control, no checksumming and no file-name negotiation. It should
          only be used if the remote system doesn't understand anything
          else.

          The ASCII protocol transfers files line-by-line. The EOL (End-Of-
          Line) character is transmitted as CRLF. When receiving, the CR
          character is stripped from the incoming file.  The Control-Z
          (ASCII 26) character signals End-Of-File, if option -e is
          specified (unless you change it to Control-D (ASCII 4) with -d).

          Ascii-xfr reads from stdin when receiving, and sends data on
          stdout when sending. Some form of input or output redirection to
          the modem device is thus needed when downloading or uploading,
          respectively.


-------------------------------------------------------

::

          -s     Send a file.

          -r     Receive a file. One of -s or -r must be present.

          -e     Send the End-Of-File character (Control-Z, ASCII 26 by
                 default) when uploading has finished.

          -d     Use the Control-D (ASCII 4) as End-Of-File character.

          -n     Do not translate CR to CRLF and vice versa.

          -v     Verbose: show transfer statistics on the stderr output.

          -l milliseconds
                 When transmitting, pause for this delay after each line.

          -c milliseconds
                 When transmitting, pause for this delay after each
                 character.

          file   Name of the file to send or receive. When receiving, any
                 existing file by this name will be truncated.


-----------------------------------------------------------------------------

::

          If you want to call this program from minicom(1), start minicom
          and go to the Options menu. Select File transfer protocols.  Add
          the following lines, for example as protocols I and J.

          I  Ascii    /usr/bin/ascii-xfr -sv   Y   U   N   Y
          J  Ascii    /usr/bin/ascii-xfr -rv   Y   D   N   Y


-----------------------------------------------------

::

          Miquel van Smoorenburg, miquels@cistron.nl
          Jukka Lahtinen, walker@netsonic.fi


---------------------------------------------------------

::

          minicom(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the minicom (a serial communication program)
          project.  Information about the project can be found at 
          ⟨https://salsa.debian.org/minicom-team/minicom⟩.  If you have a
          bug report for this manual page, send it to adam@lackorzynski.de.
          This page was obtained from the project's upstream Git repository
          ⟨https://salsa.debian.org/minicom-team/minicom⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-06-19.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                         $Date: 2006-10-28 14:35:59 $          ASCII-XFR(1)

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
