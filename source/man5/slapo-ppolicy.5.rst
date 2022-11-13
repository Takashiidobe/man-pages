.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-ppolicy(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `OBJECT CLASS <#OBJECT_CLASS>`__  |                                   |
| \|                                |                                   |
| `OBJECT CLASS ATTRIBU             |                                   |
| TES <#OBJECT_CLASS_ATTRIBUTES>`__ |                                   |
| \|                                |                                   |
| `OPERATIONAL ATTRIB               |                                   |
| UTES <#OPERATIONAL_ATTRIBUTES>`__ |                                   |
| \|                                |                                   |
| `SUN                              |                                   |
| DS ACCOUNT USABILITY CONTROL <#SU |                                   |
| NDS_ACCOUNT_USABILITY_CONTROL>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO_PPOLICY(5)           File Formats Manual          SLAPO_PPOLICY(5)

NAME
-------------------------------------------------

::

          slapo-ppolicy - Password Policy overlay to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          The ppolicy overlay is an implementation of the most recent IETF
          Password Policy proposal for LDAP.   When instantiated, it
          intercepts, decodes and applies specific password policy controls
          to overall use of a backend database, changes to user password
          fields, etc.

          The overlay provides a variety of password control mechanisms.
          They include password aging -- both minimum and maximum ages,
          password reuse and duplication control, account time-outs,
          mandatory password resets, acceptable password content, and even
          grace logins.  Different groups of users may be associated with
          different password policies, and there is no limit to the number
          of password policies that may be created.

          Note that some of the policies do not take effect when the
          operation is performed with the rootdn identity; all the
          operations, when performed with any other identity, may be
          subjected to constraints, like access control.  This overlay
          requires a rootdn to be configured on the database.

          During password update, an identity with manage access to the
          userPassword attribute is considered a password administrator
          where relevant to the IETF Password Policy proposal.

          Note that the IETF Password Policy proposal for LDAP makes sense
          when considering a single-valued password attribute, while the
          userPassword attribute allows multiple values.  This
          implementation enforces a single value for the userPassword
          attribute, despite its specification.

          In addition to supporting the IETF Password Policy, this module
          supports the SunDS Account Usability control
          (1.3.6.1.4.1.42.2.27.9.5.8) on search requests and can send the
          Netscape Password validity controls when configured to do so.


-------------------------------------------------------------------

::

          These slapd.conf configuration options apply to the ppolicy
          overlay. They should appear after the overlay directive.

          ppolicy_default <policyDN>
                 Specify the DN of the pwdPolicy object to use when no
                 specific policy is set on a given user's entry. If there
                 is no specific policy for an entry and no default is
                 given, then no policies will be enforced.

          ppolicy_forward_updates
                 Specify that policy state changes that result from Bind
                 operations (such as recording failures, lockout, etc.) on
                 a consumer should be forwarded to a provider instead of
                 being written directly into the consumer's local database.
                 This setting is only useful on a replication consumer, and
                 also requires the updateref setting and chain overlay to
                 be appropriately configured.

          ppolicy_hash_cleartext
                 Specify that cleartext passwords present in Add and Modify
                 requests should be hashed before being stored in the
                 database. This violates the X.500/LDAP information model,
                 but may be needed to compensate for LDAP clients that
                 don't use the Password Modify extended operation to manage
                 passwords.  It is recommended that when this option is
                 used that compare, search, and read access be denied to
                 all directory users.

          ppolicy_use_lockout
                 A client will always receive an LDAP InvalidCredentials
                 response when Binding to a locked account. By default,
                 when a Password Policy control was provided on the Bind
                 request, a Password Policy response will be included with
                 no special error code set. This option changes the
                 Password Policy response to include the AccountLocked
                 error code. Note that sending the AccountLocked error code
                 provides useful information to an attacker; sites that are
                 sensitive to security issues should not enable this
                 option.

          ppolicy_send_netscape_controls
                 If set, ppolicy will send the password policy expired
                 (2.16.840.1.113730.3.4.4) and password policy expiring
                 (2.16.840.1.113730.3.4.5) controls when appropriate. The
                 controls are not sent for bind requests where the Password
                 policy control has already been requested. Default is not
                 to send the controls.

          ppolicy_check_module <path>
                 Specify the path of a loadable module containing a
                 check_password() function for additional password quality
                 checks. The use of this module is described further below
                 in the description of the pwdPolicyChecker objectclass.

                 Note: The user-defined loadable module must be in slapd's
                 standard executable search PATH, or an absolute path must
                 be provided.

                 Note: Use of a ppolicy_check_module is a non-standard
                 extension to the LDAP password policy proposal.


-----------------------------------------------------------------

::

          The ppolicy overlay depends on the pwdPolicy object class.  The
          definition of that class is as follows:

              (  1.3.6.1.4.1.42.2.27.8.2.1
                  NAME 'pwdPolicy'
                  AUXILIARY
                  SUP top
                  MUST ( pwdAttribute )
                  MAY (
                      pwdMinAge $ pwdMaxAge $ pwdInHistory $
                      pwdCheckQuality $ pwdMinLength $ pwdMaxLength $
                      pwdExpireWarning $ pwdGraceAuthnLimit $
                      pwdGraceExpiry $ pwdLockout $ pwdLockoutDuration $
                      pwdMaxFailure $ pwdFailureCountInterval $
                      pwdMustChange $ pwdAllowUserChange $
                      pwdSafeModify $ pwdMaxRecordedFailure $
                      pwdMinDelay $ pwdMaxDelay $ pwdMaxIdle ) )

          The pwdPolicy class is not structural, and so entries using it
          require another, structural, object class.  The namedPolicy
          object class is a good choice.  namedPolicy requires a cn
          attribute, suitable as the policy entry's rDN.

          This implementation also provides an additional pwdPolicyChecker
          objectclass, used for password quality checking (see below).

              (  1.3.6.1.4.1.4754.2.99.1
                  NAME 'pwdPolicyChecker'
                  AUXILIARY
                  SUP top
                  MAY ( pwdCheckModule $ pwdCheckModuleArg $
              pwdUseCheckModule ) )

          Every account that should be subject to password policy control
          should have a pwdPolicySubentry attribute containing the DN of a
          valid pwdPolicy entry, or they can simply use the configured
          default.  In this way different users may be managed according to
          different policies.


---------------------------------------------------------------------------------------

::

          Each one of the sections below details the meaning and use of a
          particular attribute of this pwdPolicy object class.

          pwdAttribute

          This attribute contains the name of the attribute to which the
          password policy is applied. For example, the password policy may
          be applied to the userPassword attribute.

          Note: in this implementation, the only value accepted for
          pwdAttribute is  userPassword .

              (  1.3.6.1.4.1.42.2.27.8.1.1
                 NAME 'pwdAttribute'
                 EQUALITY objectIdentifierMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.38 )

          pwdMinAge

          This attribute contains the number of seconds that must elapse
          between modifications allowed to the password. If this attribute
          is not present, zero seconds is assumed (i.e. the password may be
          modified whenever and however often is desired).

              (  1.3.6.1.4.1.42.2.27.8.1.2
                 NAME 'pwdMinAge'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdMaxAge

          This attribute contains the number of seconds after which a
          modified password will expire.  If this attribute is not present,
          or if its value is zero (0), then passwords will not expire.

              (  1.3.6.1.4.1.42.2.27.8.1.3
                 NAME 'pwdMaxAge'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdInHistory

          This attribute is used to specify the maximum number of used
          passwords that will be stored in the pwdHistory attribute.  If
          the pwdInHistory attribute is not present, or if its value is
          zero (0), used passwords will not be stored in pwdHistory and
          thus any previously-used password may be reused.  No history
          checking occurs if the password is being modified by the rootdn,
          although the password is saved in the history.

              (  1.3.6.1.4.1.42.2.27.8.1.4
                 NAME 'pwdInHistory'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdCheckQuality

          This attribute indicates if and how password syntax will be
          checked while a password is being modified or added. If this
          attribute is not present, or its value is zero (0), no syntax
          checking will be done. If its value is one (1), the server will
          check the syntax, and if the server is unable to check the
          syntax, whether due to a client-side hashed password or some
          other reason, it will be accepted. If its value is two (2), the
          server will check the syntax, and if the server is unable to
          check the syntax it will return an error refusing the password.

              (  1.3.6.1.4.1.42.2.27.8.1.5
                 NAME 'pwdCheckQuality'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdMinLength

          When syntax checking is enabled (see also the pwdCheckQuality
          attribute), this attribute contains the minimum length in bytes
          that will be accepted in a password. If this attribute is not
          present, minimum password length is not enforced. If the server
          is unable to check the length of the password, whether due to a
          client-side hashed password or some other reason, the server
          will, depending on the value of pwdCheckQuality, either accept
          the password without checking it (if pwdCheckQuality is zero (0)
          or one (1)) or refuse it (if pwdCheckQuality is two (2)). If the
          number of characters should be enforced with regards to a
          particular encoding, the use of an appropriate
          ppolicy_check_module is required.

              (  1.3.6.1.4.1.42.2.27.8.1.6
                 NAME 'pwdMinLength'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdMaxLength

          When syntax checking is enabled (see also the pwdCheckQuality
          attribute), this attribute contains the maximum length in bytes
          that will be accepted in a password. If this attribute is not
          present, maximum password length is not enforced. If the server
          is unable to check the length of the password, whether due to a
          client-side hashed password or some other reason, the server
          will, depending on the value of pwdCheckQuality, either accept
          the password without checking it (if pwdCheckQuality is zero (0)
          or one (1)) or refuse it (if pwdCheckQuality is two (2)). If the
          number of characters should be enforced with regards to a
          particular encoding, the use of an appropriate
          ppolicy_check_module is required.

              (  1.3.6.1.4.1.42.2.27.8.1.31
                 NAME 'pwdMaxLength'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdExpireWarning

          This attribute contains the maximum number of seconds before a
          password is due to expire that expiration warning messages will
          be returned to a user who is authenticating to the directory.  If
          this attribute is not present, or if the value is zero (0), no
          warnings will be sent.

              (  1.3.6.1.4.1.42.2.27.8.1.7
                 NAME 'pwdExpireWarning'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdGraceAuthnLimit

          This attribute contains the number of times that an expired
          password may be used to authenticate a user to the directory. If
          this attribute is not present or if its value is zero (0), users
          with expired passwords will not be allowed to authenticate to the
          directory.

              (  1.3.6.1.4.1.42.2.27.8.1.8
                 NAME 'pwdGraceAuthnLimit'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdGraceExpiry

          This attribute specifies the number of seconds the grace
          authentications are valid.  If this attribute is not present or
          if the value is zero (0), there is no time limit on the grace
          authentications.

              (  1.3.6.1.4.1.42.2.27.8.1.30
                 NAME 'pwdGraceExpiry'
                 EQUALITY integerMatch
                 ORDERING integerOrderingMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdLockout

          This attribute specifies the action that should be taken by the
          directory when a user has made a number of failed attempts to
          authenticate to the directory.  If pwdLockout is set (its value
          is "TRUE"), the user will not be allowed to attempt to
          authenticate to the directory after there have been a specified
          number of consecutive failed bind attempts.  The maximum number
          of consecutive failed bind attempts allowed is specified by the
          pwdMaxFailure attribute.  If pwdLockout is not present, or if its
          value is "FALSE", the password may be used to authenticate no
          matter how many consecutive failed bind attempts have been made.

              (  1.3.6.1.4.1.42.2.27.8.1.9
                 NAME 'pwdLockout'
                 EQUALITY booleanMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.7
                 SINGLE-VALUE )

          pwdLockoutDuration

          This attribute contains the number of seconds during which the
          password cannot be used to authenticate the user to the directory
          due to too many consecutive failed bind attempts.  (See also
          pwdLockout and pwdMaxFailure.)  If pwdLockoutDuration is not
          present, or if its value is zero (0), the password cannot be used
          to authenticate the user to the directory again until it is reset
          by an administrator.

              (  1.3.6.1.4.1.42.2.27.8.1.10
                 NAME 'pwdLockoutDuration'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdMaxFailure

          This attribute contains the number of consecutive failed bind
          attempts after which the password may not be used to authenticate
          a user to the directory.  If pwdMaxFailure is not present, or its
          value is zero (0), then a user will be allowed to continue to
          attempt to authenticate to the directory, no matter how many
          consecutive failed bind attempts have occurred with that user's
          DN.  (See also pwdLockout and pwdLockoutDuration.)

              (  1.3.6.1.4.1.42.2.27.8.1.11
                 NAME 'pwdMaxFailure'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdMaxRecordedFailure

          This attribute contains the maximum number of failed bind
          attempts to store in a user's entry.  If pwdMaxRecordedFailure is
          not present, or its value is zero (0), then it defaults to the
          value of pwdMaxFailure.  If that value is also 0, the default is
          5.

              (  1.3.6.1.4.1.42.2.27.8.1.32
                 NAME 'pwdMaxRecordedFailure'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdFailureCountInterval

          This attribute contains the number of seconds after which old
          consecutive failed bind attempts are purged from the failure
          counter, even though no successful authentication has occurred.
          If pwdFailureCountInterval is not present, or its value is zero
          (0), the failure counter will only be reset by a successful
          authentication.

              (  1.3.6.1.4.1.42.2.27.8.1.12
                 NAME 'pwdFailureCountInterval'
                 EQUALITY integerMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdMustChange

          This attribute specifies whether users must change their
          passwords when they first bind to the directory after a password
          is set or reset by the administrator, or not.  If pwdMustChange
          has a value of "TRUE", users must change their passwords when
          they first bind to the directory after a password is set or reset
          by the administrator.  If pwdMustChange is not present, or its
          value is "FALSE", users are not required to change their password
          upon binding after the administrator sets or resets the password.

              (  1.3.6.1.4.1.42.2.27.8.1.13
                NAME 'pwdMustChange'
                EQUALITY booleanMatch
                SYNTAX 1.3.6.1.4.1.1466.115.121.1.7
                SINGLE-VALUE )

          pwdAllowUserChange

          This attribute specifies whether users are allowed to change
          their own passwords or not.  If pwdAllowUserChange is set to
          "TRUE", or if the attribute is not present, users will be allowed
          to change their own passwords.  If its value is "FALSE", users
          will not be allowed to change their own passwords.

          Note: this implies that when pwdAllowUserChange is set to "TRUE",
          users will still be able to change the password of another user,
          subjected to access control.  This restriction only applies to
          modifications of ones's own password.  It should also be noted
          that pwdAllowUserChange was defined in the specification to
          provide rough access control to the password attribute in
          implementations that do not allow fine-grain access control.
          Since OpenLDAP provides fine-grain access control, the use of
          this attribute is discouraged; ACLs should be used instead (see
          slapd.access(5) for details).

              (  1.3.6.1.4.1.42.2.27.8.1.14
                 NAME 'pwdAllowUserChange'
                 EQUALITY booleanMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.7
                 SINGLE-VALUE )

          pwdSafeModify

          This attribute denotes whether the user's existing password must
          be sent along with their new password when changing a password.
          If pwdSafeModify is set to "TRUE", the existing password must be
          sent along with the new password.  If the attribute is not
          present, or its value is "FALSE", the existing password need not
          be sent along with the new password.

              (  1.3.6.1.4.1.42.2.27.8.1.15
                 NAME 'pwdSafeModify'
                 EQUALITY booleanMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.7
                 SINGLE-VALUE )

          pwdMinDelay

          This attribute specifies the number of seconds to delay
          responding to the first failed authentication attempt.  If this
          attribute is not set or is zero (0), no delays will be used.
          pwdMaxDelay must also be specified if pwdMinDelay is set.

          Note that this implementation uses a variable lockout instead of
          delaying the bind response.

              (  1.3.6.1.4.1.42.2.27.8.1.24
                 NAME 'pwdMinDelay'
                 EQUALITY integerMatch
                 ORDERING integerOrderingMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdMaxDelay

          This attribute specifies the maximum number of seconds to delay
          when responding to a failed authentication attempt.  The time
          specified in pwdMinDelay is used as the starting time and is then
          doubled on each failure until the delay time is greater than or
          equal to pwdMaxDelay (or a successful authentication occurs,
          which resets the failure counter).  pwdMinDelay must also be
          specified if pwdMaxDelay is set.

          Note that this implementation uses a variable lockout instead of
          delaying the bind response.

              (  1.3.6.1.4.1.42.2.27.8.1.25
                 NAME 'pwdMaxDelay'
                 EQUALITY integerMatch
                 ORDERING integerOrderingMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdMaxIdle

          This attribute specifies the number of seconds an account may
          remain unused before it becomes locked.  If this attribute is not
          set or is zero (0), no check is performed. For this to be
          enforced, lastbind functionality needs to be enabled on the
          database, that is olcLastBind is set to TRUE.

              (  1.3.6.1.4.1.42.2.27.8.1.26
                 NAME 'pwdMaxIdle'
                 EQUALITY integerMatch
                 ORDERING integerOrderingMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
                 SINGLE-VALUE )

          pwdUseCheckModule/pwdCheckModuleArg

          The pwdUseCheckModule attribute enables use of a loadable module
          previously configured with ppolicy_check_module for the current
          policy. The module must instantiate the check_password()
          function.  This function will be called to further check a new
          password if pwdCheckQuality is set to one (1) or two (2), after
          all of the built-in password compliance checks have been passed.
          This function will be called according to this function
          prototype:
              int check_password (char *pPasswd, struct berval *pErrmsg,
              Entry *pEntry, struct berval *pArg);
          The pPasswd parameter contains the clear-text user password, the
          pErrmsg parameter points to a struct berval containing space to
          return human-readable details about any error it encounters.  The
          bv_len field must contain the size of the space provided by the
          bv_val field.

          The pEntry parameter is optional, if non-NULL, carries a pointer
          to the entry whose password is being checked.

          The optional pArg parameter points to a struct berval containing
          the value of pwdCheckModuleArg in the effective password policy,
          if set, otherwise NULL.

          If pErrmsg is NULL, then funcName must NOT attempt to use it.  A
          return value of LDAP_SUCCESS from the called function indicates
          that the password is ok, any other value indicates that the
          password is unacceptable.  If the password is unacceptable, the
          server will return an error to the client, and pErrmsg may be
          used to return a human-readable textual explanation of the error.
          If the space passed in by the caller is too small, the function
          may replace it with a dynamically allocated buffer, which will be
          free()'d by slapd.

          The pwdCheckModule attribute is now obsolete and is ignored.

              (  1.3.6.1.4.1.4754.1.99.1
                 NAME 'pwdCheckModule'
                 EQUALITY caseExactIA5Match
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.26
                 OBSOLETE
                 SINGLE-VALUE )

              ( 1.3.6.1.4.1.4754.1.99.2
                 NAME 'pwdCheckModuleArg'
                 EQUALITY octetStringMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.40
                 DESC 'Argument to pass to check_password() function'
                 SINGLE-VALUE )

              (  1.3.6.1.4.1.4754.1.99.3
                 NAME 'pwdUseCheckModule'
                 EQUALITY booleanMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.7
                 SINGLE-VALUE )


-------------------------------------------------------------------------------------

::

          The operational attributes used by the ppolicy module are stored
          in the user's entry.  Most of these attributes are not intended
          to be changed directly by users; they are there to track user
          activity.  They have been detailed here so that administrators
          and users can both understand the workings of the ppolicy module.

          Note that the current IETF Password Policy proposal does not
          define how these operational attributes are expected to behave in
          a replication environment. In general, authentication attempts on
          a replica server only affect the copy of the operational
          attributes on that replica and will not affect any attributes for
          a user's entry on the provider. Operational attribute changes
          resulting from authentication attempts on a provider will usually
          replicate to the replicas (and also overwrite any changes that
          originated on the replica).  These behaviors are not guaranteed
          and are subject to change when a formal specification emerges.

          userPassword

          The userPassword attribute is not strictly part of the ppolicy
          module.  It is, however, the attribute that is tracked and
          controlled by the module.  Please refer to the standard OpenLDAP
          schema for its definition.

          pwdPolicySubentry

          This attribute refers directly to the pwdPolicy subentry that is
          to be used for this particular directory user.  If
          pwdPolicySubentry exists, it must contain the DN of a valid
          pwdPolicy object.  If it does not exist, the ppolicy module will
          enforce the default password policy rules on the user associated
          with this authenticating DN. If there is no default, or the
          referenced subentry does not exist, then no policy rules will be
          enforced.

              (  1.3.6.1.4.1.42.2.27.8.1.23
                 NAME 'pwdPolicySubentry'
                 DESC 'The pwdPolicy subentry in effect for
                     this object'
                 EQUALITY distinguishedNameMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.12
                 SINGLE-VALUE
                 NO-USER-MODIFICATION
                 USAGE directoryOperation)

          pwdChangedTime

          This attribute denotes the last time that the entry's password
          was changed.  This value is used by the password expiration
          policy to determine whether the password is too old to be allowed
          to be used for user authentication.  If pwdChangedTime does not
          exist, the user's password will not expire.

              (  1.3.6.1.4.1.42.2.27.8.1.16
                 NAME 'pwdChangedTime'
                 DESC 'The time the password was last changed'
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
                 EQUALITY generalizedTimeMatch
                 ORDERING generalizedTimeOrderingMatch
                 SINGLE-VALUE
                 NO-USER-MODIFICATION
                 USAGE directoryOperation)

          pwdAccountLockedTime

          This attribute contains the time that the user's account was
          locked.  If the account has been locked, the password may no
          longer be used to authenticate the user to the directory.  If
          pwdAccountLockedTime is set to 000001010000Z, the user's account
          has been permanently locked and may only be unlocked by an
          administrator. Note that account locking only takes effect when
          the pwdLockout password policy attribute is set to "TRUE".

              (  1.3.6.1.4.1.42.2.27.8.1.17
                 NAME 'pwdAccountLockedTime'
                 DESC 'The time an user account was locked'
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
                 EQUALITY generalizedTimeMatch
                 ORDERING generalizedTimeOrderingMatch
                 SINGLE-VALUE
                 NO-USER-MODIFICATION
                 USAGE directoryOperation)

          pwdFailureTime

          This attribute contains the timestamps of each of the consecutive
          authentication failures made upon attempted authentication to
          this DN (i.e. account).  If too many timestamps accumulate here
          (refer to the pwdMaxFailure password policy attribute for
          details), and the pwdLockout password policy attribute is set to
          "TRUE", the account may be locked.  (Please also refer to the
          pwdLockout password policy attribute.)  Excess timestamps beyond
          those allowed by pwdMaxFailure or pwdMaxRecordedFailure may also
          be purged.  If a successful authentication is made to this DN
          (i.e. to this user account), then pwdFailureTime will be cleansed
          of entries.

              (  1.3.6.1.4.1.42.2.27.8.1.19
                 NAME 'pwdFailureTime'
                 DESC 'The timestamps of the last consecutive
                     authentication failures'
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
                 EQUALITY generalizedTimeMatch
                 ORDERING generalizedTimeOrderingMatch
                 NO-USER-MODIFICATION
                 USAGE directoryOperation )

          pwdHistory

          This attribute contains the history of previously used passwords
          for this DN (i.e. for this user account).  The values of this
          attribute are stored in string format as follows:

              pwdHistory=
                  time "#" syntaxOID "#" length "#" data

              time=
                  GeneralizedTime as specified in section 3.3.13 of
                  [RFC4517]

              syntaxOID = numericoid
                  This is the string representation of the dotted-decimal
                  OID that defines the syntax used to store the password.
                  numericoid is described in section 1.4 of [RFC4512].

              length = NumericString
                  The number of octets in the data.  NumericString is
                  described in section 3.3.23 of [RFC4517].

              data =
                  Octets representing the password in the format specified
                  by syntaxOID.

          This format allows the server to store and transmit a history of
          passwords that have been used.  In order for equality matching on
          the values in this attribute to function properly, the time field
          is in GMT format.

              (  1.3.6.1.4.1.42.2.27.8.1.20
                 NAME 'pwdHistory'
                 DESC 'The history of user passwords'
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.40
                 EQUALITY octetStringMatch
                 NO-USER-MODIFICATION
                 USAGE directoryOperation)

          pwdGraceUseTime

          This attribute contains the list of timestamps of logins made
          after the user password in the DN has expired.  These post-
          expiration logins are known as "grace logins".  If too many grace
          logins have been used (please refer to the pwdGraceAuthnLimit
          password policy attribute), then the DN will no longer be allowed
          to be used to authenticate the user to the directory until the
          administrator changes the DN's userPassword attribute.

              (  1.3.6.1.4.1.42.2.27.8.1.21
                 NAME 'pwdGraceUseTime'
                 DESC 'The timestamps of the grace login once the password
              has expired'
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
                 EQUALITY generalizedTimeMatch
                 NO-USER-MODIFICATION
                 USAGE directoryOperation)

          pwdReset

          This attribute indicates whether the user's password has been
          reset by the administrator and thus must be changed upon first
          use of this DN for authentication to the directory.  If pwdReset
          is set to "TRUE", then the password was reset and the user must
          change it upon first authentication.  If the attribute does not
          exist, or is set to "FALSE", the user need not change their
          password due to administrative reset.

              (  1.3.6.1.4.1.42.2.27.8.1.22
                 NAME 'pwdReset'
                 DESC 'The indication that the password has
                     been reset'
                 EQUALITY booleanMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.7
                 SINGLE-VALUE
                 USAGE directoryOperation)

          pwdStartTime

          This attribute specifies the time the entry's password becomes
          valid for authentication.  Authentication attempts made before
          this time will fail.  If this attribute does not exist, then no
          restriction applies.

              (  1.3.6.1.4.1.42.2.27.8.1.27
                 NAME 'pwdStartTime'
                 DESC 'The time the password becomes enabled'
                 EQUALITY generalizedTimeMatch
                 ORDERING generalizedTimeOrderingMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
                 SINGLE-VALUE
                 NO-USER-MODIFICATION
                 USAGE directoryOperation )

          pwdEndTime

          This attribute specifies the time the entry's password becomes
          invalid for authentication.  Authentication attempts made after
          this time will fail, regardless of expiration or grace settings.
          If this attribute does not exist, then this restriction does not
          apply.

              (  1.3.6.1.4.1.42.2.27.8.1.28
                 NAME 'pwdEndTime'
                 DESC 'The time the password becomes disabled'
                 EQUALITY generalizedTimeMatch
                 ORDERING generalizedTimeOrderingMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
                 SINGLE-VALUE
                 NO-USER-MODIFICATION
                 USAGE directoryOperation )

          Note that pwdStartTime may be set to a time greater than or equal
          to pwdEndTime; this simply disables the account.

          pwdAccountTmpLockoutEnd

          This attribute that the user's password has been locked out
          temporarily according to the pwdMinDelay policy option and when
          the lockout ends.

              (  1.3.6.1.4.1.42.2.27.8.1.33
                 NAME 'pwdAccountTmpLockoutEnd'
                 DESC 'Temporary lockout end'
                 EQUALITY generalizedTimeMatch
                 ORDERING generalizedTimeOrderingMatch
                 SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
                 SINGLE-VALUE
                 NO-USER-MODIFICATION
                 USAGE directoryOperation )


-------------------------------------------------------------------------------------------------------

::

          If the SunDS Account Usability control is used with a search
          request, the overlay will attach validity information to each
          entry provided all of the following are met:

          • There is a password policy that applies to the entry

          • The user has compare access to the entry's password attribute.

          • The configured password attribute is present in the entry


---------------------------------------------------------

::

                 database mdb
                 suffix dc=example,dc=com
                 ...
                 overlay ppolicy
                 ppolicy_default "cn=Standard,ou=Policies,dc=example,dc=com"


---------------------------------------------------------

::

          ldap(3), slapd.conf(5), slapd-config(5), slapo-chain(5).

          "OpenLDAP Administrator's Guide"
          (http://www.OpenLDAP.org/doc/admin/)

          IETF LDAP password policy proposal by P. Behera, L.  Poitou and
          J.  Sermersheim:  documented in IETF document "draft-behera-ldap-
          password-policy-10.txt".


-------------------------------------------------

::

          The LDAP Password Policy specification is not yet an approved
          standard, and it is still evolving. This code will continue to be
          in flux until the specification is finalized.


-------------------------------------------------------------------------

::

          This module was written in 2004 by Howard Chu of Symas
          Corporation with significant input from Neil Dunbar and Kartik
          Subbarao of Hewlett-Packard.

          This manual page borrows heavily and shamelessly from the
          specification upon which the password policy module it describes
          is based.  This source is the IETF LDAP password policy proposal
          by P. Behera, L.  Poitou and J. Sermersheim.  The proposal is
          fully documented in the IETF document named draft-behera-ldap-
          password-policy-10.txt, written in August of 2009.

          OpenLDAP Software is developed and maintained by The OpenLDAP
          Project <http://www.openldap.org/>.  OpenLDAP Software is derived
          from the University of Michigan LDAP 3.3 Release.

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

   OpenLDAP LDVERSION             RELEASEDATE              SLAPO_PPOLICY(5)

--------------

Pages that refer to this page:
`slapd.overlays(5) <../man5/slapd.overlays.5.html>`__

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
