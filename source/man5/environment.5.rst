.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_env.conf(5) — Linux manual page
===================================

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

   PAM_ENV.CONF(5)             Linux-PAM Manual             PAM_ENV.CONF(5)

NAME
-------------------------------------------------

::

          pam_env.conf, environment - the environment variables config
          files


---------------------------------------------------------------

::

          The /etc/security/pam_env.conf file specifies the environment
          variables to be set, unset or modified by pam_env(8). When
          someone logs in, this file is read and the environment variables
          are set according.

          Each line starts with the variable name, there are then two
          possible options for each variable DEFAULT and OVERRIDE. DEFAULT
          allows and administrator to set the value of the variable to some
          default value, if none is supplied then the empty string is
          assumed. The OVERRIDE option tells pam_env that it should enter
          in its value (overriding the default value) if there is one to
          use. OVERRIDE is not used, "" is assumed and no override will be
          done.

          VARIABLE [DEFAULT=[value]] [OVERRIDE=[value]]

          (Possibly non-existent) environment variables may be used in
          values using the ${string} syntax and (possibly non-existent)
          PAM_ITEMs as well as HOME and SHELL may be used in values using
          the @{string} syntax. Both the $ and @ characters can be
          backslash escaped to be used as literal values values can be
          delimited with "", escaped " not supported. Note that many
          environment variables that you would like to use may not be set
          by the time the module is called. For example, ${HOME} is used
          below several times, but many PAM applications don't make it
          available by the time you need it. The special variables @{HOME}
          and @{SHELL} are expanded to the values for the user from his
          passwd entry.

          The "#" character at start of line (no space at front) can be
          used to mark this line as a comment line.

          The /etc/environment file specifies the environment variables to
          be set. The file must consist of simple NAME=VALUE pairs on
          separate lines. The pam_env(8) module will read the file after
          the pam_env.conf file.


---------------------------------------------------------

::

          These are some example lines which might be specified in
          /etc/security/pam_env.conf.

          Set the REMOTEHOST variable for any hosts that are remote,
          default to "localhost" rather than not being set at all

                    REMOTEHOST     DEFAULT=localhost OVERRIDE=@{PAM_RHOST}

          Set the DISPLAY variable if it seems reasonable

                    DISPLAY        DEFAULT=${REMOTEHOST}:0.0 OVERRIDE=${DISPLAY}

          Now some simple variables

                    PAGER          DEFAULT=less
                    MANPAGER       DEFAULT=less
                    LESS           DEFAULT="M q e h15 z23 b80"
                    NNTPSERVER     DEFAULT=localhost
                    PATH           DEFAULT=${HOME}/bin:/usr/local/bin:/bin\
                    :/usr/bin:/usr/local/bin/X11:/usr/bin/X11
                    XDG_DATA_HOME  @{HOME}/share/

          Silly examples of escaped variables, just to show how they work.

                    DOLLAR         DEFAULT=\$
                    DOLLARDOLLAR   DEFAULT=        OVERRIDE=\$${DOLLAR}
                    DOLLARPLUS     DEFAULT=\${REMOTEHOST}${REMOTEHOST}
                    ATSIGN         DEFAULT=""      OVERRIDE=\@


---------------------------------------------------------

::

          pam_env(8), pam.d(5), pam(8), environ(7)


-----------------------------------------------------

::

          pam_env was written by Dave Kinchlea <kinch@kinch.ark.com>.

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

   Linux-PAM Manual               04/01/2016                PAM_ENV.CONF(5)

--------------

Pages that refer to this page: `pam_env(8) <../man8/pam_env.8.html>`__

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
