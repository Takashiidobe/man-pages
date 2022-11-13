.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-otp(5) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `ACKN                             |                                   |
| OWLEDGEMENT <#ACKNOWLEDGEMENT>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO_OTP(5)               File Formats Manual              SLAPO_OTP(5)

NAME
-------------------------------------------------

::

          slapo-otp - OATH One-Time Password module


---------------------------------------------------------

::

          moduleload otp.la


---------------------------------------------------------------

::

          The otp module allows time-based one-time password, AKA
          "authenticator-style", and HMAC-based one-time password
          authentication to be used in conjunction with a standard LDAP
          password for two-factor authentication.

          With this module, users would use their password, followed with
          the one-time password in the password prompt to authenticate.

          The password needed for a user to authenticate is calculated
          based on a counter (current time in case of TOTP) and a key that
          is referenced in the user's LDAP entry. Since the password is
          based on the time or number of uses, it changes periodically.
          Once used, it cannot be used again so keyloggers and shoulder-
          surfers are thwarted. A mobile phone application, such as the
          Google Authenticator or YubiKey (a prover), can be used to
          calculate the user's current one-time password, which is
          expressed as a (usually six-digit) number.

          Alternatively, the value can be calculated by some other
          application with access to the user's key and delivered to the
          user through SMS or some other channel. When prompted to
          authenticate, the user merely appends the code provided by the
          prover at the end of their password when authenticating.

          This implementation complies with RFC 4226 HOTP HMAC-Based One
          Time Passwords and RFC 6238 TOTP Time-based One Time Passwords
          and includes support for the SHA-1, SHA-256, and SHA-512 HMAC
          algorithms.

          The HMAC key used in the OTP computation is stored in the
          oathOTPToken entry referenced in the user's LDAP entry and the
          parameters are stored in the oathOTPParams LDAP entry referenced
          in the token.


-------------------------------------------------------------------

::

          Once the module is configured on the database, it will intercept
          LDAP simple binds for users whose LDAP entry has any of the
          oathOTPUser derived objectlasses attached to it. The attributes
          linking the user and the shared secret are:

                 oathTOTPToken: <dn>
                        Mandatory for oathTOTPUser, indicates that the
                        named entry is designated to hold the time-based
                        one-time password shared secret and the last
                        password used.

                 oathHOTPToken: <dn>
                        Mandatory for oathHOTPUser, indicates that the
                        named entry is designated to hold the one-time
                        password shared secret and the last password used.

                 oathTOTPParams: <dn>
                        Mandatory for oathTOTPToken, indicates that the
                        named entry is designated to hold the parameters to
                        generate time-based one-time password shared
                        secret: its length and algorithm to use as well as
                        the length of each time step and the grace period.

                 oathHOTPParams: <dn>
                        Mandatory for oathHOTPToken, indicates that the
                        named entry is designated to hold the parameters to
                        generate one-time password shared secret: its
                        length and algorithm to use as well as the
                        permitted number of passwords to skip.

          The following parts of the OATH-LDAP schema are implemented.

          General attributes:

                 oathSecret: <data>
                        The shared secret is stored here as raw bytes.

                 oathOTPLength: <length>
                        The password length, usually 6.

                 oathHMACAlgorithm: <OID>
                        The OID of the hash algorithm to use as defined in
                        RFC 8018.  Supported algorithms include SHA1,
                        SHA224, SHA256, SHA384 and SHA512.

          The HOTP attributes:

                 oathHOTPLookAhead: <number>
                        The number of successive HOTP tokens that can be
                        skipped.

                 oathHOTPCounter: <number>
                        The order of the last HOTP token successfully
                        redeemed by the user.

          The TOTP attributes:

                 oathTOTPTimeStepPeriod: <seconds>
                        The length of the time-step period for TOTP
                        calculation.

                 oathTOTPLastTimeStep: <number>
                        The order of the last TOTP token successfully
                        redeemed by the user.

                 oathTOTPTimeStepWindow: <number>
                        The number of time periods around the current time
                        to try when checking the password provided by the
                        user.

                 oathTOTPTimeStepDrift: <number>
                        If the client didn't provide the correct token but
                        it still fit with oathTOTPTimeStepWindow above,
                        this attribute records the current offset to
                        provide for slow clock drift of the client device.


---------------------------------------------------------

::

          slapd-config(5).


-----------------------------------------------------------------------

::

          This work was developed by Ondřej Kuzník and Howard Chu of Symas
          Corporation for inclusion in OpenLDAP Software.

          This work reuses the OATH-LDAP schema developed by Michael
          Ströder.

COLOPHON
---------------------------------------------------------

::

          This page is part of the OpenLDAP (an open source implementation
          of the Lightweight Directory Access Protocol) project.
          Information about the project can be found at 
          ⟨http://www.openldap.org/⟩.  If you have a bug report for this
          manual page, see ⟨http://www.openldap.org/its/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.openldap.org/openldap/openldap.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   SLAPO-OTP                       2018/6/29                   SLAPO_OTP(5)

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
