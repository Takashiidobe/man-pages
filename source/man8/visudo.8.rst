.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

visudo(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SUPPORT <#SUPPORT>`__ \|         |                                   |
| `DISCLAIMER <#DISCLAIMER>`__ \|   |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VISUDO(8)              BSD System Manager's Manual             VISUDO(8)

NAME
-------------------------------------------------

::

        visudo — edit the sudoers file


---------------------------------------------------------

::

        visudo [-chqsV] [[-f] sudoers]


---------------------------------------------------------------

::

        visudo edits the sudoers file in a safe fashion, analogous to
        vipw(8).  visudo locks the sudoers file against multiple
        simultaneous edits, performs basic validity checks, and checks for
        syntax errors before installing the edited file.  If the sudoers
        file is currently being edited you will receive a message to try
        again later.

        visudo parses the sudoers file after editing and will not save the
        changes if there is a syntax error.  Upon finding an error, visudo
        will print a message stating the line number(s) where the error
        occurred and the user will receive the “What now?” prompt.  At this
        point the user may enter ‘e’ to re-edit the sudoers file, ‘x’ to
        exit without saving the changes, or ‘Q’ to quit and save changes.
        The ‘Q’ option should be used with extreme caution because if
        visudo believes there to be a syntax error, so will sudo and no one
        will be able to run sudo again until the error is fixed.  If ‘e’ is
        typed to edit the sudoers file after a syntax error has been
        detected, the cursor will be placed on the line where the error
        occurred (if the editor supports this feature).

        There are two sudoers settings that determine which editor visudo
        will run.

        editor    A colon (‘:’) separated list of editors allowed to be
                  used with visudo.  visudo will choose the editor that
                  matches the user's SUDO_EDITOR, VISUAL or EDITOR
                  environment variable if possible, or the first editor in
                  the list that exists and is executable.  Note that sudo
                  does not preserve the SUDO_EDITOR, VISUAL or EDITOR
                  environment variables unless they are present in the
                  env_keep list or the env_reset option is disabled in the
                  sudoers file.  The default editor path is /usr/bin/vi
                  which can be set at compile time via the --with-editor
                  configure option.

        env_editor
                  If set, visudo will use the value of the SUDO_EDITOR,
                  VISUAL or EDITOR environment variables before falling
                  back on the default editor list.  Note that visudo is
                  typically run as root so this option may allow a user
                  with visudo privileges to run arbitrary commands as root
                  without logging.  An alternative is to place a colon-
                  separated list of “safe” editors int the editor variable.
                  visudo will then only use SUDO_EDITOR, VISUAL or EDITOR
                  if they match a value specified in editor.  If the
                  env_reset flag is enabled, the SUDO_EDITOR, VISUAL and/or
                  EDITOR environment variables must be present in the
                  env_keep list for the env_editor flag to function when
                  visudo is invoked via sudo.  The default value is on,
                  which can be set at compile time via the
                  --with-env-editor configure option.

        The options are as follows:

        -c, --check
                    Enable check-only mode.  The existing sudoers file (and
                    any other files it includes) will be checked for syntax
                    errors.  If the path to the sudoers file was not
                    specified, visudo will also check the file owner and
                    mode.  A message will be printed to the standard output
                    describing the status of sudoers unless the -q option
                    was specified.  If the check completes successfully,
                    visudo will exit with a value of 0.  If an error is
                    encountered, visudo will exit with a value of 1.

        -f sudoers, --file=sudoers
                    Specify an alternate sudoers file location, see below.
                    As of version 1.8.27, the sudoers path can be specified
                    without using the -f option.

        -h, --help  Display a short help message to the standard output and
                    exit.

        -q, --quiet
                    Enable quiet mode.  In this mode details about syntax
                    errors are not printed.  This option is only useful
                    when combined with the -c option.

        -s, --strict
                    Enable strict checking of the sudoers file.  If an
                    alias is referenced but not actually defined or if
                    there is a cycle in an alias, visudo will consider this
                    a syntax error.  Note that it is not possible to
                    differentiate between an alias and a host name or user
                    name that consists solely of uppercase letters, digits,
                    and the underscore (‘_’) character.

        -V, --version
                    Print the visudo and sudoers grammar versions and exit.

        A sudoers file may be specified instead of the default,
        /etc/sudoers.  The temporary file used is the specified sudoers
        file with “.tmp” appended to it.  In check-only mode only, ‘-’ may
        be used to indicate that sudoers will be read from the standard
        input.  Because the policy is evaluated in its entirety, it is not
        sufficient to check an individual sudoers include file for syntax
        errors.

      Debugging and sudoers plugin arguments
        visudo versions 1.8.4 and higher support a flexible debugging
        framework that is configured via Debug lines in the sudo.conf(5)
        file.

        Starting with sudo 1.8.12, visudo will also parse the arguments to
        the sudoers plugin to override the default sudoers path name, UID,
        GID and file mode.  These arguments, if present, should be listed
        after the path to the plugin (i.e., after sudoers.so).  Multiple
        arguments may be specified, separated by white space.  For example:

              Plugin sudoers_policy sudoers.so sudoers_mode=0400

        The following arguments are supported:

        sudoers_file=pathname
                  The sudoers_file argument can be used to override the
                  default path to the sudoers file.

        sudoers_uid=uid
                  The sudoers_uid argument can be used to override the
                  default owner of the sudoers file.  It should be
                  specified as a numeric user-ID.

        sudoers_gid=gid
                  The sudoers_gid argument can be used to override the
                  default group of the sudoers file.  It must be specified
                  as a numeric group-ID (not a group name).

        sudoers_mode=mode
                  The sudoers_mode argument can be used to override the
                  default file mode for the sudoers file.  It should be
                  specified as an octal value.

        For more information on configuring sudo.conf(5), please refer to
        its manual.


---------------------------------------------------------------

::

        The following environment variables may be consulted depending on
        the value of the editor and env_editor sudoers settings:

        SUDO_EDITOR      Invoked by visudo as the editor to use

        VISUAL           Used by visudo if SUDO_EDITOR is not set

        EDITOR           Used by visudo if neither SUDO_EDITOR nor VISUAL
                         is set


---------------------------------------------------

::

        /etc/sudo.conf            Sudo front end configuration

        /etc/sudoers              List of who can run what

        /etc/sudoers.tmp          Default temporary file used by visudo


---------------------------------------------------------------

::

        In addition to reporting sudoers syntax errors, visudo may produce
        the following messages:

        sudoers file busy, try again later.
              Someone else is currently editing the sudoers file.

        /etc/sudoers: Permission denied
              You didn't run visudo as root.

        you do not exist in the passwd database
              Your user-ID does not appear in the system passwd database.

        Warning: {User,Runas,Host,Cmnd}_Alias referenced but not defined
              Either you are trying to use an undeclared
              {User,Runas,Host,Cmnd}_Alias or you have a user or host name
              listed that consists solely of uppercase letters, digits, and
              the underscore (‘_’) character.  In the latter case, you can
              ignore the warnings (sudo will not complain).  The message is
              prefixed with the path name of the sudoers file and the line
              number where the undefined alias was used.  In -s (strict)
              mode these are errors, not warnings.

        Warning: unused {User,Runas,Host,Cmnd}_Alias
              The specified {User,Runas,Host,Cmnd}_Alias was defined but
              never used.  The message is prefixed with the path name of
              the sudoers file and the line number where the unused alias
              was defined.  You may wish to comment out or remove the
              unused alias.

        Warning: cycle in {User,Runas,Host,Cmnd}_Alias
              The specified {User,Runas,Host,Cmnd}_Alias includes a
              reference to itself, either directly or through an alias it
              includes.  The message is prefixed with the path name of the
              sudoers file and the line number where the cycle was
              detected.  This is only a warning unless visudo is run in -s
              (strict) mode as sudo will ignore cycles when parsing the
              sudoers file.

        unknown defaults entry "name"
              The sudoers file contains a Defaults setting not recognized
              by visudo.


---------------------------------------------------------

::

        vi(1), sudo.conf(5), sudoers(5), sudo(8), vipw(8)


-------------------------------------------------------

::

        Many people have worked on sudo over the years; this version
        consists of code written primarily by:

              Todd C. Miller

        See the CONTRIBUTORS file in the sudo distribution
        (https://www.sudo.ws/contributors.html) for an exhaustive list of
        people who have contributed to sudo.


-------------------------------------------------------

::

        There is no easy way to prevent a user from gaining a root shell if
        the editor used by visudo allows shell escapes.


-------------------------------------------------

::

        If you feel you have found a bug in visudo, please submit a bug
        report at https://bugzilla.sudo.ws/


-------------------------------------------------------

::

        Limited free support is available via the sudo-users mailing list,
        see https://www.sudo.ws/mailman/listinfo/sudo-users to subscribe or
        search the archives.


-------------------------------------------------------------

::

        visudo is provided “AS IS” and any express or implied warranties,
        including, but not limited to, the implied warranties of
        merchantability and fitness for a particular purpose are
        disclaimed.  See the LICENSE file distributed with sudo or
        https://www.sudo.ws/license.html for complete details.

COLOPHON
---------------------------------------------------------

::

        This page is part of the sudo (execute a command as another user)
        project.  Information about the project can be found at
        https://www.sudo.ws/.  If you have a bug report for this manual
        page, see ⟨https://bugzilla.sudo.ws/⟩.  This page was obtained from
        the project's upstream Git repository
        ⟨https://github.com/sudo-project/sudo⟩ on 2021-08-27.  (At that
        time, the date of the most recent commit that was found in the
        repository was 2021-08-26.)  If you discover any rendering problems
        in this HTML version of the page, or you believe there is a better
        or more up-to-date source for the page, or you have corrections or
        improvements to the information in this COLOPHON (which is not part
        of the original manual page), send a mail to man-pages@man7.org

   Sudo 1.9.8                   August 27, 2020                  Sudo 1.9.8

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
