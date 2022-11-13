.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

`Go to the version of this page provided by the util-linux
project <chfn.1.html>`__

--------------

chfn(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CHFN(1)                       User Commands                      CHFN(1)

NAME
-------------------------------------------------

::

          chfn - change real user name and information


---------------------------------------------------------

::

          chfn [options] [LOGIN]


---------------------------------------------------------------

::

          The chfn command changes user fullname, office room number,
          office phone number, and home phone number information for a
          user's account. This information is typically printed by
          finger(1) and similar programs. A normal user may only change the
          fields for her own account, subject to the restrictions in
          /etc/login.defs. (The default configuration is to prevent users
          from changing their fullname.) The superuser may change any field
          for any account. Additionally, only the superuser may use the -o
          option to change the undefined portions of the GECOS field.

          These fields must not contain any colons. Except for the other
          field, they should not contain any comma or equal sign. It is
          also recommended to avoid non-US-ASCII characters, but this is
          only enforced for the phone numbers. The other field is used to
          store accounting information used by other applications.


-------------------------------------------------------

::

          The options which apply to the chfn command are:

          -f, --full-name FULL_NAME
              Change the user's full name.

          -h, --home-phone HOME_PHONE
              Change the user's home phone number.

          -o, --other OTHER
              Change the user's other GECOS information. This field is used
              to store accounting information used by other applications,
              and can be changed only by a superuser.

          -r, --room ROOM_NUMBER
              Change the user's room number.

          -R, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.

          -u, --help
              Display help message and exit.

          -w, --work-phone WORK_PHONE
              Change the user's office phone number.

          If none of the options are selected, chfn operates in an
          interactive fashion, prompting the user with the current values
          for all of the fields. Enter the new value to change the field,
          or leave the line blank to use the current value. The current
          value is displayed between a pair of [ ] marks. Without options,
          chfn prompts for the current user account.


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:

          CHFN_RESTRICT (string)
              This parameter specifies which values in the gecos field of
              the /etc/passwd file may be changed by regular users using
              the chfn program. It can be any combination of letters f, r,
              w, h, for Full name, Room number, Work phone, and Home phone,
              respectively. For backward compatibility, yes is equivalent
              to rwh and no is equivalent to frwh. If not specified, only
              the superuser can make any changes. The most restrictive
              setting is better achieved by not installing chfn SUID.


---------------------------------------------------

::

          /etc/login.defs
              Shadow password suite configuration.

          /etc/passwd
              User account information.


---------------------------------------------------------

::

          chsh(1), login.defs(5), passwd(5).

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

   shadow-utils 4.8.1             08/27/2021                        CHFN(1)

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
