.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

os-release(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   OS-RELEASE(5)                  os-release                  OS-RELEASE(5)

NAME
-------------------------------------------------

::

          os-release, initrd-release, extension-release - Operating system
          identification


---------------------------------------------------------

::

          /etc/os-release

          /usr/lib/os-release

          /etc/initrd-release

          /usr/lib/extension-release.d/extension-release.IMAGE


---------------------------------------------------------------

::

          The /etc/os-release and /usr/lib/os-release files contain
          operating system identification data.

          The basic file format of os-release is a newline-separated list
          of environment-like shell-compatible variable assignments. It is
          possible to source the configuration from shell scripts, however,
          beyond mere variable assignments, no shell features are supported
          (this means variable expansion is explicitly not supported),
          allowing applications to read the file without implementing a
          shell compatible execution engine. Variable assignment values
          must be enclosed in double or single quotes if they include
          spaces, semicolons or other special characters outside of A–Z,
          a–z, 0–9. Shell special characters ("$", quotes, backslash,
          backtick) must be escaped with backslashes, following shell
          style. All strings should be in UTF-8 format, and non-printable
          characters should not be used. It is not supported to concatenate
          multiple individually quoted strings. Lines beginning with "#"
          shall be ignored as comments. Blank lines are permitted and
          ignored.

          The file /etc/os-release takes precedence over
          /usr/lib/os-release. Applications should check for the former,
          and exclusively use its data if it exists, and only fall back to
          /usr/lib/os-release if it is missing. Applications should not
          read data from both files at the same time.  /usr/lib/os-release
          is the recommended place to store OS release information as part
          of vendor trees.  /etc/os-release should be a relative symlink to
          /usr/lib/os-release, to provide compatibility with applications
          only looking at /etc/. A relative symlink instead of an absolute
          symlink is necessary to avoid breaking the link in a chroot or
          initrd environment such as dracut.

          os-release contains data that is defined by the operating system
          vendor and should generally not be changed by the administrator.

          As this file only encodes names and identifiers it should not be
          localized.

          The /etc/os-release and /usr/lib/os-release files might be
          symlinks to other files, but it is important that the file is
          available from earliest boot on, and hence must be located on the
          root file system.

          For a longer rationale for os-release please refer to the
          Announcement of /etc/os-release[1].

      /etc/initrd-release
          In the initrd[2], /etc/initrd-release plays the same role as
          os-release in the main system. Additionally, the presence of that
          file means that the system is in the initrd phase.
          /etc/os-release should be symlinked to /etc/initrd-release (or
          vice versa), so programs that only look for /etc/os-release (as
          described above) work correctly.

          The rest of this document that talks about os-release should be
          understood to apply to initrd-release too.

      /usr/lib/extension-release.d/extension-release.IMAGE
          /usr/lib/extension-release.d/extension-release.IMAGE plays the
          same role for extension images as os-release for the main system,
          and follows the syntax and rules as described in the Portable
          Services Documentation[3]. The purpose of this file is to
          identify the extension and to allow the operating system to
          verify that the extension image matches the base OS. This is
          typically implemented by checking that the ID= options match, and
          either SYSEXT_LEVEL= exists and matches too, or if it is not
          present, VERSION_ID= exists and matches. This ensures ABI/API
          compatibility between the layers and prevents merging of an
          incompatible image in an overlay.

          In the extension-release.IMAGE filename, the IMAGE part must
          exactly match the file name of the containing image with the
          suffix removed. In case it is not possible to guarantee that an
          image file name is stable and doesn't change between the build
          and the deployment phases, it is possible to relax this check: if
          exactly one file whose name matches "extension-release.*"  is
          present in this directory, and the file is tagged with a
          user.extension-release.strict xattr(7) set to the string "0", it
          will be used instead.

          The rest of this document that talks about os-release should be
          understood to apply to extension-release too.


-------------------------------------------------------

::

          The following OS identifications parameters may be set using
          os-release:

      General information identifying the operating system
          NAME=
              A string identifying the operating system, without a version
              component, and suitable for presentation to the user. If not
              set, a default of "NAME=Linux" may be used.

              Examples: "NAME=Fedora", "NAME="Debian GNU/Linux"".

          ID=
              A lower-case string (no spaces or other characters outside of
              0–9, a–z, ".", "_" and "-") identifying the operating system,
              excluding any version information and suitable for processing
              by scripts or usage in generated filenames. If not set, a
              default of "ID=linux" may be used.

              Examples: "ID=fedora", "ID=debian".

          ID_LIKE=
              A space-separated list of operating system identifiers in the
              same syntax as the ID= setting. It should list identifiers of
              operating systems that are closely related to the local
              operating system in regards to packaging and programming
              interfaces, for example listing one or more OS identifiers
              the local OS is a derivative from. An OS should generally
              only list other OS identifiers it itself is a derivative of,
              and not any OSes that are derived from it, though symmetric
              relationships are possible. Build scripts and similar should
              check this variable if they need to identify the local
              operating system and the value of ID= is not recognized.
              Operating systems should be listed in order of how closely
              the local operating system relates to the listed ones,
              starting with the closest. This field is optional.

              Examples: for an operating system with "ID=centos", an
              assignment of "ID_LIKE="rhel fedora"" would be appropriate.
              For an operating system with "ID=ubuntu", an assignment of
              "ID_LIKE=debian" is appropriate.

          PRETTY_NAME=
              A pretty operating system name in a format suitable for
              presentation to the user. May or may not contain a release
              code name or OS version of some kind, as suitable. If not
              set, a default of "PRETTY_NAME="Linux"" may be used

              Example: "PRETTY_NAME="Fedora 17 (Beefy Miracle)"".

          CPE_NAME=
              A CPE name for the operating system, in URI binding syntax,
              following the Common Platform Enumeration Specification[4] as
              proposed by the NIST. This field is optional.

              Example: "CPE_NAME="cpe:/o:fedoraproject:fedora:17""

          VARIANT=
              A string identifying a specific variant or edition of the
              operating system suitable for presentation to the user. This
              field may be used to inform the user that the configuration
              of this system is subject to a specific divergent set of
              rules or default configuration settings. This field is
              optional and may not be implemented on all systems.

              Examples: "VARIANT="Server Edition"", "VARIANT="Smart
              Refrigerator Edition"".

              Note: this field is for display purposes only. The VARIANT_ID
              field should be used for making programmatic decisions.

          VARIANT_ID=
              A lower-case string (no spaces or other characters outside of
              0–9, a–z, ".", "_" and "-"), identifying a specific variant
              or edition of the operating system. This may be interpreted
              by other packages in order to determine a divergent default
              configuration. This field is optional and may not be
              implemented on all systems.

              Examples: "VARIANT_ID=server", "VARIANT_ID=embedded".

      Information about the version of the operating system
          VERSION=
              A string identifying the operating system version, excluding
              any OS name information, possibly including a release code
              name, and suitable for presentation to the user. This field
              is optional.

              Examples: "VERSION=17", "VERSION="17 (Beefy Miracle)"".

          VERSION_ID=
              A lower-case string (mostly numeric, no spaces or other
              characters outside of 0–9, a–z, ".", "_" and "-") identifying
              the operating system version, excluding any OS name
              information or release code name, and suitable for processing
              by scripts or usage in generated filenames. This field is
              optional.

              Examples: "VERSION_ID=17", "VERSION_ID=11.04".

          VERSION_CODENAME=
              A lower-case string (no spaces or other characters outside of
              0–9, a–z, ".", "_" and "-") identifying the operating system
              release code name, excluding any OS name information or
              release version, and suitable for processing by scripts or
              usage in generated filenames. This field is optional and may
              not be implemented on all systems.

              Examples: "VERSION_CODENAME=buster",
              "VERSION_CODENAME=xenial".

          BUILD_ID=
              A string uniquely identifying the system image originally
              used as the installation base. In most cases, VERSION_ID or
              IMAGE_ID+IMAGE_VERSION are updated when the entire system
              image is replaced during an update.  BUILD_ID may be used in
              distributions where the original installation image version
              is important: VERSION_ID would change during incremental
              system updates, but BUILD_ID would not. This field is
              optional.

              Examples: "BUILD_ID="2013-03-20.3"", "BUILD_ID=201303203".

          IMAGE_ID=
              A lower-case string (no spaces or other characters outside of
              0–9, a–z, ".", "_" and "-"), identifying a specific image of
              the operating system. This is supposed to be used for
              environments where OS images are prepared, built, shipped and
              updated as comprehensive, consistent OS images. This field is
              optional and may not be implemented on all systems, in
              particularly not on those that are not managed via images but
              put together and updated from individual packages and on the
              local system.

              Examples: "IMAGE_ID=vendorx-cashier-system",
              "IMAGE_ID=netbook-image".

          IMAGE_VERSION=
              A lower-case string (mostly numeric, no spaces or other
              characters outside of 0–9, a–z, ".", "_" and "-") identifying
              the OS image version. This is supposed to be used together
              with IMAGE_ID described above, to discern different versions
              of the same image.

              Examples: "IMAGE_VERSION=33", "IMAGE_VERSION=47.1rc1".

          To summarize: if the image updates are built and shipped as
          comprehensive units, IMAGE_ID+IMAGE_VERSION is the best fit.
          Otherwise, if updates eventually completely replace previously
          installed contents, as in a typical binary distribution,
          VERSION_ID should be used to identify major releases of the
          operating system.  BUILD_ID may be used instead or in addition to
          VERSION_ID when the original system image version is important.

      Presentation information and links
          HOME_URL=, DOCUMENTATION_URL=, SUPPORT_URL=, BUG_REPORT_URL=,
          PRIVACY_POLICY_URL=
              Links to resources on the Internet related to the operating
              system.  HOME_URL= should refer to the homepage of the
              operating system, or alternatively some homepage of the
              specific version of the operating system.  DOCUMENTATION_URL=
              should refer to the main documentation page for this
              operating system.  SUPPORT_URL= should refer to the main
              support page for the operating system, if there is any. This
              is primarily intended for operating systems which vendors
              provide support for.  BUG_REPORT_URL= should refer to the
              main bug reporting page for the operating system, if there is
              any. This is primarily intended for operating systems that
              rely on community QA.  PRIVACY_POLICY_URL= should refer to
              the main privacy policy page for the operating system, if
              there is any. These settings are optional, and providing only
              some of these settings is common. These URLs are intended to
              be exposed in "About this system" UIs behind links with
              captions such as "About this Operating System", "Obtain
              Support", "Report a Bug", or "Privacy Policy". The values
              should be in RFC3986 format[5], and should be "http:" or
              "https:" URLs, and possibly "mailto:" or "tel:". Only one URL
              shall be listed in each setting. If multiple resources need
              to be referenced, it is recommended to provide an online
              landing page linking all available resources.

              Examples: "HOME_URL="https://fedoraproject.org/"",
              "BUG_REPORT_URL="https://bugzilla.redhat.com/"".

          LOGO=
              A string, specifying the name of an icon as defined by
              freedesktop.org Icon Theme Specification[6]. This can be used
              by graphical applications to display an operating system's or
              distributor's logo. This field is optional and may not
              necessarily be implemented on all systems.

              Examples: "LOGO=fedora-logo",
              "LOGO=distributor-logo-opensuse"

          ANSI_COLOR=
              A suggested presentation color when showing the OS name on
              the console. This should be specified as string suitable for
              inclusion in the ESC [ m ANSI/ECMA-48 escape code for setting
              graphical rendition. This field is optional.

              Examples: "ANSI_COLOR="0;31"" for red, "ANSI_COLOR="1;34""
              for light blue, or "ANSI_COLOR="0;38;2;60;110;180"" for
              Fedora blue.

      Distribution-level defaults and metadata
          DEFAULT_HOSTNAME=
              A string specifying the hostname if hostname(5) is not
              present and no other configuration source specifies the
              hostname. Must be either a single DNS label (a string
              composed of 7-bit ASCII lower-case characters and no spaces
              or dots, limited to the format allowed for DNS domain name
              labels), or a sequence of such labels separated by single
              dots that forms a valid DNS FQDN. The hostname must be at
              most 64 characters, which is a Linux limitation (DNS allows
              longer names).

              See org.freedesktop.hostname1(5) for a description of how
              systemd-hostnamed.service(8) determines the fallback
              hostname.

          SYSEXT_LEVEL=
              A lower-case string (mostly numeric, no spaces or other
              characters outside of 0–9, a–z, ".", "_" and "-") identifying
              the operating system extensions support level, to indicate
              which extension images are supported. See
              /usr/lib/extension-release.d/extension-release.IMAGE,
              initrd[2] and systemd-sysext(8)) for more information.

              Examples: "SYSEXT_LEVEL=2", "SYSEXT_LEVEL=15.14".

      Notes
          If you are using this file to determine the OS or a specific
          version of it, use the ID and VERSION_ID fields, possibly with
          ID_LIKE as fallback for ID. When looking for an OS identification
          string for presentation to the user use the PRETTY_NAME field.

          Note that operating system vendors may choose not to provide
          version information, for example to accommodate for rolling
          releases. In this case, VERSION and VERSION_ID may be unset.
          Applications should not rely on these fields to be set.

          Operating system vendors may extend the file format and introduce
          new fields. It is highly recommended to prefix new fields with an
          OS specific name in order to avoid name clashes. Applications
          reading this file must ignore unknown fields.

          Example: "DEBIAN_BTS="debbugs://bugs.debian.org/"".

          Container and sandbox runtime managers may make the host's
          identification data available to applications by providing the
          host's /etc/os-release (if available, otherwise
          /usr/lib/os-release as a fallback) as /run/host/os-release.


