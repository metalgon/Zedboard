#include "clock.h"
#include "uip_timer.h"

volatile u32 GlobGigeTimeTick = 0;



void timer_set(struct timer *t, clock_time_t interval)
{
  t->interval = interval;
  t->start = GlobGigeTimeTick;
}

void timer_reset(struct timer *t)
{
  t->start += t->interval;
}

void timer_restart(struct timer *t)
{
  t->start = GlobGigeTimeTick;
}

int
timer_expired(struct timer *t)
{
	return(((u32)(GlobGigeTimeTick - t->start)) >= t->interval);
}
