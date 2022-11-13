.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-cryptsetup@.service(8) — Linux manual page
==================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-CRYPTSETUP@.SERVICE(8)-cryptsetup@.serviceCRYPTSETUP@.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-cryptsetup@.service, systemd-cryptsetup - Full disk
          decryption logic


---------------------------------------------------------

::

          systemd-cryptsetup@.service

          system-systemd\x2dcryptsetup.slice

          /usr/lib/systemd/systemd-cryptsetup


---------------------------------------------------------------

::

          systemd-cryptsetup@.service is a service responsible for setting
          up encrypted block devices. It is instantiated for each device
          that requires decryption for access.

          systemd-cryptsetup@.service instances are part of the
          system-systemd\x2dcryptsetup.slice slice, which is destroyed only
          very late in the shutdown procedure. This allows the encrypted
          devices to remain up until filesystems have been unmounted.

          systemd-cryptsetup@.service will ask for hard disk passwords via
          the password agent logic[1], in order to query the user for the
          password using the right mechanism at boot and during runtime.

          At early boot and when the system manager configuration is
          reloaded, /etc/crypttab is translated into
          systemd-cryptsetup@.service units by
          systemd-cryptsetup-generator(8).

          In order to unlock a volume a password or binary key is required.
          systemd-cryptsetup@.service tries to acquire a suitable password
          or binary key via the following mechanisms, tried in order:

           1. If a key file is explicitly configured (via the third column
              in /etc/crypttab), a key read from it is used. If a PKCS#11
              token, FIDO2 token or TPM2 device is configured (using the
              pkcs11-uri=, fido2-device=, tpm2-device= options) the key is
              decrypted before use.

           2. If no key file is configured explicitly this way, a key file
              is automatically loaded from
              /etc/cryptsetup-keys.d/volume.key and
              /run/cryptsetup-keys.d/volume.key, if present. Here too, if a
              PKCS#11/FIDO2/TPM2 token/device is configured, any key found
              this way is decrypted before use.

           3. If the try-empty-password option is specified it is then
              attempted to unlock the volume with an empty password.

           4. The kernel keyring is then checked for a suitable cached
              password from previous attempts.

           5. Finally, the user is queried for a password, possibly
              multiple times, unless the headless option is set.

          If no suitable key may be acquired via any of the mechanisms
          describes above, volume activation fails.


---------------------------------------------------------

::

          systemd(1), systemd-cryptsetup-generator(8), crypttab(5),
          systemd-cryptenroll(1), cryptsetup(8)


---------------------------------------------------

::

           1. password agent logic
              https://systemd.io/PASSWORD_AGENTS/

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                               SYSTEMD-CRYPTSETUP@.SERVICE(8)

--------------

Pages that refer to this page:
`systemd-cryptenroll(1) <../man1/systemd-cryptenroll.1.html>`__, 
`crypttab(5) <../man5/crypttab.5.html>`__, 
`systemd-cryptsetup-generator(8) <../man8/systemd-cryptsetup-generator.8.html>`__, 
`systemd-gpt-auto-generator(8) <../man8/systemd-gpt-auto-generator.8.html>`__

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
