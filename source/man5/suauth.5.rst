.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

suauth(5) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SUAUTH(5)             File Formats and Conversions             SUAUTH(5)

NAME
-------------------------------------------------

::

          suauth - detailed su control file


---------------------------------------------------------

::

          /etc/suauth


---------------------------------------------------------------

::

          The file /etc/suauth is referenced whenever the su command is
          called. It can change the behaviour of the su command, based
          upon:

                    1) the user su is targeting

          2) the user executing the su command (or any groups he might be a
          member of)

          The file is formatted like this, with lines starting with a #
          being treated as comment lines and ignored;

                    to-id:from-id:ACTION

          Where to-id is either the word ALL, a list of usernames delimited
          by "," or the words ALL EXCEPT followed by a list of usernames
          delimited by ",".

          from-id is formatted the same as to-id except the extra word
          GROUP is recognized.  ALL EXCEPT GROUP is perfectly valid too.
          Following GROUP appears one or more group names, delimited by
          ",". It is not sufficient to have primary group id of the
          relevant group, an entry in /etc/group(5) is necessary.

          Action can be one only of the following currently supported
          options.

          DENY
              The attempt to su is stopped before a password is even asked
              for.

          NOPASS
              The attempt to su is automatically successful; no password is
              asked for.

          OWNPASS
              For the su command to be successful, the user must enter his
              or her own password. They are told this.

          Note there are three separate fields delimited by a colon. No
          whitespace must surround this colon. Also note that the file is
          examined sequentially line by line, and the first applicable rule
          is used without examining the file further. This makes it
          possible for a system administrator to exercise as fine control
          as he or she wishes.


-------------------------------------------------------

::

                    # sample /etc/suauth file
                    #
                    # A couple of privileged usernames may
                    # su to root with their own password.
                    #
                    root:chris,birddog:OWNPASS
                    #
                    # Anyone else may not su to root unless in
                    # group wheel. This is how BSD does things.
                    #
                    root:ALL EXCEPT GROUP wheel:DENY
                    #
                    # Perhaps terry and birddog are accounts
                    # owned by the same person.
                    # Access can be arranged between them
                    # with no password.
                    #
                    terry:birddog:NOPASS
                    birddog:terry:NOPASS
                    #


---------------------------------------------------

::

          /etc/suauth


-------------------------------------------------

::

          There could be plenty lurking. The file parser is particularly
          unforgiving about syntax errors, expecting no spurious whitespace
          (apart from beginning and end of lines), and a specific token
          delimiting different things.


---------------------------------------------------------------

::

          An error parsing the file is reported using syslogd(8) as level
          ERR on facility AUTH.


---------------------------------------------------------

::

          su(1).

COLOPHON
---------------------------------------------------------

::

          This page is part of the shadow-utils (utilities for managing
          accounts and shadow password files) project.  Information about
          the project can be found at 
          ⟨https://github.com/shadow-maint/shadow⟩.  If you have a bug
          report for this manual page, send it to
          pkg-shadow-devel@alioth-lists.debian.net.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/shadow-maint/shadow⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-14.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   shadow-utils 4.8.1             08/27/2021                      SUAUTH(5)

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
