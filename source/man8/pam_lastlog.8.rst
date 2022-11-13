.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_lastlog(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `MODULE TYPES PRO                 |                                   |
| VIDED <#MODULE_TYPES_PROVIDED>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_LASTLOG(8)              Linux-PAM Manual              PAM_LASTLOG(8)

NAME
-------------------------------------------------

::

          pam_lastlog - PAM module to display date of last login and
          perform inactive account lock out


---------------------------------------------------------

::

          pam_lastlog.so [debug] [silent] [never] [nodate] [nohost]
                         [noterm] [nowtmp] [noupdate] [showfailed]
                         [inactive=<days>]


---------------------------------------------------------------

::

          pam_lastlog is a PAM module to display a line of information
          about the last login of the user. In addition, the module
          maintains the /var/log/lastlog file.

          Some applications may perform this function themselves. In such
          cases, this module is not necessary.

          If the module is called in the auth or account phase, the
          accounts that were not used recently enough will be disallowed to
          log in. The check is not performed for the root account so the
          root is never locked out.


-------------------------------------------------------

::

          debug
              Print debug information.

          silent
              Don't inform the user about any previous login, just update
              the /var/log/lastlog file.

          never
              If the /var/log/lastlog file does not contain any old entries
              for the user, indicate that the user has never previously
              logged in with a welcome message.

          nodate
              Don't display the date of the last login.

          noterm
              Don't display the terminal name on which the last login was
              attempted.

          nohost
              Don't indicate from which host the last login was attempted.

          nowtmp
              Don't update the wtmp entry.

          noupdate
              Don't update any file.

          showfailed
              Display number of failed login attempts and the date of the
              last failed attempt from btmp. The date is not displayed when
              nodate is specified.

          inactive=<days>
              This option is specific for the auth or account phase. It
              specifies the number of days after the last login of the user
              when the user will be locked out by the module. The default
              value is 90.


-----------------------------------------------------------------------------------

::

          The auth and account module type allows to lock out users which
          did not login recently enough. The session module type is
          provided for displaying the information about the last login
          and/or updating the lastlog and wtmp files.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              Everything was successful.

          PAM_SERVICE_ERR
              Internal service module error.

          PAM_USER_UNKNOWN
              User not known.

          PAM_AUTH_ERR
              User locked out in the auth or account phase due to
              inactivity.

          PAM_IGNORE
              There was an error during reading the lastlog file in the
              auth or account phase and thus inactivity of the user cannot
              be determined.


---------------------------------------------------------

::

          Add the following line to /etc/pam.d/login to display the last
          login time of an user:

                  session  required  pam_lastlog.so nowtmp

          To reject the user if he did not login during the previous 50
          days the following line can be used:

                  auth  required  pam_lastlog.so inactive=50


---------------------------------------------------

::

          /var/log/lastlog
              Lastlog logging file


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_lastlog was written by Andrew G. Morgan <morgan@kernel.org>.

          Inactive account lock out added by Tomáš Mráz <tm@t8m.info>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the linux-pam (Pluggable Authentication
          Modules for Linux) project.  Information about the project can be
          found at ⟨http://www.linux-pam.org/⟩.  If you have a bug report
          for this manual page, see ⟨//www.linux-pam.org/⟩.  This page was
          obtained from the tarball Linux-PAM-1.3.0.tar.bz2 fetched from
          ⟨http://www.linux-pam.org/library/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Linux-PAM Manual               04/01/2016                 PAM_LASTLOG(8)

--------------

Pages that refer to this page: `su(1) <../man1/su.1.html>`__

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
