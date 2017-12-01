

//
//  WDShell.c
//  AudioPlayerDemo
//
//  Created by VD on 2017/12/1.
//  Copyright © 2017年 VD. All rights reserved.
//

#include "WDShell.h"
#include <stdlib.h>
#include <unistd.h>

int my_system(const char *command)
{
    pid_t pid;
    int status;
    if (command == NULL)
        return 1;
    
    if ((pid = fork()) < 0)
        status = -1;
    else if (pid == 0)
    {
        execl("/bin/sh", "sh", "-c", command, NULL);
        exit(127);
    }
    else
    {
        while (waitpid(pid, &status, 0) < 0)
        {
            if (errno == EINTR)
                continue;
            status = -1;
            break;
        }
    }
    
    return status;
}

