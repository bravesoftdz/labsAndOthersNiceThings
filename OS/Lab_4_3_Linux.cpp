#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
void *f_new(void *n)
{
  int i;
  for (i = 0; i < 30; i++)
  {
    printf("t: %d\n", i);// ��� �������� ������ t
    usleep(10000);
  }
  pthread_exit(0);
}
int main()
{
  pthread_t n_thr;
  pthread_create(&n_thr, NULL, f_new, (void *)0); 
  int j;
  for (j = 0; j < 30; j++)
  {
    printf("T: %d\n", j);// ��� �������� ������ T
    usleep(1000);
  }  
  void *st;// ������� ������ t �� ������ T  
  pthread_join(n_thr, &st);
  return 0;
}
