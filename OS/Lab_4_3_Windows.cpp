#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

void *new_f(void *n)
{
  int i;
  for (i = 0; i < 30; i++)
  {
    printf("t: %d\n", i);
    // ��� �������� ������ t, ���
    usleep(10000);
  }
  pthread_exit(0);
}

int main()
{
  pthread_t new_th;
  pthread_create(&new_th, NULL, new_f, (void *)0);
  
  int j;
  for (j = 0; j < 30; j++)
  {
    printf("T: %d\n", j);
    // ��� �������� ������ T, ���
    usleep(1000);
  }  

  void *status;
  // �������� ���� t �� ������ T
  pthread_join(new_th, &status);
  
  return 0;
}