---------------------------------------------------------

::

          Example 1. os-release file for Fedora Workstation

              NAME=Fedora
              VERSION="32 (Workstation Edition)"
              ID=fedora
              VERSION_ID=32
              PRETTY_NAME="Fedora 32 (Workstation Edition)"
              ANSI_COLOR="0;38;2;60;110;180"
              LOGO=fedora-logo-icon
              CPE_NAME="cpe:/o:fedoraproject:fedora:32"
              HOME_URL="https://fedoraproject.org/"
              DOCUMENTATION_URL="https://docs.fedoraproject.org/en-US/fedora/f32/system-administrators-guide/"
              SUPPORT_URL="https://fedoraproject.org/wiki/Communicating_and_getting_help"
              BUG_REPORT_URL="https://bugzilla.redhat.com/"
              REDHAT_BUGZILLA_PRODUCT="Fedora"
              REDHAT_BUGZILLA_PRODUCT_VERSION=32
              REDHAT_SUPPORT_PRODUCT="Fedora"
              REDHAT_SUPPORT_PRODUCT_VERSION=32
              PRIVACY_POLICY_URL="https://fedoraproject.org/wiki/Legal:PrivacyPolicy"
              VARIANT="Workstation Edition"
              VARIANT_ID=workstation

          Example 2. extension-release file for an extension for Fedora
          Workstation 32

              ID=fedora
              VERSION_ID=32

          Example 3. Reading os-release in sh(1)

              #!/bin/sh -eu

              test -e /etc/os-release && os_release='/etc/os-release' || os_release='/usr/lib/os-release'
              . "${os_release}"

              echo "Running on ${PRETTY_NAME:-Linux}"

              if [ "${ID:-linux}" = "debian" ] || [ "${ID_LIKE#*debian*}" != "${ID_LIKE}" ]; then
                  echo "Looks like Debian!"
              fi

          Example 4. Reading os-release in python(1)

              #!/usr/bin/python

              import ast
              import re
              import sys

              def read_os_release():
                  try:
                      filename = '/etc/os-release'
                      f = open(filename)
                  except FileNotFoundError:
                      filename = '/usr/lib/os-release'
                      f = open(filename)

                  for line_number, line in enumerate(f):
                      line = line.rstrip()
                      if not line or line.startswith('#'):
                          continue
                      if m := re.match(r'([A-Z][A-Z_0-9]+)=(.*)', line):
                          name, val = m.groups()
                          if val and val[0] in '"\'':
                              val = ast.literal_eval(val)
                          yield name, val
                      else:
                          print(f'{filename}:{line_number + 1}: bad line {line!r}',
                                file=sys.stderr)

              os_release = dict(read_os_release())

              pretty_name = os_release.get('PRETTY_NAME', 'Linux')
              print(f'Running on {pretty_name}')

              if 'debian' in [os_release.get('ID', 'linux'),
                              *os_release.get('ID_LIKE', '').split()]:
                  print('Looks like Debian!')


