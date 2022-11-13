.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

faillog(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FAILLOG(8)             System Management Commands             FAILLOG(8)

NAME
-------------------------------------------------

::

          faillog - display faillog records or set login failure limits


---------------------------------------------------------

::

          faillog [options]


---------------------------------------------------------------

::

          faillog displays the contents of the failure log database
          (/var/log/faillog). It can also set the failure counters and
          limits. When faillog is run without arguments, it only displays
          the faillog records of the users who had a login failure.


-------------------------------------------------------

::

          The options which apply to the faillog command are:

          -a, --all
              Display (or act on) faillog records for all users having an
              entry in the faillog database.

              The range of users can be restricted with the -u option.

              In display mode, this is still restricted to existing users
              but forces the display of the faillog entries even if they
              are empty.

              With the -l, -m, -r, -t options, the users' records are
              changed, even if the user does not exist on the system. This
              is useful to reset records of users that have been deleted or
              to set a policy in advance for a range of users.

          -h, --help
              Display help message and exit.

          -l, --lock-secs SEC
              Lock account for SEC seconds after failed login.

              Write access to /var/log/faillog is required for this option.

          -m, --maximum MAX
              Set the maximum number of login failures after the account is
              disabled to MAX.

              Selecting a MAX value of 0 has the effect of not placing a
              limit on the number of failed logins.

              The maximum failure count should always be 0 for root to
              prevent a denial of services attack against the system.

              Write access to /var/log/faillog is required for this option.

          -r, --reset
              Reset the counters of login failures.

              Write access to /var/log/faillog is required for this option.

          -R, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.

          -t, --time DAYS
              Display faillog records more recent than DAYS.

          -u, --user LOGIN|RANGE
              Display faillog record or maintains failure counters and
              limits (if used with -l, -m or -r options) only for the
              specified user(s).

              The users can be specified by a login name, a numerical user
              ID, or a RANGE of users. This RANGE of users can be specified
              with a min and max values (UID_MIN-UID_MAX), a max value
              (-UID_MAX), or a min value (UID_MIN-).

          When none of the -l, -m, or -r options are used, faillog displays
          the faillog record of the specified user(s).


-------------------------------------------------------

::

          faillog only prints out users with no successful login since the
          last failure. To print out a user who has had a successful login
          since their last failure, you must explicitly request the user
          with the -u flag, or print out all users with the -a flag.


---------------------------------------------------

::

          /var/log/faillog
              Failure logging file.


---------------------------------------------------------

::

          login(1), faillog(5).

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

   shadow-utils 4.8.1             08/27/2021                     FAILLOG(8)

--------------

Pages that refer to this page: `faillog(5) <../man5/faillog.5.html>`__, 
`pam_tally(8) <../man8/pam_tally.8.html>`__

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
