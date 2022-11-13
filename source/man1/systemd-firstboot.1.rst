.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-firstboot(1) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CREDENTIALS <#CREDENTIALS>`__ \| |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `KERNEL COMMA                     |                                   |
| ND LINE <#KERNEL_COMMAND_LINE>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-FIRSTBOOT(1)        systemd-firstboot       SYSTEMD-FIRSTBOOT(1)

NAME
-------------------------------------------------

::

          systemd-firstboot, systemd-firstboot.service - Initialize basic
          system settings on or before the first boot-up of a system


---------------------------------------------------------

::

          systemd-firstboot [OPTIONS...]

          systemd-firstboot.service


---------------------------------------------------------------

::

          systemd-firstboot initializes the most basic system settings
          interactively on the first boot, or optionally non-interactively
          when a system image is created. The service is started if
          ConditionFirstBoot=yes is satisfied. This essentially means that
          /etc/ is empty, see systemd.unit(5) for details.

          The following settings may be set up:

          •   The system locale, more specifically the two locale variables
              LANG= and LC_MESSAGES

          •   The system keyboard map

          •   The system time zone

          •   The system hostname

          •   The machine ID of the system

          •   The root user's password

          Each of the fields may either be queried interactively by users,
          set non-interactively on the tool's command line, or be copied
          from a host system that is used to set up the system image.

          If a setting is already initialized, it will not be overwritten
          and the user will not be prompted for the setting.

          Note that this tool operates directly on the file system and does
          not involve any running system services, unlike localectl(1),
          timedatectl(1) or hostnamectl(1). This allows systemd-firstboot
          to operate on mounted but not booted disk images and in early
          boot. It is not recommended to use systemd-firstboot on the
          running system while it is up.


-------------------------------------------------------

::

          The following options are understood:

          --root=root
              Takes a directory path as an argument. All paths will be
              prefixed with the given alternate root path, including config
              search paths. This is useful to operate on a system image
              mounted to the specified directory instead of the host system
              itself.

          --image=path
              Takes a path to a disk image file or block device node. If
              specified all operations are applied to file system in the
              indicated disk image. This is similar to --root= but operates
              on file systems stored in disk images or block devices. The
              disk image should either contain just a file system or a set
              of file systems within a GPT partition table, following the
              Discoverable Partitions Specification[1]. For further
              information on supported disk images, see systemd-nspawn(1)'s
              switch of the same name.

          --locale=LOCALE, --locale-messages=LOCALE
              Sets the system locale, more specifically the LANG= and
              LC_MESSAGES settings. The argument should be a valid locale
              identifier, such as "de_DE.UTF-8". This controls the
              locale.conf(5) configuration file.

          --keymap=KEYMAP
              Sets the system keyboard layout. The argument should be a
              valid keyboard map, such as "de-latin1". This controls the
              "KEYMAP" entry in the vconsole.conf(5) configuration file.

          --timezone=TIMEZONE
              Sets the system time zone. The argument should be a valid
              time zone identifier, such as "Europe/Berlin". This controls
              the localtime(5) symlink.

          --hostname=HOSTNAME
              Sets the system hostname. The argument should be a hostname,
              compatible with DNS. This controls the hostname(5)
              configuration file.

          --machine-id=ID
              Sets the system's machine ID. This controls the machine-id(5)
              file.

          --root-password=PASSWORD, --root-password-file=PATH,
          --root-password-hashed=HASHED_PASSWORD
              Sets the password of the system's root user. This
              creates/modifies the passwd(5) and shadow(5) files. This
              setting exists in three forms: --root-password= accepts the
              password to set directly on the command line,
              --root-password-file= reads it from a file and
              --root-password-hashed= accepts an already hashed password on
              the command line. See shadow(5) for more information on the
              format of the hashed password. Note that it is not
              recommended to specify plaintext passwords on the command
              line, as other users might be able to see them simply by
              invoking ps(1).

          --root-shell=SHELL
              Sets the shell of the system's root user. This
              creates/modifies the passwd(5) file.

          --kernel-command-line=CMDLINE
              Sets the system's kernel command line. This controls the
              /etc/kernel/cmdline file which is used by kernel-install(8).

          --prompt-locale, --prompt-keymap, --prompt-timezone,
          --prompt-hostname, --prompt-root-password, --prompt-root-shell
              Prompt the user interactively for a specific basic setting.
              Note that any explicit configuration settings specified on
              the command line take precedence, and the user is not
              prompted for it.

          --prompt
              Query the user for locale, keymap, timezone, hostname, root's
              password, and root's shell. This is equivalent to specifying
              --prompt-locale, --prompt-keymap, --prompt-timezone,
              --prompt-hostname, --prompt-root-password,
              --prompt-root-shell in combination.

          --copy-locale, --copy-keymap, --copy-timezone,
          --copy-root-password, --copy-root-shell
              Copy a specific basic setting from the host. This only works
              in combination with --root= (see above).

          --copy
              Copy locale, keymap, time zone, root password and shell from
              the host. This is equivalent to specifying --copy-locale,
              --copy-keymap, --copy-timezone, --copy-root-password,
              --copy-root-shell in combination.

          --setup-machine-id
              Initialize the system's machine ID to a random ID. This only
              works in combination with --root=.

          --force
              systemd-firstboot doesn't modify existing files unless
              --force is specified. For modifications to /etc/passwd and
              /etc/shadow, systemd-firstboot only modifies the entry of the
              "root" user instead of overwriting the entire file.

          --delete-root-password
              Removes the password of the system's root user, enabling
              login as root without a password unless the root account is
              locked. Note that this is extremely insecure and hence this
              option should not be used lightly.

          --welcome=
              Takes a boolean argument. By default when prompting the user
              for configuration options a brief welcome text is shown
              before the first question is asked. Pass false to this option
              to turn off the welcome text.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------------

