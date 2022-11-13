.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_succeed_if(8) — Linux manual page
=====================================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_SUCCEED_IF(8)               Linux-PAM              PAM_SUCCEED_IF(8)

NAME
-------------------------------------------------

::

          pam_succeed_if - test account characteristics


---------------------------------------------------------

::

          pam_succeed_if.so [flag...] [condition...]


---------------------------------------------------------------

::

          pam_succeed_if.so is designed to succeed or fail authentication
          based on characteristics of the account belonging to the user
          being authenticated or values of other PAM items. One use is to
          select whether to load other modules based on this test.

          The module should be given one or more conditions as module
          arguments, and authentication will succeed only if all of the
          conditions are met.


-------------------------------------------------------

::

          The following flags are supported:

          debug
              Turns on debugging messages sent to syslog.

          use_uid
              Evaluate conditions using the account of the user whose UID
              the application is running under instead of the user being
              authenticated.

          quiet
              Don't log failure or success to the system log.

          quiet_fail
              Don't log failure to the system log.

          quiet_success
              Don't log success to the system log.

          audit
              Log unknown users to the system log.

          Conditions are three words: a field, a test, and a value to test
          for.

          Available fields are user, uid, gid, shell, home, ruser, rhost,
          tty and service:

          field < number
              Field has a value numerically less than number.

          field <= number
              Field has a value numerically less than or equal to number.

          field eq number
              Field has a value numerically equal to number.

          field >= number
              Field has a value numerically greater than or equal to
              number.

          field > number
              Field has a value numerically greater than number.

          field ne number
              Field has a value numerically different from number.

          field = string
              Field exactly matches the given string.

          field != string
              Field does not match the given string.

          field =~ glob
              Field matches the given glob.

          field !~ glob
              Field does not match the given glob.

          field in item:item:...
              Field is contained in the list of items separated by colons.

          field notin item:item:...
              Field is not contained in the list of items separated by
              colons.

          user ingroup group
              User is in given group.

          user notingroup group
              User is not in given group.

          user innetgr netgroup
              (user,host) is in given netgroup.

          user notinnetgr group
              (user,host) is not in given netgroup.


-----------------------------------------------------------------------------------

::

          All module types (account, auth, password and session) are
          provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              The condition was true.

          PAM_AUTH_ERR
              The condition was false.

          PAM_SERVICE_ERR
              A service error occurred or the arguments can't be parsed
              correctly.


---------------------------------------------------------

::

          To emulate the behaviour of pam_wheel, except there is no
          fallback to group 0:

              auth required pam_succeed_if.so quiet user ingroup wheel

          Given that the type matches, only loads the othermodule rule if
          the UID is over 500. Adjust the number after default to skip
          several rules.

              type [default=1 success=ignore] pam_succeed_if.so quiet uid > 500
              type required othermodule.so arguments...


---------------------------------------------------------

::

          glob(7), pam(8)


-----------------------------------------------------

::

          Nalin Dahyabhai <nalin@redhat.com>

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

   Linux-PAM                      04/01/2016              PAM_SUCCEED_IF(8)

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
