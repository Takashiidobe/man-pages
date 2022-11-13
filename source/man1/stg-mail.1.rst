.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stg-mail(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `STGIT <#STGIT>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STG-MAIL(1)                   StGit Manual                   STG-MAIL(1)

NAME
-------------------------------------------------

::

          stg-mail - Send a patch or series of patches by e-mail


---------------------------------------------------------

::

          stg mail  [options] [--] [<patch1>] [<patch2>] [<patch3>..<patch4>]


---------------------------------------------------------------

::

          Send a patch or a range of patches by e-mail using the SMTP
          server specified by the stgit.smtpserver configuration option, or
          the --smtp-server command line option. This option can also be an
          absolute path to sendmail followed by command line arguments.

          The From address and the e-mail format are generated from the
          template file passed as argument to --template (defaulting to
          .git/patchmail.tmpl or ~/.stgit/templates/patchmail.tmpl or
          /usr/share/stgit/templates/patchmail.tmpl). A patch can be sent
          as attachment using the --attach option in which case the
          mailattch.tmpl template will be used instead of patchmail.tmpl.

          The To/Cc/Bcc addresses can either be added to the template file
          or passed via the corresponding command line options. They can be
          e-mail addresses or aliases which are automatically expanded to
          the values stored in the [mail "alias"] section of GIT
          configuration files.

          A preamble e-mail can be sent using the --cover and/or
          --edit-cover options. The first allows the user to specify a file
          to be used as a template. The latter option will invoke the
          editor on the specified file (defaulting to .git/covermail.tmpl
          or ~/.stgit/templates/covermail.tmpl or
          /usr/share/stgit/templates/covermail.tmpl).

          All the subsequent e-mails appear as replies to the first e-mail
          sent (either the preamble or the first patch). E-mails can be
          seen as replies to a different e-mail by using the --in-reply-to
          option.

          SMTP authentication is also possible with --smtp-user and
          --smtp-password options, also available as configuration
          settings: smtpuser and smtppassword. TLS encryption can be
          enabled by --smtp-tls option and smtptls setting.

          The following variables are accepted by both the preamble and the
          patch e-mail templates:

              %(diffstat)s     - diff statistics
              %(number)s       - empty if only one patch is sent or 'patchnr/totalnr'
              %(snumber)s      - stripped version of '%(number)s'
              %(nspace)s       - ' ' if %(number)s is non-empty, otherwise empty string
              %(patchnr)s      - patch number
              %(sender)s       - 'sender'  or 'authname <authemail>' as per the config file
              %(totalnr)s      - total number of patches to be sent
              %(version)s      - 'version' string passed on the command line (or empty)
              %(vspace)s       - ' ' if %(version)s is non-empty, otherwise empty string

          In addition to the common variables, the preamble e-mail template
          accepts the following:

              %(shortlog)s     - first line of each patch description, listed by author

          In addition to the common variables, the patch e-mail template
          accepts the following:

              %(authdate)s     - patch creation date
              %(authemail)s    - author's email
              %(authname)s     - author's name
              %(commemail)s    - committer's e-mail
              %(commname)s     - committer's name
              %(diff)s         - unified diff of the patch
              %(fromauth)s     - 'From: author\n\n' if different from sender
              %(longdescr)s    - the rest of the patch description, after the first line
              %(patch)s        - patch name
              %(prefix)s       - 'prefix' string passed on the command line
              %(pspace)s       - ' ' if %(prefix)s is non-empty, otherwise empty string
              %(shortdescr)s   - the first line of the patch description


-------------------------------------------------------

::

          -a, --all
              E-mail all the applied patches.

          --to TO
              Add TO to the To: list.

          --cc CC
              Add CC to the Cc: list.

          --bcc BCC
              Add BCC to the Bcc: list.

          --auto
              Automatically cc the patch signers.

          --no-thread
              Do not send subsequent messages as replies.

          --unrelated
              Send patches without sequence numbering.

          --attach
              Send a patch as attachment.

          --attach-inline
              Send a patch inline and as an attachment.

          -v VERSION, --version VERSION
              Add VERSION to the [PATCH ...] prefix.

          --prefix PREFIX
              Add PREFIX to the [... PATCH ...] prefix.

          -t FILE, --template FILE
              Use FILE as the message template.

          -c FILE, --cover FILE
              Send FILE as the cover message.

          -e, --edit-cover
              Edit the cover message before sending.

          -E, --edit-patches
              Edit each patch before sending.

          -s SECONDS, --sleep SECONDS
              Sleep for SECONDS between e-mails sending.

          --in-reply-to REFID
              Use REFID as the reference id.

          --smtp-server HOST[:PORT] or "/path/to/sendmail -t -i"
              SMTP server or command to use for sending mail.

          -u USER, --smtp-user USER
              Username for SMTP authentication.

          -p PASSWORD, --smtp-password PASSWORD
              Password for SMTP authentication.

          -T, --smtp-tls
              Use SMTP with TLS encryption.

          -b BRANCH, --branch BRANCH
              Use BRANCH instead of the default branch.

          -m, --mbox
              Generate an mbox file instead of sending.

          --domain DOMAIN
              Use DOMAIN when generating message IDs (instead of the system
              hostname).

          --git
              Use git send-email (EXPERIMENTAL).

          -O OPTIONS, --diff-opts OPTIONS
              Extra options to pass to "git diff".


---------------------------------------------------

::

          Part of the StGit suite - see stg(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the stgit (Stacked Git) project.
          Information about the project can be found at 
          ⟨http://www.procode.org/stgit/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.procode.org/stgit/⟩.  This page
          was obtained from the project's upstream Git repository
          ⟨http://repo.or.cz/stgit.git⟩ on 2021-08-27.  (At that time, the
          date of the most recent commit that was found in the repository
          was 2021-04-20.)  If you discover any rendering problems in this
          HTML version of the page, or you believe there is a better or
          more up-to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   StGit 1.0-10-ga6b3             08/27/2021                    STG-MAIL(1)

--------------

Pages that refer to this page: `stg(1) <../man1/stg.1.html>`__

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
