.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdacache(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OTHER CONSIDER                   |                                   |
| ATIONS <#OTHER_CONSIDERATIONS>`__ |                                   |
| \|                                |                                   |
| `INSTANCE NAME MATC               |                                   |
| HING <#INSTANCE_NAME_MATCHING>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDACACHE(3)            Library Functions Manual            PMDACACHE(3)

NAME
-------------------------------------------------

::

          pmdaCacheStore, pmdaCacheStoreKey, pmdaCacheLookup,
          pmdaCacheLookupName, pmdaCacheLookupKey, pmdaCacheOp,
          pmdaCachePurge, pmdaCachePurgeCallback, pmdaCacheResize - manage
          a cache of instance domain information for a PMDA


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaCacheStore(pmInDom indom, int flags, const char *name,
                  void *private);
          int pmdaCacheStoreKey(pmInDom indom, int flags, const char *name,
                  int keylen, const void *key, void *private);
          int pmdaCacheLookup(pmInDom indom, int inst, char **name,
                  void **private);
          int pmdaCacheLookupName(pmInDom indom, const char *name,
                  int *inst, void **private);
          int pmdaCacheLookupKey(pmInDom indom, const char *name,
                  int keylen, const void *key, char **oname, int *inst,
                  void **private);
          int pmdaCacheOp(pmInDom indom, int op);
          int pmdaCachePurge(pmInDom indom, time_t recent);
          int pmdaCachePurgeCallback(pmInDom indom, time_t recent, void
                  (*callback)(void *));
          int pmdaCacheResize(pmInDom indom, int maximum);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          The pmdaCache family of routines provide services to support the
          maintenance of complex instance domains for Performance Co-Pilot
          PMDAs.  There is potentially one cache of information for each
          instance domain, and for each instance the cache maintains:
          - external instance name (supplied by the PMDA)
          - internal instance identifier (assigned by pmdaCacheStore or
            calculated from a ``hint'' by pmdaCacheStoreKey)
          - state, where active instances are visible and part of the
            current instance domain, and inactive instances are hidden, but
            not forgotten; pmdaCacheStore or pmdaCacheStoreKey may be used
            to change the state of an instance
          - an optional opaque pointer to data that is associated with the
            instance, but maintained by the PMDA
          - an optional opaque key that is used as a ``hint'' to
            pmdaCacheStoreKey when guessing the initial internal instance
            identifier
          - the last time the cache was saved and the instance had been
            marked as active at some point since the previous cache load or
            save operation

          The semantics of a PCP instance domain require a number of rules
          to be followed, namely:
          1. Each internal instance identifier must be unique and in the
             range 0 to 2^31 - 1.  This rule is enforced by the pmdaCache
             family of routines.
          2. The external instance name must be unique.  When the instance
             name contains a space, it is further constrained such that the
             name to the left of the first space (the short name) must also
             be unique.  Refer to the INSTANCE NAME MATCHING section below.
             The PMDA must honor this rule, the pmdaCache family of
             routines will detect attempts to violate this rule.
          3. Where an external instance name corresponds to some object or
             entity, there is an expectation that the association between
             the name and the object is fixed, e.g. ``/dev/hda'' is always
             the name of the same disk on a particular system.  This rule
             is perhaps the responsibility of the PMDA, but is often a
             characteristic of the environment in which the PMDA runs.
          4. It is preferable, although not mandatory, for the association
             between an external instance name and an internal instance
             identifier to be persistent.  This rule is supported by the
             pmdaCache family of routines.
          5. When opaque keys are used, the values of the keys must be
             unique across all instances within an instance domain.  This
             rule is enforced by the pmdaCache family of routines.

          The visible interface to the cache is oriented towards the PMDA
          developer who is most concerned about the names of instances,
          while the details of how the rest of the PCP infrastructure
          expects the internal instance identifiers to be managed is not
          relevant.

          Instances are updated in the cache for instance domain indom by
          calling pmdaCacheStore or pmdaCacheStoreKey with the external
          name of the instance passed via name.  The opaque pointer private
          may be used to associate additional data with the entry in the
          cache; if no such data is required, private should be NULL.  Any
          manipulation of the additional data (including allocation or
          freeing) is the responsibility of the PMDA caller, as the cache
          simply maintains the pointer to the data (passed via private).

          The upper bound for identifiers allocated for any given indom
          cache can be optionally reduced from the default (2^31 - 1) to
          some lesser maximum, using pmdaCacheResize.  This maximum will
          then be persisted and restored in the usual manner, and can thus
          be associated permanently with a cache once set.  This has
          applications when using these interfaces as general purpose
          identifier caches, and is less applicable when using them for
          instance domain caching.

          For cases where the PMDA developer wishes to influence the
          allocation of internal instance identifiers, e.g. for instance
          domains with more than one natural dimension, or where there is a
          desire to allocate the same instance identifier each time the
          PMDA is started, even on different hosts, pmdaCacheStoreKey may
          be used.  In this case, an initial ``hint'' for the instance
          identifier is provided as an opaque key via the first keylen
          bytes in key (which could be any sort of data, including binary
          values) else if keylen is less than 1 or key is NULL then name is
          used as the ``hint''.  The ``hint'' is hashed to produce an
          initial instance identifier in the range 0 to 2^31 - 1 (or lesser
          maximum, if set).  If this instance identifier is already
          allocated, then the value is rehashed.  This procedure is
          repeated until an unallocated instance identifier is found, or
          pmdaCacheStoreKey gives up and returns PM_ERR_GENERIC.  For each
          instance domain, the ``hint'' must be unique across all
          instances, else pmdaCacheStoreKey returns PM_ERR_INST.

          The flags argument controls how the instance should be processed
          in the cache as follows:

          PMDA_CACHE_ADD
                 Insert the entry into the cache if it is not already there
                 and mark it active.  If the entry is already in the cache
                 mark it active.

          PMDA_CACHE_HIDE
                 Mark the entry in the cache as inactive, but remember the
                 details of the association between the external instance
                 name and the internal instance identifier.  Entries that
                 are inactive will be hidden from cache traversal via
                 PMDA_CACHE_WALK_NEXT operations, but remain visible to
                 pmdaCacheLookup, pmdaCacheLookupName and
                 pmdaCacheLookupKey requests.

          PMDA_CACHE_CULL
                 Remove the entry from the cache.

          On success pmdaCacheStore or pmdaCacheStoreKey will return the
          internal instance identifier of the associated cache entry.
          Valid instance identifiers are guaranteed to be unique and non-
          negative.  Failure will be indicated by a negative value
          (suitable for decoding with pmErrStr(3)) and most likely
          PM_ERR_INST to indicate the requested instance is not in the
          cache, or -EINVAL to indicate a potential violation of the short
          name uniqueness property (see the INSTANCE NAME MATCHING section
          below).

          pmdaCacheLookup is used to search the entries in the cache based
          on the internal instance identifier inst.

          On success the return value will be PMDA_CACHE_ACTIVE or
          PMDA_CACHE_INACTIVE (depending on the active or inactive state of
          the cache entry), name (if not NULL) and private (if not NULL)
          will be set to the external instance name and the associate
          additional data area as provided when the instance was last
          activated via pmdaCacheStore or pmdaCacheStoreKey.

          pmdaCacheLookup failure is indicated by a negative return value
          suitable for decoding with pmErrStr(3).

          The pmdaCacheLookup interface is required by the PMDA's fetch
          callback that is registered via pmdaSetFetchCallBack(3).  Here
          the internal instance identifier is passed to the fetch callback
          to identifier for which instance a value is required.  Typical
          usage is shown in the code fragment below.

            static int
            foo_callback(pmdaMetric *mdesc, unsigned int inst, pmAtomValue *atom)
            {
                mydata   *mdp;
                char     *name;
                int      sts;

                sts = pmdaCacheLookup(mdesc->m_desc.indom, inst, &name, (void **)&mdp);
                /*
                 * expect sts == PMDA_CACHE_ACTIVE except for cataclysmic events
                 * use mdp as required, name may be useful for diagnostics
                 */
                ...

          pmdaCacheLookupName is used to search the entries in the cache
          based on the external instance name name.

          On success the return value will be PMDA_CACHE_ACTIVE or
          PMDA_CACHE_INACTIVE (depending on the active or inactive state of
          the cache entry), inst (if not NULL) and private (if not NULL)
          will be set to the internal instance identifier and the associate
          additional data area as provided when the instance was last
          activated via pmdaCacheStore or pmdaCacheStoreKey.

          pmdaCacheLookupName failure is indicated by a negative return
          value suitable for decoding with pmErrStr(3).

          The pmdaCacheLookupName interface is useful for PMDAs wishing to
          update an instance domain based on the external instance names.

          pmdaCacheLookupKey is used to search the entries in the cache
          based on an opaque key (or ``hint'') previously used in a call to
          pmdaCacheStoreKey.  The ``hint'' is provided via the first keylen
          bytes in key.  For symmetry with pmdaCacheStoreKey, if keylen is
          less than 1 or key is NULL then name is used as the ``hint''
          (although the results will be the same as calling
          pmdaCacheLookupName in this case).

          On success the return value will be PMDA_CACHE_ACTIVE or
          PMDA_CACHE_INACTIVE (depending on the active or inactive state of
          the cache entry), oname (if not NULL), inst (if not NULL) and
          private (if not NULL) will be set to the external instance name,
          the internal instance identifier and the associate additional
          data area as provided when the instance was last activated via
          pmdaCacheStore or pmdaCacheStoreKey.

          pmdaCacheLookupKey failure is indicated by a negative return
          value suitable for decoding with pmErrStr(3).

          To avoid a persistent cache growing without bound, pmdaCachePurge
          can be used to cull all entries that have not been active in the
          last recent seconds.  For performance reasons, the time
          accounting is imprecise and the entries are timestamped at the
          time of the next cache save operation after the entry has been
          added or marked active (refer to PMDA_CACHE_SAVE and
          PMDA_CACHE_SYNC below).  On success pmdaCachePurge returns the
          number of culled entries, else in the case of an error the return
          value is negative (and suitable for decoding with pmErrStr(3)).

          The pmdaCachePurgeCallback function is similar to pmdaCachePurge
          except that a callback function will also be called with the
          private data pointer associated with the cache entry to be
          culled.  The callback is not made if private is NULL.  This would
          typically be used to free the private data when the associated
          entry is purged in PMDAs that do not separately maintain any
          references to the private data.

          pmdaCacheOp may be used to perform additional operations on the
          cache as follows:

          PMDA_CACHE_LOAD
                 The cache can optionally be maintained as a persistent
                 external file, so that the mapping of instance names to
                 instance identifiers is persistent across executions of a
                 PMDA.  This operation loads the cache from the external
                 file, and then all new cache entries are marked inactive,
                 and the additional data pointer is set to NULL.  Entries
                 loaded from the external file are checked against the
                 current cache contents and if the instance name and
                 instance identifiers match then the state in the cache
                 (active or inactive) is not changed. Should a mismatch be
                 found (same instance name and different instance
                 identifier, or same instance identifier and different
                 instance name, or some but not all of the instance
                 identifier, the instance name and the ``hint'' match) then
                 the entry from the external file is ignored and a warning
                 is issued on stderr.  Typically a PMDA would only perform
                 this operation once per execution.

          PMDA_CACHE_SAVE
                 If any instance has been added to, or deleted from, the
                 instance domain since the last PMDA_CACHE_LOAD,
                 PMDA_CACHE_SAVE or PMDA_CACHE_SYNC operation, the entire
                 cache is written to the external file as a bulk operation.
                 This operation is provided for PMDAs that are not
                 interested in using pmdaCachePurge and simply want the
                 external file to reflect the set of known instances
                 without accurate details of when they were last marked
                 active.

                 Returns the number of instances saved to the external
                 file, else 0 if the external file was already up to date.

          PMDA_CACHE_STRINGS
                 Annotates this cache as being a special-purpose cache used
                 for string de-duplication in PMDAs exporting large numbers
                 of string valued metrics.  This can be used to reduce the
                 memory footprint of the PMDA (duplicate strings hash to
                 the same bucket, and are stored in memory once only).  Key
                 comparisons are not terminated at the first space but
                 rather the entire string is used for matching.  These are
                 specialised caches not useful for general purpose instance
                 domain handling.

          PMDA_CACHE_SYNC
                 Within an instance domain, if any instance has been added
                 to, or deleted from, or marked active since the last
                 PMDA_CACHE_LOAD, PMDA_CACHE_SAVE or PMDA_CACHE_SYNC
                 operation, the entire cache is written to the external
                 file as a bulk operation.  This operation is similar to
                 PMDA_CACHE_SAVE, but will save the instance domain more
                 frequently so the timestamps more accurately match the
                 semantics expected by pmdaCachePurge.

                 Returns the number of instances saved to the external
                 file, else 0 if the external file was already
                 synchronized.

          PMDA_CACHE_CHECK
                 Returns 1 if a cache exists for the specified instance
                 domain, else 0.

          PMDA_CACHE_REUSE
                 When a new instance is added to the cache, the default
                 strategy is to assign instance identifiers in a monotonic
                 increasing manner.  Once the maximum possible instance
                 identifier value has been assigned, the strategy changes
                 to one where starting from 0, the next available unused
                 instance identifier will be used.  Calling pmdaCacheOp
                 with PMDA_CACHE_REUSE forces an irreversible change to a
                 second (reuse) strategy where the next unallocated
                 instance identifier will be used.  This may be useful in
                 cases where there is a desire to restrict the allocated
                 instance identifiers to smaller values.  The prevailing
                 strategy will be saved and restored across PMDA_CACHE_SAVE
                 and PMDA_CACHE_LOAD operations.  If pmdaCacheStoreKey is
                 ever used, the associated instance domain will be changed
                 to PMDA_CACHE_REUSE mode.

          PMDA_CACHE_REORG
                 Reorganize the cache to allow faster retrieval of active
                 entries, at the cost of slower retrieval for inactive
                 entries, and reclaim any culled entries.  The cache may be
                 internally re-organized as entries are added, so this
                 operation is not required for most PMDAs.

          PMDA_CACHE_WALK_REWIND
                 Prepares for a traversal of the cache in ascending
                 instance identifier sequence.

          PMDA_CACHE_WALK_NEXT
                 Fetch the next active instance identifier from the cache.
                 Requires a prior call using PMDA_CACHE_WALK_REWIND and
                 will return -1 when all instances have been processed.

                 Only one cache walk can be active at any given time,
                 nesting calls to PMDA_CACHE_WALK and PMDA_CACHE_REWIND
                 will interfere with each other.

          PMDA_CACHE_ACTIVE
                 Changes every inactive entry in the cache to be marked
                 active.

          PMDA_CACHE_INACTIVE
                 Changes every active entry in the cache to be marked
                 inactive.

          PMDA_CACHE_CULL
                 Remove every entry from the cache.

          PMDA_CACHE_SIZE
                 Return the number of entries in the cache (includes
                 active, inactive and any culled entries that have not yet
                 been reclaimed).

          PMDA_CACHE_SIZE_ACTIVE
                 Return the number of active entries in the cache.

          PMDA_CACHE_SIZE_INACTIVE
                 Return the number of inactive entries in the cache.

          PMDA_CACHE_DUMP
                 Dump the current state of the cache on stderr.

          PMDA_CACHE_DUMP_ALL
                 Like PMDA_CACHE_DUMP, but also dump the internal hashing
                 structures used to support lookup by instance name, lookup
                 by instance identifier and the collision statistics for
                 ``hint'' hashing from pmdaCacheStoreKey.

          pmdaCacheOp returns a non-negative value on success, and failure
          is indicated by a negative return value (suitable for decoding
          with pmErrStr(3)).


---------------------------------------------------------------------------------

::

          When the pmdaCache routines are used for particular instance
          domain, pmdaInstance(3) and the instance domain enumeration
          behind pmdaFetch(3) will attempt to extract instance domain
          information from the cache, thereby avoiding reference to the
          pmdaIndom data structures that have historically been used to
          define instance domains and service instance requests.  A PMDA
          can adopt a hybrid approach and choose to implement some instance
          domains via the traditional pmdaIndom method, and others via the
          pmdaCache approach, however attempts to manage the same instance
          domain by both methods will result in the pmdaCache method
          silently prevailing.

          If all instances in a PMDA are to be serviced from a pmdaCache
          then a pmdaIndom is not required, and the pmdaInit(3) call
          becomes

                pmdaInit(dp, NULL, 0, metrictab, nmetrics);

          However, the PMDA will need to explicitly initialize the indom
          field of the pmDesc in the metrictab entries, as this cannot be
          done by pmdaInit(3) if indomtab is missing entries for the
          instance domains maintained in the cache.

          Independent of how the instance domain is being maintained, to
          refresh an instance domain prior to a fetch or an instance domain
          operation, the standard methods of a ``wrapper'' to the
          pmdaInstance(3) and pmdaFetch(3) methods should be used.

          Refer to the simple PMDA source code for an example use of the
          pmdaCache routines.

          When using pmdaCacheStoreKey, if there is a desire to ensure the
          given ``hint'' generates the same initial instance identifier
          across all platforms, then the caller should ensure the endian
          and word-size issues are considered, e.g. if the natural data
          structure used for the key is an array of 32-bit integers, then
          htonl(3) should be used on each element of the array before
          calling pmdaCacheStoreKey or pmdaCacheLookupKey.


-------------------------------------------------------------------------------------

::

          The following table summarizes the ``short name'' matching
          semantics for an instance domain (caches other than
          PMDA_CACHE_STRINGS style).

       ┌────────┬─────────────────┬───────────────────────────────────────────┐
       │name in │ pmdaCacheLookup │ result                                    │
       │cache   │ name            │                                           │
       ├────────┼─────────────────┼───────────────────────────────────────────┤
       │foodle  │ foo             │ no match (PM_ERR_INST)                    │
       │foo     │ foodle          │ no match (PM_ERR_INST)                    │
       │foo     │ foo             │ match                                     │
       │foo bar │ foo             │ match on short name (instance identifier) │
       │foo bar │ foo bar         │ match on full name (instance identifier)  │
       │foo     │ foo bar         │ bad match (-EDOM)                         │
       │foo bar │ foo blah        │ bad match (-EDOM)                         │
       └────────┴─────────────────┴───────────────────────────────────────────┘


---------------------------------------------------

::

          Cache persistence uses files with names constructed from the
          indom within the $PCP_VAR_DIR/config/pmda directory.


---------------------------------------------------------

::

          BYTEORDER(3), PMAPI(3), PMDA(3), pmdaInit(3), pmdaInstance(3),
          pmdaFetch(3), pmdaLabel(3), pmErrStr(3) and pmGetInDom(3).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                      PMDACACHE(3)

--------------

Pages that refer to this page:
`pmdainstance(3) <../man3/pmdainstance.3.html>`__

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
