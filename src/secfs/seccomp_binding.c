#include "seccomp_binding.h"

scmp_filter_ctx seccomp_init2()
{
	return seccomp_init(SCMP_ACT_TRAP);
}

int seccomp_filter_call(scmp_filter_ctx ctx, uint32_t action, 
			int syscall)
{
	return seccomp_rule_add(ctx, action, syscall, 0);
}
