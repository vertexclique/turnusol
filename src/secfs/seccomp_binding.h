#include <seccomp.h>

scmp_filter_ctx seccomp_init2();
int seccomp_filter_call(scmp_filter_ctx ctx, uint32_t action, 
			int syscall);