---------------------------------------------------------

::

          systemd(1), lsb_release(1), hostname(5), machine-id(5),
          machine-info(5)


---------------------------------------------------

::

           1. Announcement of /etc/os-release
              http://0pointer.de/blog/projects/os-release

           2. initrd
              https://www.kernel.org/doc/html/latest/admin-guide/initrd.html

           3. Portable Services Documentation
              https://systemd.io/PORTABLE_SERVICES

           4. Common Platform Enumeration Specification
              http://scap.nist.gov/specifications/cpe/

           5. RFC3986 format
              https://tools.ietf.org/html/rfc3986

           6. freedesktop.org Icon Theme Specification
              http://standards.freedesktop.org/icon-theme-spec/latest

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

   systemd 249                                                OS-RELEASE(5)

--------------

Pages that refer to this page:
`portablectl(1) <../man1/portablectl.1.html>`__, 
`systemd-dissect(1) <../man1/systemd-dissect.1.html>`__, 
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`dnf.conf(5) <../man5/dnf.conf.5.html>`__, 
`machine-id(5) <../man5/machine-id.5.html>`__, 
`machine-info(5) <../man5/machine-info.5.html>`__, 
`org.freedesktop.hostname1(5) <../man5/org.freedesktop.hostname1.5.html>`__, 
`org.freedesktop.machine1(5) <../man5/org.freedesktop.machine1.5.html>`__, 
`org.freedesktop.portable1(5) <../man5/org.freedesktop.portable1.5.html>`__, 
`repart.d(5) <../man5/repart.d.5.html>`__, 
`systemd.dnssd(5) <../man5/systemd.dnssd.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`systemd-system.conf(5) <../man5/systemd-system.conf.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`sysusers.d(5) <../man5/sysusers.d.5.html>`__, 
`tmpfiles.d(5) <../man5/tmpfiles.d.5.html>`__, 
`yum.conf(5) <../man5/yum.conf.5.html>`__, 
`kernel-install(8) <../man8/kernel-install.8.html>`__

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
