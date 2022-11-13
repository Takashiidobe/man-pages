.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

warnquota.conf(5) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WARNQUOTA.CONF(5)          File Formats Manual         WARNQUOTA.CONF(5)

NAME
-------------------------------------------------

::

          warnquota.conf - configuration for warnquota


---------------------------------------------------------

::

          /etc/warnquota.conf


---------------------------------------------------------------

::

          The warnquota.conf file stores a configuration for warnquota(8)
          tool which is used to notify a user or a group who exceeds its
          disk quota limits.

          The syntax is an option name followed by an equal sign and the
          option value.  White space characters surrounding the option
          names and values are allowed.

          Empty lines or lines starting with a hash sign or a semicolon are
          ignored.

          An option value can but does not have to be quoted. The value can
          span across multiple lines provided each previous line ends with
          a backslash.

          Some option values can contain formatting sequences which will be
          expanded to their respective values. Following sequences are
          recognized:

          %d     domain name
          %h     host name
          %i, %s user or group name
          %%     literal % character
          |      new-line character


-------------------------------------------------------

::

          CC_BEFORE
                 Send to copy-carbon address only when a user has less than
                 specified grace time left. Value is a number followed by a
                 time unit. Known units are seconds, minutes, hours, and
                 days.  Example: 5 days
          CC_TO  An e-mail address to put into copy-carbon (CC:) recipient
                 header. Default value is root.
          CHARSET
                 Defines character set for sent e-mails. Default value will
                 be current locale character set used when executing
                 warnquota command, if locale is not either C or POSIX.
                 Otherwise no character set will be specified in the e-
                 mails.
          FROM   Defines From: e-email address. Default value is
                 support@localhost.
          GROUP_MESSAGE
                 A text sent as an e-mail body if a group exceeds its
                 limits. This option recognizes formatting sequences.
          GROUP_SIGNATURE
                 A signature text appended to notification for a group.
                 Default value is a general explanation utilizing SUPPORT
                 and PHONE values. This option recognizes formatting
                 sequences.
          LDAP_BASEDN
                 Base distinguished name for LDAP queries.
          LDAP_BINDDN
                 Bind distinguished name for LDAP queries.
          LDAP_BINDPW
                 Bind password for LDAP queries.
          LDAP_DEFAULT_MAIL_DOMAIN
                 Default e-mail address domain of searched user if given
                 LDAP attribute does not specify any.
          LDAP_HOST
                 LDAP server name to connect to if LDAP_URI is not defined.
          LDAP_MAIL
                 A boolean controlling if LDAP has to be used to look up
                 user's e-mail address. Possible values are true and false.
                 Default value is false.
          LDAP_MAIL_ATTRIBUTE
                 The LDAP attribute which holds user's e-mail address.
          LDAP_PORT
                 LDAP server port number to connect to if LDAP_URI is not
                 defined.
          LDAP_SEARCH_ATTRIBUTE
                 The LDAP attribute which holds user's ID to look up.
          LDAP_URI
                 The URL of LDAP server to use to search user's e-mail
                 addresses. This option takes preference over LDAP_HOST and
                 LDAP_PORT.  Example: ldaps://example.com:389/
          MESSAGE
                 A beginning of text sent as an e-mail body if a user
                 exceeds his limits. This option recognizes formatting
                 sequences.
          MAIL_CMD
                 The command to execute to send an e-mail. The e-mail text
                 including all headers is passed to the standard input of
                 the command. Default value is /usr/lib/sendmail -t.
          MAILDEV
                 The device with disk quotas to exclude from sending
                 notifications if there are exceeded limits. This option
                 should identify the device where mail boxes are stored to
                 prevent from bouncing the warnquota notification by local
                 MDA due to no space for storing new e-mails. Special value
                 any denotes all devices.
          PHONE  The telephone contact to the user support. Default value
                 is (xxx) xxx-xxxx or (yyy) yyy-yyyy.
          SIGNATURE
                 The end of e-mail body if a user exceeds its limits.
                 Default value is a general explanation utilizing SUPPORT
                 and PHONE values. This option recognizes formatting
                 sequences.
          SUBJECT
                 The text to put into Subject: header. Default value is
                 Disk Quota usage on system.
          SUPPORT
                 The contact to the user support. Default value is
                 support@localhost.


-------------------------------------------------------

::

          # comment
          FROM = root@example.com
          SUPPORT = support@example.com
          PHONE = 1234


---------------------------------------------------

::

          /etc/warnquota.conf
                 configuration for warnquota(8)


---------------------------------------------------------

::

          warnquota(8).

COLOPHON
---------------------------------------------------------

::

          This page is part of the quota (Linux Diskquota Tools) project.
          Information about the project can be found at [unknown -- if you
          know, please contact man-pages@man7.org] It is not known how to
          report bugs for this man page; if you know, please send a mail to
          man-pages@man7.org.  This page was obtained from the project's
          upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/quota/quota-tools.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-20.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                          WARNQUOTA.CONF(5)

--------------

Pages that refer to this page:
`warnquota(8) <../man8/warnquota.8.html>`__

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
