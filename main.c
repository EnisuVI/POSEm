#include <stdio.h>
#include <math.h>

int lux;
int csteIncid=1;
int csteRefl=1;
int iso;
int temps[11]={1/1000, 1/500, 1/250, 1/125, 1/60, 1/30, 1/15, 1/8, 1/4, 1/2, 1};
int ouverture[7]={16, 11, 8, 5.6, 4, 2.8, 2};


int main(){
    printf("Quantité de lumière en Lux ? ");
    scanf("%d",&lux);
    printf("Vitesse de la pellicule ? ");
    scanf("%d",&iso);
    printf("En lumière incidente : Ouverture**2/secondes=%d",(lux*iso)/csteIncid);
    printf("En lumière réfléchie : Ouverture**2/secondes=%d",(lux*iso)/csteRefl);
}