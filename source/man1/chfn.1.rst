.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

Another version of this page is provided by the
`shadow-utils <chfn.1@@shadow-utils.html>`__ project

--------------

chfn(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CONFIG F                         |                                   |
| ILE ITEMS <#CONFIG_FILE_ITEMS>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CHFN(1)                       User Commands                      CHFN(1)

NAME
-------------------------------------------------

::

          chfn - change your finger information


---------------------------------------------------------

::

          chfn [-f full-name] [-o office] [-p office-phone] [-h home-phone]
          [-u] [-v] [username]


---------------------------------------------------------------

::

          chfn is used to change your finger information. This information
          is stored in the /etc/passwd file, and is displayed by the finger
          program. The Linux finger command will display four pieces of
          information that can be changed by chfn: your real name, your
          work room and phone, and your home phone.

          Any of the four pieces of information can be specified on the
          command line. If no information is given on the command line,
          chfn enters interactive mode.

          In interactive mode, chfn will prompt for each field. At a
          prompt, you can enter the new information, or just press return
          to leave the field unchanged. Enter the keyword "none" to make
          the field blank.

          chfn supports non-local entries (kerberos, LDAP, etc.) if linked
          with libuser, otherwise use ypchfn(1), lchfn(1) or any other
          implementation for non-local entries.


-------------------------------------------------------

::

          -f, --full-name full-name
              Specify your real name.

          -o, --office office
              Specify your office room number.

          -p, --office-phone office-phone
              Specify your office phone number.

          -h, --home-phone home-phone
              Specify your home phone number.

          -u, --help
              Display help text and exit.

          -v, --version
              Display version information and exit.


---------------------------------------------------------------------------

::

          chfn reads the /etc/login.defs configuration file (see
          login.defs(5)). Note that the configuration file could be
          distributed with another package (e.g., shadow-utils). The
          following configuration items are relevant for chfn:

          CHFN_RESTRICT string
              Indicate which fields are changeable by chfn.

              The boolean setting "yes" means that only the Office, Office
              Phone and Home Phone fields are changeable, and boolean
              setting "no" means that also the Full Name is changeable.

              Another way to specify changeable fields is by abbreviations:
              f = Full Name, r = Office (room), w = Office (work) Phone, h
              = Home Phone. For example, CHFN_RESTRICT "wh" allows changing
              work and home phone numbers.

              If CHFN_RESTRICT is undefined, then all finger information is
              read-only. This is the default.


---------------------------------------------------------------

::

          Returns 0 if operation was successful, 1 if operation failed or
          command syntax was not valid.


-------------------------------------------------------

::

          Salvatore Valente <svalente@mit.edu>


---------------------------------------------------------

::

          chsh(1), finger(1), login.defs(5), passwd(5)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The chfn command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                        CHFN(1)

--------------

Pages that refer to this page:
`chsh(1@@shadow-utils) <../man1/chsh.1@@shadow-utils.html>`__, 
`passwd(5) <../man5/passwd.5.html>`__, 
`groupadd(8) <../man8/groupadd.8.html>`__, 
`groupdel(8) <../man8/groupdel.8.html>`__, 
`groupmems(8) <../man8/groupmems.8.html>`__, 
`groupmod(8) <../man8/groupmod.8.html>`__, 
`useradd(8) <../man8/useradd.8.html>`__, 
`userdel(8) <../man8/userdel.8.html>`__, 
`usermod(8) <../man8/usermod.8.html>`__

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
