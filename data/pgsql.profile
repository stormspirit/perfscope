====
EXPCALL
====
doTheRounds
mark_hl_words
_bt_pagedel
createdb
repair_frag
DoCopy
DefineIndex
CopyFrom
StartupXLOG
parseqatom
ProcedureCreate
ATAddForeignKeyConstraint
grouping_planner
array_set_slice
ExecInitAgg
heap_update
array_set
OperatorCreate
_bt_split
load_relcache_init_file
TypeCreate
ri_FetchConstraintInfo
record_eq
parseNodeString
record_cmp
CreateCast
match_unsorted_outer
compute_scalar_stats
mark_hl_fragments
CreateTrigger
ReadControlFile
AlterRole
XLogInsert
array_cmp
XLogWrite
DefineType
array_fill_internal
PostgresMain
LockAcquire
explain_outNode
btree_xlog_split
CreateRole
write_csvlog
array_eq
mergejoinscansel
lookup_type_cache
float8_regr_accum
do_to_timestamp
index_create
CatalogCacheComputeTupleHashValue
CreateCheckPoint
AggregateCreate
tzload
ReadRecord
DefineOpClass
toast_fetch_datum_slice
array_map
array_cat
heap_xlog_update
dataSplitPage
cost_mergejoin
DefineQueryRewrite
CopyReadLineText
exec_bind_message
RelationCacheInitializePhase2
ParseFuncOrColumn
ExecGrant_Relation
PostmasterMain
transformColumnDefinition
ATExecAddColumn
do_autovacuum
transformRuleStmt
RelationInitIndexAccessInfo
btree_xlog_delete_page
pg_lock_status
CreateConstraintEntry
record_recv
heap_lock_tuple
tsvector_update_trigger
analyze_rel
ExecInitSubPlan
NUM_processor
ExecGrant_Database
pg_stat_get_activity
pg_stop_backup
ExecGrant_Tablespace
init_params
CreateTableSpace
parse_hba_line
btree_predicate_proof
gistContinueInsert
AlterDomainAddConstraint
NUM_numpart_from_char
base_yyparse
MergeAttributes
ATExecAlterColumnType
gtsvector_picksplit
inline_function
eqjoinsel_inner
btcostestimate
====
FREQCALL
====
errfinish
errstart
errmsg
errcode
elog_start
elog_finish
pfree
appendStringInfo
MemoryContextAlloc
MemoryContextAllocZeroAligned
strlen
strcmp
copyObject
pg_strtok
pg_detoast_datum
MemoryContextStrdup
equal
__errno_location
_outNode
GetUserId
MemoryContextAllocZero
appendStringInfoString
lcons
snprintf
errcode_for_file_access
errhint
format_type_be
appendStringInfoChar
LockBuffer
sprintf
LWLockRelease
errdetail
lappend
ScanKeyInit
__ctype_b_loc
__isinf
pg_strcasecmp
__isinff
__isinfl
Float8GetDatum
strncmp
aclcheck_error
parser_errposition
LWLockAcquire
makeString
strcpy
pqsignal
UnlockReleaseBuffer
heap_freetuple
ReleaseSysCache
pg_detoast_datum_packed
SearchSysCache
text_to_cstring
exprType
DatumGetFloat8
free
pg_mblen
hash_search
repalloc
MarkBufferDirty
systable_endscan
makeDefElem
systable_getnext
printf
nodeRead
fabs
get_namespace_name
free_var
initStringInfo
recordDependencyOn
NameListToString
BufferGetBlockNumber
ReleaseBuffer
cstring_to_text
close
list_head9840
superuser
CommandCounterIncrement
exprLocation
strtoul
atoi
SetConfigOption
AllocSetContextCreate
ExecClearTuple
nocachegetattr
strchr
quote_identifier
pq_sendint
DatumGetFloat4
MemoryContextDelete
SetHintBits
MemoryContextReset
list_head3762
ProcessInterrupts
s_lock
errmsg_internal
pq_getmsgint
malloc
makeSimpleA_Expr
add_size
====
SYSCALL
====
io_setup
io_destroy
io_submit
io_cancel
io_getevents
setxattr
lsetxattr
fsetxattr
getxattr
lgetxattr
fgetxattr
listxattr
llistxattr
flistxattr
removexattr
lremovexattr
fremovexattr
getcwd
lookup_dcookie
eventfd2
epoll_create1
epoll_ctl
epoll_pwait
dup
dup3
inotify_init1
inotify_add_watch
inotify_rm_watch
ioctl
ioprio_set
ioprio_get
flock
mknodat
mkdirat
unlinkat
symlinkat
linkat
renameat
umount
mount
pivot_root
nfsservctl
fallocate
faccessat
chdir
fchdir
chroot
fchmod
fchmodat
fchownat
fchown
openat
close
vhangup
pipe2
quotactl
getdents64
read
write
readv
writev
pread64
pwrite64
preadv
pwritev
pselect6
ppoll
signalfd4
vmsplice
splice
tee
readlinkat
sync
fsync
fdatasync
sync_file_range2
sync_file_range
timerfd_create
timerfd_settime
timerfd_gettime
utimensat
acct
capget
capset
personality
exit
exit_group
waitid
set_tid_address
unshare
futex
set_robust_list
get_robust_list
nanosleep
getitimer
setitimer
kexec_load
init_module
delete_module
timer_create
timer_gettime
timer_getoverrun
timer_settime
timer_delete
clock_settime
clock_gettime
clock_getres
clock_nanosleep
syslog
ptrace
sched_setparam
sched_setscheduler
sched_getscheduler
sched_getparam
sched_setaffinity
sched_getaffinity
sched_yield
sched_get_priority_max
sched_get_priority_min
sched_rr_get_interval
restart_syscall
kill
tkill
tgkill
sigaltstack
rt_sigsuspend
rt_sigaction
rt_sigprocmask
rt_sigpending
rt_sigtimedwait
rt_sigqueueinfo
rt_sigreturn
setpriority
getpriority
reboot
setregid
setgid
setreuid
setuid
setresuid
getresuid
setresgid
getresgid
setfsuid
setfsgid
times
setpgid
getpgid
getsid
setsid
getgroups
setgroups
newuname
sethostname
setdomainname
getrlimit
setrlimit
getrusage
umask
prctl
getcpu
gettimeofday
settimeofday
adjtimex
getpid
getppid
getuid
geteuid
getgid
getegid
gettid
sysinfo
mq_open
mq_unlink
mq_timedsend
mq_timedreceive
mq_notify
mq_getsetattr
msgget
msgctl
msgrcv
msgsnd
semget
semctl
semtimedop
semop
shmget
shmctl
shmat
shmdt
socket
socketpair
bind
listen
accept
connect
getsockname
getpeername
sendto
recvfrom
setsockopt
getsockopt
shutdown
sendmsg
recvmsg
readahead
brk
munmap
mremap
add_key
request_key
keyctl
clone
execve
fadvise64_64
swapon
swapoff
mprotect
msync
mlock
munlock
mlockall
munlockall
mincore
madvise
remap_file_pages
mbind
get_mempolicy
set_mempolicy
migrate_pages
move_pages
rt_tgsigqueueinfo
perf_event_open
accept4
recvmmsg
wait4
prlimit64
fanotify_init
fanotify_mark
open
link
unlink
mknod
chmod
chown
mkdir
rmdir
lchown
access
rename
readlink
symlink
utimes
pipe
dup2
epoll_create
inotify_init
eventfd
signalfd
sendfile
ftruncate
truncate
newstat
newlstat
newfstat
fcntl
fadvise64
newfstatat
fstatfs
statfs
lseek
mmap
alarm
getpgrp
pause
time
utime
creat
getdents
futimesat
select
poll
epoll_wait
ustat
vfork
wait4
recv
send
bdflush
oldumount
uselib
sysctl
fork
ni_syscall
====
LOCKCALL
====
pthread_create
pthread_join
pthread_tryjoin_np
pthread_timedjoin_np
pthread_detach
pthread_equal
pthread_attr_init
pthread_attr_destroy
pthread_attr_getdetachstate
pthread_attr_setdetachstate
pthread_attr_getguardsize
pthread_attr_setguardsize
pthread_attr_getschedparam
pthread_attr_setschedparam
pthread_attr_getschedpolicy
pthread_attr_setschedpolicy
pthread_attr_getinheritsched
pthread_attr_setinheritsched
pthread_attr_getscope
pthread_attr_setscope
pthread_attr_getstackaddr
pthread_attr_setstackaddr
pthread_attr_getstacksize
pthread_attr_setstacksize
pthread_attr_getstack
pthread_attr_setstack
pthread_attr_setaffinity_np
pthread_attr_getaffinity_np
pthread_getattr_np
pthread_setschedparam
pthread_getschedparam
pthread_setschedprio
pthread_getname_np
pthread_setname_np
pthread_getconcurrency
pthread_setconcurrency
pthread_yield
pthread_setaffinity_np
pthread_getaffinity_np
pthread_once
pthread_setcancelstate
pthread_setcanceltype
pthread_cancel
pthread_mutex_init
pthread_mutex_destroy
pthread_mutex_trylock
pthread_mutex_lock
pthread_mutex_timedlock
pthread_mutex_unlock
pthread_mutex_getprioceiling
pthread_mutex_setprioceiling
pthread_mutex_consistent
pthread_mutex_consistent_np
pthread_mutexattr_init
pthread_mutexattr_destroy
pthread_mutexattr_getpshared
pthread_mutexattr_setpshared
pthread_mutexattr_gettype
pthread_mutexattr_settype
pthread_mutexattr_getprotocol
pthread_mutexattr_setprotocol
pthread_mutexattr_getprioceiling
pthread_mutexattr_setprioceiling
pthread_mutexattr_getrobust
pthread_mutexattr_getrobust_np
pthread_mutexattr_setrobust
pthread_mutexattr_setrobust_np
pthread_rwlock_init
pthread_rwlock_destroy
pthread_rwlock_rdlock
pthread_rwlock_tryrdlock
pthread_rwlock_timedrdlock
pthread_rwlock_wrlock
pthread_rwlock_trywrlock
pthread_rwlock_timedwrlock
pthread_rwlock_unlock
pthread_rwlockattr_init
pthread_rwlockattr_destroy
pthread_rwlockattr_getpshared
pthread_rwlockattr_setpshared
pthread_rwlockattr_getkind_np
pthread_rwlockattr_setkind_np
pthread_cond_init
pthread_cond_destroy
pthread_cond_signal
pthread_cond_broadcast
pthread_cond_wait
pthread_cond_timedwait
pthread_condattr_init
pthread_condattr_destroy
pthread_condattr_getpshared
pthread_condattr_setpshared
pthread_condattr_getclock
pthread_condattr_setclock
pthread_spin_init
pthread_spin_destroy
pthread_spin_lock
pthread_spin_trylock
pthread_spin_unlock
pthread_barrier_init
pthread_barrier_destroy
pthread_barrier_wait
pthread_barrierattr_init
pthread_barrierattr_destroy
pthread_barrierattr_getpshared
pthread_barrierattr_setpshared
pthread_key_create
pthread_key_delete
pthread_setspecific
pthread_getcpuclockid
pthread_atfork
