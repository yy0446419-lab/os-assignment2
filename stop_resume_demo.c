#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    pid_t pid = fork();
    if (pid < 0) { perror("fork"); return 1; }
    if (pid == 0) {
        printf("Child PID %d sleeping for 300 seconds...\n", getpid());
        sleep(300);
        printf("Child done\n");
    } else {
        printf("Parent: started child with PID %d\n", pid);
        sleep(10);
        printf("Parent exiting (child may continue)\n");
    }
    return 0;
}
