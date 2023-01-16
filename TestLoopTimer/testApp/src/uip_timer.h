#ifndef __TIMER_H__
#define __TIMER_H__

#include "clock.h"


struct timer {
  clock_time_t start;
  clock_time_t interval;
  /* KYC : timer activation field */
  int		IsActive;
};

void timer_set(struct timer *t, clock_time_t interval);
void timer_reset(struct timer *t);
void timer_restart(struct timer *t);
int timer_expired(struct timer *t);



#endif /* __TIMER_H__ */
