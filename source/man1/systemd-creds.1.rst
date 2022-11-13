.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-creds(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-CREDS(1)              systemd-creds             SYSTEMD-CREDS(1)

NAME
-------------------------------------------------

::

          systemd-creds - Lists, shows, encrypts and decrypts service
          credentials


---------------------------------------------------------

::

          systemd-creds [OPTIONS...]


---------------------------------------------------------------

::

          systemd-creds is a tool for listing, showing, encrypting and
          decrypting unit credentials. Credentials are limited-size binary
          or textual objects that may be passed to unit processes. They are
          primarily used for passing cryptographic keys (both public and
          private) or certificates, user account information or identity
          information from the host to services.

          Credentials are configured in unit files via the LoadCredential=,
          SetCredential=, LoadCredentialEncrypted= and
          SetCredentialEncrypted= settings, see systemd.exec(5) for
          details.


---------------------------------------------------------

::

          The following commands are understood:

          list
              Show a list of credentials passed into the current execution
              context. This command shows the files in the directory
              referenced by the $CREDENTIALS_DIRECTORY environment
              variable, and is intended to be executed from within service
              context.

              Along with each credential name, the size and security state
              is shown. The latter is one of "secure" (in case the
              credential is backed by unswappable memory, i.e.  "ramfs"),
              "weak" (in case it is backed by any other type of memory), or
              "insecure" (if having any access mode that is not 0400, i.e.
              if readable by anyone but the owner).

          cat credential...
              Show contents of specified credentials passed into the
              current execution context. Takes one or more credential
              names, whose contents shall be written to standard output.

              When combined with --json= or --transcode= the output is
              transcoded in simple ways before outputting.

          setup
              Generates a host encryption key for credentials, if none has
              been generated before. This ensures the
              /var/lib/systemd/credential.secret file is initialized with a
              random secret key if it doesn't exist yet. This secret key is
              used when encrypting/decrypting credentials with encrypt or
              decrypt, and is only accessible to the root user. Note that
              there's typically no need to invoke this command explicitly
              as it is implicitly called when encrypt is invoked, and
              credential host key encryption selected.

          encrypt input output
              Loads the specified (unencrypted plaintext) input credential
              file, encrypts it and writes the (encrypted ciphertext)
              version to the specified output credential file. The
              resulting file may be referenced in the
              LoadCredentialEncrypted= setting in unit files, or its
              contents used literally in SetCredentialEncrypted= settings.

              Takes two file system paths. The file name part of the output
              path is embedded as name in the encrypted credential, to
              ensure encrypted credentials cannot be renamed and reused for
              different purposes without this being noticed. The credential
              name to embed may be overridden with the --name= setting. The
              input or output paths may be specified as "-", in which case
              the credential data is read from/written to standard input
              and standard output. If the output path is specified as "-"
              the credential name cannot be derived from the file system
              path, and thus should be specified explicitly via the --name=
              switch.

              The credential data is encrypted symmetrically with one of
              the following encryption keys:

               1. A secret key automatically derived from the system's TPM2
                  chip. This encryption key is not stored on the host
                  system and thus decryption is only possible with access
                  to the original TPM2 chip. Or in other words, the
                  credential secured in this way can only be decrypted
                  again by the local machine.

               2. A secret key stored in the
                  /var/lib/systemd/credential.secret file which is only
                  accessible to the root user. This "host" encryption key
                  is stored on the host file system, and thus decryption is
                  possible with access to the host file system and
                  sufficient privileges. The key is automatically generated
                  when needed, but can also be created explicitly with the
                  setup command, see above.

               3. A combination of the above: an encryption key derived
                  from both the TPM2 chip and the host file system. This
                  means decryption requires both access to the original
                  TPM2 chip and the OS installation. This is the default
                  mode of operation if a TPM2 chip is available and
                  /var/lib/systemd/ resides on persistent media.

              Which of the three keys shall be used for encryption may be
              configured with the --with-key= switch. Depending on the
              use-case for the encrypted credential the key to use may
              differ. For example, for credentials that shall be accessible
              from the initial RAM disk (initrd) of the system encryption
              with the host key is not appropriate since access to the host
              key is typically not available from the initrd. Thus, for
              such credentials only the TPM2 key should be used.

              Encrypted credentials are always encoded in Base64.

              Use decrypt (see below) to undo the encryption operation, and
              acquire the decrypted plaintext credential from the encrypted
              ciphertext credential.

              The credential data is encrypted using AES256-GCM, i.e.
              providing both confidentiality and integrity, keyed by a
              SHA256 hash of one or both of the secret keys described
              above.

          decrypt input [output]
              Undoes the effect of the encrypt operation: loads the
              specified (encrypted ciphertext) input credential file,
              decrypts it and writes the (decrypted plaintext) version to
              the specified output credential file.

              Takes one or two file system paths. The file name part of the
              input path is compared with the credential name embedded in
              the encrypted file. If it does not match decryption fails.
              This is done in order to ensure that encrypted credentials
              are not re-purposed without this being detected. The
              credential name to compare with the embedded credential name
              may also be overridden with the --name= switch. If only one
              path is specified (or the output path specified as "-") it is
              taken as input path and the decrypted credential is written
              to standard output. If the input path is specified as "-" the
              encrypted credential is read from standard input. In this
              mode, the expected name embedded in the credential cannot be
              derived from the path and should be specified explicitly with
              --name=.

              Decrypting credentials requires access to the original TPM2
              chip and/or credentials host key, see above. Information
              about which keys are required is embedded in the encrypted
              credential data, and thus decryption is entirely automatic.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


-------------------------------------------------------

::

          --system
              When specified with the list and cat commands operates on the
              credentials passed to system as a whole instead of on those
              passed to the current execution context. This is useful in
              container environments where credentials may be passed in
              from the container manager.

          --transcode=
              When specified with the cat or decrypt commands, transcodes
              the output before showing it. Takes one of "base64",
              "unbase64", "hex" or "unhex" as argument, in order to
              encode/decode the credential data with Base64 or as series of
              hexadecimal values.

              Note that this has no effect on the encrypt command, as
              encrypted credentials are unconditionally encoded in Base64.

          --newline=
              When specified with cat or decrypt controls whether to add a
              trailing newline character to the end of the output if it
              doesn't end in one, anyway. Takes one of "auto", "yes" or
              "no". The default mode of "auto" will suffix the output with
              a single newline character only when writing credential data
              to a TTY.

          --pretty, -p
              When specified with encrypt controls whether to show the
              encrypted credential as SetCredentialEncrypted= setting that
              may be pasted directly into a unit file.

          --name=name
              When specified with the encrypt command controls the
              credential name to embed in the encrypted credential data. If
              not specified the name is chosen automatically from the
              filename component of the specified output path. If specified
              as empty string no credential name is embedded in the
              encrypted credential, and no verification of credential name
              is done when the credential is decrypted.

              When specified with the decrypt command control the
              credential name to validate the credential name embedded in
              the encrypted credential with. If not specified the name is
              chosen automatically from the filename component of the
              specified input path. If no credential name is embedded in
              the encrypted credential file (i.e. the --name= with an empty
              string was used when encrypted) the specified name has no
              effect as no credential name validation is done.

              Embedding the credential name in the encrypted credential is
              done in order to protect against reuse of credentials for
              purposes they weren't originally intended for, under the
              assumption the credential name is chosen carefully to encode
              its intended purpose.

          --timestamp=timestamp
              When specified with the encrypt command controls the
              timestamp to embed into the encrypted credential. Defaults to
              the current time. Takes a timestamp specification in the
              format described in systemd.time(5).

              When specified with the decrypt command controls the
              timestamp to use to validate the "not-after" timestamp that
              was configured with --not-after= during encryption. If not
              specified defaults to the current system time.

          --not-after=timestamp
              When specified with the encrypt command controls the time
              when the credential shall not be used anymore. This embeds
              the specified timestamp in the encrypted credential. During
              decryption the timestamp is checked against the current
              system clock, and if the timestamp is in the past the
              decryption will fail. By default no such timestamp is set.
              Takes a timestamp specification in the format described in
              systemd.time(5).

          --with-key=, -H, -T
              When specified with the encrypt command controls the
              encryption key to use. Takes one of "host", "tpm2",
              "host+tpm2" or "auto". See above for details on the three key
              types. If set to "auto" (which is the default) the TPM2 key
              is used if a TPM2 device is found and not running in a
              container. The host key is used if /var/lib/systemd/ is on
              persistent media. This means on typical systems the
              encryption is by default bound to both the TPM2 chip and the
              OS installation, and both need to be available to decrypt the
              credential again. If "auto" is selected but neither TPM2 is
              available (or running in container) nor /var/lib/systemd/ is
              on persistent media, encryption will fail.

              The -H switch is a shortcut for --with-key=host. Similar, -T
              is a shortcut for -with-key=tpm2.

              When encrypting credentials that shall be used in the initial
              RAM disk (initrd) where /var/lib/systemd/ is typically not
              available make sure to use --with-key=tpm2 mode, to disable
              binding against the host secret.

              This switch has no effect on the decrypt command, as
              information on which key to use for decryption is included in
              the encrypted credential already.

          --tpm2-device=PATH
              Controls the TPM2 device to use. Expects a device node path
              referring to the TPM2 chip (e.g.  /dev/tpmrm0). Alternatively
              the special value "auto" may be specified, in order to
              automatically determine the device node of a suitable TPM2
              device (of which there must be exactly one). The special
              value "list" may be used to enumerate all suitable TPM2
              devices currently discovered.

          --tpm2-pcrs= [PCR...]
              Configures the TPM2 PCRs (Platform Configuration Registers)
              to bind the encryption key to. Takes a "+" separated list of
              numeric PCR indexes in the range 0...23. If not used,
              defaults to PCR 7 only. If an empty string is specified,
              binds the encryption key to no PCRs at all. For details about
              the PCRs available, see the documentation of the switch of
              the same name for systemd-cryptenroll(1).

          --no-pager
              Do not pipe output into a pager.

          --no-legend
              Do not print the legend, i.e. column headers and the footer
              with hints.

          --json=MODE
              Shows output formatted as JSON. Expects one of "short" (for
              the shortest possible output without any redundant whitespace
              or line breaks), "pretty" (for a pretty version of the same,
              with indentation and line breaks) or "off" (to turn off JSON
              output, the default).


---------------------------------------------------------------

::

          On success, 0 is returned.


---------------------------------------------------------

::

          Example 1. Encrypt a password for use as credential

          The following command line encrypts the specified password
          "hunter2", writing the result to a file password.cred.

              # echo -n hunter2 | systemd-creds encrypt - password.cred

          This decrypts the file password.cred again, revealing the literal
          password:

              # systemd-creds decrypt password.cred
              hunter2

          Example 2. Encrypt a password and include it in a unit file

          The following command line prompts the user for a password and
          generates a SetCredentialEncrypted= line from it for a credential
          named "mysql-password", suitable for inclusion in a unit file.

              # systemd-ask-password -n | systemd-creds encrypt --name=mysql-password -p - -
              🔐 Password: ****
              SetCredentialEncrypted=mysql-password: \
                      k6iUCUh0RJCQyvL8k8q1UyAAAAABAAAADAAAABAAAAASfFsBoPLIm/dlDoGAAAAAAAAAA \
                      NAAAAAgAAAAAH4AILIOZ3w6rTzYsBy9G7liaCAd4i+Kpvs8mAgArzwuKxd0ABDjgSeO5k \
                      mKQc58zM94ZffyRmuNeX1lVHE+9e2YD87KfRFNoDLS7F3YmCb347gCiSk2an9egZ7Y0Xs \
                      700Kr6heqQswQEemNEc62k9RJnEl2q7SbcEYguegnPQUATgAIAAsAAAASACA/B90W7E+6 \
                      yAR9NgiIJvxr9bpElztwzB5lUJAxtMBHIgAQACCaSV9DradOZz4EvO/LSaRyRSq2Hj0ym \
                      gVJk/dVzE8Uxj8H3RbsT7rIBH02CIgm/Gv1ukSXO3DMHmVQkDG0wEciyageTfrVEer8z5 \
                      9cUQfM5ynSaV2UjeUWEHuz4fwDsXGLB9eELXLztzUU9nsAyLvs3ZRR+eEK/A==

          The generated line can be pasted 1:1 into a unit file, and will
          ensure the acquired password will be made available in the
          $CREDENTIALS_DIRECTORY/mysql-password credential file for the
          started service.

          Utilizing the unit file drop-in logic this can be used to
          securely pass a password credential to a unit. A similar, more
          comprehensive set of commands to insert a password into a service
          xyz.service:

              # mkdir -p /etc/systemd/system/xyz.service.d
              # systemd-ask-password -n | systemd-creds encrypt --name=mysql-password -p - - > /etc/systemd/system/xyz.service.d/50-password.conf
              # systemctl daemon-reload
              # systemctl restart xyz.service


---------------------------------------------------------

::

          systemd(1), systemd.exec(5)

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

   systemd 249                                             SYSTEMD-CREDS(1)

--------------

Pages that refer to this page:
`systemd.exec(5) <../man5/systemd.exec.5.html>`__

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
