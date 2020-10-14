#include <stdio.h>
#include <string.h>

int fileexists(const char * filename){
    /* try to open file to check if exists */
    FILE *file;
    if (file = fopen(filename, "r")){
        fclose(file);
        return 1; /* file exists */
    }
    return 0; /* file does not exist */
}

int main(int argc, char **argv){

    int i;
    char str[] = "#!/bin/bash\n";
    char suffix[] = ".sh";

    if(fileexists(argv[1])){
        printf("File already exists\n");
        return 0; 
    }

    if(argv[1]==0){
        printf("Please provide filename or path\n");
        return 0; 
    }

    FILE *fp;
    fp = fopen (strcat(argv[1],suffix), "w"); /* create and open file*/


    for (i = 0; str[i] != '\n'; i++) {
            /* write to file using fputc() function */
            fputc(str[i], fp);
        }

}


