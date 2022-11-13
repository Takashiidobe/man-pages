.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

time.conf(5) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TIME.CONF(5)                Linux-PAM Manual                TIME.CONF(5)

NAME
-------------------------------------------------

::

          time.conf - configuration file for the pam_time module


---------------------------------------------------------------

::

          The pam_time PAM module does not authenticate the user, but
          instead it restricts access to a system and or specific
          applications at various times of the day and on specific days or
          over various terminal lines. This module can be configured to
          deny access to (individual) users based on their name, the time
          of day, the day of week, the service they are applying for and
          their terminal from which they are making their request.

          For this module to function correctly there must be a correctly
          formatted /etc/security/time.conf file present. White spaces are
          ignored and lines maybe extended with '\' (escaped newlines).
          Text following a '#' is ignored to the end of the line.

          The syntax of the lines is as follows:

          services;ttys;users;times

          In words, each rule occupies a line, terminated with a newline or
          the beginning of a comment; a '#'. It contains four fields
          separated with semicolons, ';'.

          The first field, the services field, is a logic list of PAM
          service names that the rule applies to.

          The second field, the tty field, is a logic list of terminal
          names that this rule applies to.

          The third field, the users field, is a logic list of users or a
          netgroup of users to whom this rule applies.

          For these items the simple wildcard '*' may be used only once.
          With netgroups no wildcards or logic operators are allowed.

          The times field is used to indicate the times at which this rule
          applies. The format here is a logic list of day/time-range
          entries. The days are specified by a sequence of two character
          entries, MoTuSa for example is Monday Tuesday and Saturday. Note
          that repeated days are unset MoMo = no day, and MoWk = all
          weekdays bar Monday. The two character combinations accepted are
          Mo Tu We Th Fr Sa Su Wk Wd Al, the last two being week-end days
          and all 7 days of the week respectively. As a final example, AlFr
          means all days except Friday.

          Each day/time-range can be prefixed with a '!' to indicate
          "anything but". The time-range part is two 24-hour times HHMM,
          separated by a hyphen, indicating the start and finish time (if
          the finish time is smaller than the start time it is deemed to
          apply on the following day).

          For a rule to be active, ALL of service+ttys+users must be
          satisfied by the applying process.

          Note, currently there is no daemon enforcing the end of a
          session. This needs to be remedied.

          Poorly formatted rules are logged as errors using syslog(3).


---------------------------------------------------------

::

          These are some example lines which might be specified in
          /etc/security/time.conf.

          All users except for root are denied access to console-login at
          all times:

              login ; tty* & !ttyp* ; !root ; !Al0000-2400

          Games (configured to use PAM) are only to be accessed out of
          working hours. This rule does not apply to the user waster:

              games ; * ; !waster ; Wd0000-2400 | Wk1800-0800


---------------------------------------------------------

::

          pam_time(8), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_time was written by Andrew G. Morgan <morgan@kernel.org>.

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

   Linux-PAM Manual               04/01/2016                   TIME.CONF(5)

--------------

Pages that refer to this page: `pam_time(8) <../man8/pam_time.8.html>`__

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