::

          systemd-firstboot supports the service credentials logic as
          implemented by LoadCredential=/SetCredential= (see
          systemd.exec(1) for details). The following credentials are used
          when passed in:

          "passwd.hashed-password.root", "passwd.plaintext-password.root"
              A hashed or plaintext version of the root password to use, in
              place of prompting the user. These credentials are equivalent
              to the same ones defined for the systemd-sysusers.service(8)
              service.

          "passwd.shell.root"
              Specifies the shell binary to use for the specified account.
              Equivalent to the credential of the same name defined for the
              systemd-sysusers.service(8) service.

          "firstboot.locale", "firstboot.locale-messages"
              These credentials specify the locale settings to set during
              first boot, in place of prompting the user.

          "firstboot.keymap"
              This credential specifies the keyboard setting to set during
              first boot, in place of prompting the user.

          "firstboot.timezone"
              This credential specifies the system timezone setting to set
              during first boot, in place of prompting the user.

          Note that by default the systemd-firstboot.service unit file is
          set up to inherit the listed credentials from the service
          manager. Thus, when invoking a container with an unpopulated
          /etc/ for the first time it is possible to configure the root
          user's password to be "systemd" like this:

              # systemd-nspawn --image=... --set-credential=firstboot.locale:de_DE.UTF-8 ...

          Note that these credentials are only read and applied during the
          first boot process. Once they are applied they remain applied for
          subsequent boots, and the credentials are not considered anymore.


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


-------------------------------------------------------------------------------

::

          systemd.firstboot=
              Takes a boolean argument, defaults to on. If off,
              systemd-firstboot.service won't interactively query the user
              for basic settings at first boot, even if those settings are
              not initialized yet.


---------------------------------------------------------

::

          systemd(1), locale.conf(5), vconsole.conf(5), localtime(5),
          hostname(5), machine-id(5), shadow(5),
          systemd-machine-id-setup(1), localectl(1), timedatectl(1),
          hostnamectl(1)


---------------------------------------------------

::

           1. Discoverable Partitions Specification
              https://systemd.io/DISCOVERABLE_PARTITIONS

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

   systemd 249                                         SYSTEMD-FIRSTBOOT(1)

--------------

Pages that refer to this page:
`hostnamectl(1) <../man1/hostnamectl.1.html>`__, 
`localectl(1) <../man1/localectl.1.html>`__, 
`systemd-machine-id-setup(1) <../man1/systemd-machine-id-setup.1.html>`__, 
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`timedatectl(1) <../man1/timedatectl.1.html>`__, 
`hostname(5) <../man5/hostname.5.html>`__, 
`locale.conf(5) <../man5/locale.conf.5.html>`__, 
`localtime(5) <../man5/localtime.5.html>`__, 
`machine-id(5) <../man5/machine-id.5.html>`__, 
`systemd-machine-id-commit.service(8) <../man8/systemd-machine-id-commit.service.8.html>`__

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
