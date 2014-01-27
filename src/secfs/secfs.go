package main

/*
#include <stdlib.h>
#include <stdio.h>
#include <asm/unistd.h>
#cgo LDFLAGS: -lseccomp
#include <seccomp.h>
#include "seccomp_binding.h"
*/
import "C"

import (
	"log"
)

func init(){

}

func main(){

}

func Sandbox() {
	//fmt.Printf("Attempting to sandbox...\n")
	ctx := C.seccomp_init2()
	if ctx == nil {
		log.Fatalln("Failed to initialize seccomp!")
	}
	// DO SECCOMP STUFFS
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_read)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_write)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_close)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_gettimeofday)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_futex)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_exit_group)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_socket)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_epoll_ctl)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_mmap)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_mprotect)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_munmap)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_accept)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_fcntl)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_getsockname)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_setsockopt)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_rt_sigprocmask)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_clone)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_exit)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_bind)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_pipe)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_listen)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_restart_syscall)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_epoll_create1)

	// Likely unneeded:
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_sigaltstack)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_set_robust_list)
	C.seccomp_filter_call(ctx, C.SCMP_ACT_ALLOW, C.__NR_epoll_wait)

	moo := C.seccomp_load(ctx)
	moo = moo

	rc := C.seccomp_reset(ctx, C.SCMP_ACT_KILL)
	if rc < 0 {
		log.Fatalln("Failed to reset seccomp!")
	}
	log.Printf("Started Seccomp Sandbox.")
}
