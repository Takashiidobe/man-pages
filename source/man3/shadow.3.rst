.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

shadow(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNTAX <#SYNTAX>`__ \|           |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SHADOW(3)                     Library Calls                    SHADOW(3)

NAME
-------------------------------------------------

::

          shadow, getspnam - encrypted password file routines


-----------------------------------------------------

::

          #include <shadow.h>

          struct spwd *getspent();

          struct spwd *getspnam(char *name);

          void setspent();

          void endspent();

          struct spwd *fgetspent(FILE *fp);

          struct spwd *sgetspent(char *cp);

          int putspent(struct spwd *p, FILE *fp);

          int lckpwdf();

          int ulckpwdf();


---------------------------------------------------------------

::

          shadow manipulates the contents of the shadow password file,
          /etc/shadow. The structure in the #include file is:

              struct spwd {
                    char          *sp_namp; /* user login name */
                    char          *sp_pwdp; /* encrypted password */
                    long int      sp_lstchg; /* last password change */
                    long int      sp_min; /* days until change allowed. */
                    long int      sp_max; /* days before change required */
                    long int      sp_warn; /* days warning for expiration */
                    long int      sp_inact; /* days before account inactive */
                    long int      sp_expire; /* date when account expires */
                    unsigned long int  sp_flag; /* reserved for future use */
              }

          The meanings of each field are:

          •   sp_namp - pointer to null-terminated user name

          •   sp_pwdp - pointer to null-terminated password

          •   sp_lstchg - days since Jan 1, 1970 password was last changed

          •   sp_min - days before which password may not be changed

          •   sp_max - days after which password must be changed

          •   sp_warn - days before password is to expire that user is
              warned of pending password expiration

          •   sp_inact - days after password expires that account is
              considered inactive and disabled

          •   sp_expire - days since Jan 1, 1970 when account will be
              disabled

          •   sp_flag - reserved for future use

.. _description-top-1:


---------------------------------------------------------------

::

          getspent, getspname, fgetspent, and sgetspent each return a
          pointer to a struct spwd.  getspent returns the next entry from
          the file, and fgetspent returns the next entry from the given
          stream, which is assumed to be a file of the proper format.
          sgetspent returns a pointer to a struct spwd using the provided
          string as input.  getspnam searches from the current position in
          the file for an entry matching name.

          setspent and endspent may be used to begin and end, respectively,
          access to the shadow password file.

          The lckpwdf and ulckpwdf routines should be used to insure
          exclusive access to the /etc/shadow file.  lckpwdf attempts to
          acquire a lock using pw_lock for up to 15 seconds. It continues
          by attempting to acquire a second lock using spw_lock for the
          remainder of the initial 15 seconds. Should either attempt fail
          after a total of 15 seconds, lckpwdf returns -1. When both locks
          are acquired 0 is returned.


---------------------------------------------------------------

::

          Routines return NULL if no more entries are available or if an
          error occurs during processing. Routines which have int as the
          return value return 0 for success and -1 for failure.


-------------------------------------------------------

::

          These routines may only be used by the superuser as access to the
          shadow password file is restricted.


---------------------------------------------------

::

          /etc/shadow
              Secure user account information.


---------------------------------------------------------

::

          getpwent(3), shadow(5).

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

   shadow-utils 4.8.1             08/27/2021                      SHADOW(3)

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
